# Consuming the Node Workflow

## Workflow path

Use:

`itprodirect/github-actions-standard-pack/.github/workflows/reusable-node-ci.yaml@v0.1.0`

Prefer an immutable tag or commit SHA.

## Supported inputs

- `node_version`
- `package_manager`
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
    uses: itprodirect/github-actions-standard-pack/.github/workflows/reusable-node-ci.yaml@v0.1.0
    with:
      node_version: "22"
      package_manager: npm
      install_command: npm ci
      lint_command: npm run lint
      test_command: npm test
      build_command: npm run build
```

## Notes

- `package_manager` must be `npm`, `pnpm`, or `yarn`.
- The workflow enables built-in dependency caching through `actions/setup-node`.
- `pnpm` and `yarn` consumers rely on Corepack in the runner image.
- This workflow is exercised in repo CI via `examples/node-consumer`.
