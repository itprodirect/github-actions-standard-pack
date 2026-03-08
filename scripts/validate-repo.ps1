param(
    [switch]$PolicyOnly
)

$ErrorActionPreference = "Stop"

function Invoke-NativeStep {
    param(
        [string]$Description,
        [scriptblock]$Command
    )

    & $Command
    if ($LASTEXITCODE -ne 0) {
        throw "$Description failed with exit code $LASTEXITCODE"
    }
}

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$reusableWorkflows = Get-ChildItem ".github/workflows/reusable-*.yaml"
$workflowFiles = Get-ChildItem ".github/workflows/*.yaml"

Write-Host "Validating workflow policy..."

foreach ($workflow in $reusableWorkflows) {
    $content = Get-Content $workflow.FullName -Raw

    if ($content -notmatch "(?m)^permissions:\s*$") {
        throw "Missing top-level permissions block: $($workflow.FullName)"
    }

    if ($content -match "(?m)^[ \t]+id-token:\s+write\s*$") {
        throw "Reusable workflows must not enable id-token: write by default: $($workflow.FullName)"
    }
}

foreach ($workflow in $workflowFiles) {
    $content = Get-Content $workflow.FullName -Raw

    if ($content -match "uses:\s+[^@\s]+@v[0-9]+") {
        throw "Version tags are not allowed for actions in this repository: $($workflow.FullName)"
    }
}

if ($PolicyOnly) {
    Write-Host "Policy validation passed."
    exit 0
}

$nodeModulesPath = Join-Path $repoRoot "examples/node-consumer/node_modules"
$goCachePath = Join-Path $repoRoot ".tmp-go-cache"
$goModCachePath = Join-Path $repoRoot ".tmp-go-modcache"

$env:GOCACHE = $goCachePath
$env:GOMODCACHE = $goModCachePath

New-Item -ItemType Directory -Force $goCachePath | Out-Null
New-Item -ItemType Directory -Force $goModCachePath | Out-Null

try {
    Write-Host "Running Node example checks..."
    Push-Location "examples/node-consumer"
    Invoke-NativeStep "npm ci" { npm ci }
    Invoke-NativeStep "npm run lint" { npm run lint }
    Invoke-NativeStep "npm test" { npm test }
    Invoke-NativeStep "npm run build" { npm run build }
    Pop-Location

    Write-Host "Running Python example checks..."
    Push-Location "examples/python-consumer"
    Invoke-NativeStep "python -m ruff check ." { python -m ruff check . }
    Invoke-NativeStep "python -m pytest" { python -m pytest }
    Invoke-NativeStep "python -m pip wheel --no-deps --no-build-isolation . -w dist" { python -m pip wheel --no-deps --no-build-isolation . -w dist }
    Pop-Location

    Write-Host "Running Go example checks..."
    Push-Location "examples/go-consumer"
    Invoke-NativeStep "go vet ./..." { go vet ./... }
    Invoke-NativeStep "go test ./..." { go test ./... }
    Invoke-NativeStep "go build ./..." { go build ./... }
    Pop-Location
}
finally {
    while ((Get-Location).Path -ne $repoRoot) {
        Pop-Location
    }

    if (Test-Path $nodeModulesPath) {
        Remove-Item -Recurse -Force $nodeModulesPath
    }

    foreach ($path in @(
        $goCachePath,
        $goModCachePath,
        "examples/python-consumer/dist"
    )) {
        if (Test-Path $path) {
            Remove-Item -Recurse -Force $path
        }
    }
}

Write-Host "Local validation passed."
