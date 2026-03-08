# Consuming the Playwright Workflow

## Workflow path

Use:

`itprodirect/github-actions-standard-pack/.github/workflows/reusable-playwright.yaml@v0.1.0`

Prefer an immutable tag or commit SHA.

## Supported inputs

- `node_version`
- `install_command`
- `test_command`
- `working_directory`

## Example

```yaml
name: browser-smoke

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  smoke:
    uses: itprodirect/github-actions-standard-pack/.github/workflows/reusable-playwright.yaml@v0.1.0
    with:
      node_version: "22"
      install_command: npm ci
      test_command: npx playwright test --grep @smoke
      working_directory: .
```

## Notes

- The workflow installs Chromium with system dependencies on the runner.
- Keep project-specific browser config, traces, and test selection in the consuming repository.
- This workflow is implemented and documented in v0, but it is not exercised by a repo CI example consumer yet.
