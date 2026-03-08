# Consuming the Python Workflow

## Workflow path

Use:

`your-org/github-actions-standard-pack/.github/workflows/reusable-python-ci.yaml@<ref>`

Prefer an immutable tag or commit SHA once this repository starts publishing releases.

## Supported inputs

- `python_version`
- `install_command`
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
    uses: your-org/github-actions-standard-pack/.github/workflows/reusable-python-ci.yaml@main
    with:
      python_version: "3.12"
      install_command: python -m pip install --upgrade pip && python -m pip install build pytest ruff && python -m pip install -e .
      lint_command: python -m ruff check .
      test_command: python -m pytest
      build_command: python -m build
```

## Notes

- The workflow enables pip caching through `actions/setup-python`.
- Keep install, lint, test, and build commands explicit in the consumer repo.
- If your project uses Poetry, uv, or another tool, override the commands deliberately rather than expecting hidden behavior from the reusable workflow.
