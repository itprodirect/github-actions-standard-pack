# github-actions-standard-pack

`github-actions-standard-pack` is the first horizontal dependency in this platform engineering portfolio. It centralizes boring, reusable CI standards so future repositories can inherit consistent build, test, lint, and baseline security gates without copying workflow logic repo by repo.

## Why this repo exists

- Standardize CI behavior across future starter repos and client-facing accelerators.
- Keep shared automation in one place instead of scattering workflow YAML through every consumer repo.
- Make security defaults visible and repeatable: pinned actions, least-privilege permissions, and no silent OIDC usage.
- Stay practical. This repo exists to enforce standards, not to become a platform product.

## What is included

Reusable workflows under `.github/workflows/`:

- `reusable-node-ci.yaml`
- `reusable-python-ci.yaml`
- `reusable-go-ci.yaml`
- `reusable-docker-build.yaml`
- `reusable-terraform-ci.yaml`
- `reusable-playwright.yaml`

Supporting repo assets:

- Dependabot baseline for GitHub Actions, npm, and pip
- CODEOWNERS for repository ownership clarity
- Repo CI that exercises selected reusable workflows against local example consumers
- A minimal release workflow for publishing GitHub releases from version tags
- Issue templates and a pull request template
- Consumer examples for Node, Python, and Go
- ADR, architecture, security, test strategy, roadmap, and runbook docs

## Consumption model

Downstream repositories call these workflows with `workflow_call`.

```yaml
jobs:
  ci:
    uses: itprodirect/github-actions-standard-pack/.github/workflows/reusable-node-ci.yaml@v0.1.0
    with:
      node_version: "22"
      package_manager: npm
      install_command: npm ci
      lint_command: npm run lint
      test_command: npm test
      build_command: npm run build
```

Replace `itprodirect` with your real owner only if you fork this repository. Prefer a release tag or commit SHA over a floating branch reference.

## Available workflows

### Node

Runs install, lint, test, and build in order with built-in caching for `npm`, `pnpm`, or `yarn`.

See [docs/consuming-node-workflow.md](docs/consuming-node-workflow.md).

### Python

Runs install, lint, test, and build in order with pip caching.

See [docs/consuming-python-workflow.md](docs/consuming-python-workflow.md).

### Go

Runs lint, test, and build with `actions/setup-go` caching.

See [docs/consuming-go-workflow.md](docs/consuming-go-workflow.md).

### Docker

Builds a Docker image locally on GitHub-hosted runners. Publishing is intentionally not baked in for v0. Consumers must add registry-specific auth later, with explicit permissions review.

See [docs/consuming-docker-workflow.md](docs/consuming-docker-workflow.md).

### Terraform

Runs `fmt -check`, `init -backend=false`, and `validate`. `plan` is opt-in and off by default.

See [docs/consuming-terraform-workflow.md](docs/consuming-terraform-workflow.md).

### Playwright

Provides a small reusable smoke-test skeleton for browser automation without creating a full testing framework inside this repo.

See [docs/consuming-playwright-workflow.md](docs/consuming-playwright-workflow.md).

## Validation Coverage

- Contract-tested in repo CI: Node, Python, and Go.
- Implemented and documented only in v0: Docker, Terraform, and Playwright.
- No preview or stub workflows are published in v0.

## Security posture

- Default workflow permissions are `contents: read`.
- Third-party and official external actions are pinned by full commit SHA where used.
- No reusable workflow consumes secrets by default.
- `id-token: write` is not enabled in v0. It should only appear in a dedicated auth job when a real OIDC use case exists.
- This repo is CodeQL-ready by design: consumers can layer a repo-local CodeQL workflow alongside these reusable CI workflows without overlapping responsibilities.

See [SECURITY.md](SECURITY.md) and [docs/security-model.md](docs/security-model.md).

## Versioning

Workflow contracts are versioned intentionally. Any breaking input or behavior change should trigger a major version bump and supporting docs update.

See [docs/versioning.md](docs/versioning.md). The first published ref is `v0.1.0`.

## Example consumers

- [examples/node-consumer/.github/workflows/ci.yaml](examples/node-consumer/.github/workflows/ci.yaml)
- [examples/python-consumer/.github/workflows/ci.yaml](examples/python-consumer/.github/workflows/ci.yaml)
- [examples/go-consumer/.github/workflows/ci.yaml](examples/go-consumer/.github/workflows/ci.yaml)

These examples are the baseline contract tests for the v0 workflows that currently have repo-backed examples. If they drift from the reusable workflows, the repo is already losing value.

## Repo validation

This repository also validates itself with [`.github/workflows/repo-ci.yaml`](.github/workflows/repo-ci.yaml). That workflow:

- runs policy checks for permissions, action pinning, and accidental OIDC creep
- calls the local Node reusable workflow against `examples/node-consumer`
- calls the local Python reusable workflow against `examples/python-consumer`
- calls the local Go reusable workflow against `examples/go-consumer`

Maintainers can also run `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate-repo.ps1` for a local policy and example validation pass before opening a pull request.
