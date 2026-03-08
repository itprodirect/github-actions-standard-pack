# Consuming the Terraform Workflow

## Workflow path

Use:

`itprodirect/github-actions-standard-pack/.github/workflows/reusable-terraform-ci.yaml@v0.1.0`

Prefer an immutable tag or commit SHA.

## Supported inputs

- `terraform_version`
- `working_directory`
- `run_plan`

## Example

```yaml
name: terraform

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  validate:
    uses: itprodirect/github-actions-standard-pack/.github/workflows/reusable-terraform-ci.yaml@v0.1.0
    with:
      terraform_version: "1.9.8"
      working_directory: infra
      run_plan: false
```

## Notes

- The workflow runs `fmt`, `init -backend=false`, and `validate` by default.
- `run_plan` is opt-in because v0 does not assume cloud credentials, backends, or provider-specific auth.

