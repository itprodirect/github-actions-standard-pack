# Consuming the Go Workflow

## Workflow path

Use:

`itprodirect/github-actions-standard-pack/.github/workflows/reusable-go-ci.yaml@v0.1.0`

Prefer an immutable tag or commit SHA.

## Supported inputs

- `go_version`
- `lint_command`
- `test_command`
- `build_command`
- `working_directory`

## Example

```yaml
name: ci

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  ci:
    uses: itprodirect/github-actions-standard-pack/.github/workflows/reusable-go-ci.yaml@v0.1.0
    with:
      go_version: "1.24"
      lint_command: go vet ./...
      test_command: go test ./...
      build_command: go build ./...
```

## Notes

- The workflow enables module caching through `actions/setup-go`.
- Keep any extra tooling explicit in the consumer repo rather than expanding the shared workflow contract.
- This workflow is exercised in repo CI via `examples/go-consumer`.
