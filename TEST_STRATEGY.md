# Test Strategy

## What we validate in v0

This repository does not ship application code. Its test surface is the reusable workflow contract.

The main validation layers are:

- static review of workflow YAML for permissions, ordering, and pinning
- repo CI that calls local reusable workflows against Node, Python, and Go example consumers
- example consumers that demonstrate real `workflow_call` usage for those tested workflows
- consumer docs that define the current v0 contract for Docker, Terraform, and Playwright
- manual GitHub-side checks before publishing or versioning

## Current coverage by workflow

- Contract-tested in repo CI: Node, Python, Go
- Implemented and documented only: Docker, Terraform, Playwright
- Preview or stub workflows: none

## Why examples matter

The example consumers in `examples/node-consumer`, `examples/python-consumer`, and `examples/go-consumer` are not filler. They show what a downstream repository actually writes and help catch interface drift:

- required and optional inputs stay understandable
- command defaults remain believable
- docs match the consumer experience

## Follow-up work

The first improvement after v0 should be self-validation in GitHub Actions for changed reusable workflows and examples. That can remain small: syntax validation, contract smoke checks, and a release gate.

That validation is now in place via `.github/workflows/repo-ci.yaml` for the initial Node, Python, and Go consumers, with the remaining workflow types documented honestly until equally lightweight examples are justified.
