# Consuming the Node Workflow

## Workflow path

Use:

`your-org/github-actions-standard-pack/.github/workflows/reusable-node-ci.yaml@<ref>`

Prefer an immutable tag or commit SHA once this repository starts publishing releases.

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
    uses: your-org/github-actions-standard-pack/.github/workflows/reusable-node-ci.yaml@main
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
