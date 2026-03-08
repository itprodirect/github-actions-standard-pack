# Consuming the Docker Workflow

## Workflow path

Use:

`itprodirect/github-actions-standard-pack/.github/workflows/reusable-docker-build.yaml@v0.1.0`

Prefer an immutable tag or commit SHA.

## Supported inputs

- `image_name`
- `dockerfile`
- `context`
- `push`
- `platforms`

## Example

```yaml
name: docker

on:
  pull_request:
  push:
    branches:
      - main

jobs:
  build:
    uses: itprodirect/github-actions-standard-pack/.github/workflows/reusable-docker-build.yaml@v0.1.0
    with:
      image_name: ghcr.io/example-org/example-app
      dockerfile: Dockerfile
      context: .
      push: false
      platforms: linux/amd64
```

## Notes

- `push: true` is intentionally not implemented in v0 and will fail with guidance rather than assuming registry credentials.
- Multi-platform builds are intentionally out of scope for v0. `platforms` must contain a single platform value.
- This workflow is implemented and documented in v0, but it is not exercised by a repo CI example consumer yet.
