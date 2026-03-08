# Test Strategy

## What we validate in v0

This repository does not ship application code. Its test surface is the reusable workflow contract.

The main validation layers are:

- static review of workflow YAML for permissions, ordering, and pinning
- repo CI that calls local reusable workflows against Node, Python, Go, and Docker example consumers
- example consumers that demonstrate real `workflow_call` usage for those tested workflows
- consumer docs that define the current v0 contract for Terraform and Playwright
- manual GitHub-side checks before publishing or versioning

## Current coverage by workflow

- Contract-tested in repo CI: Node, Python, Go, Docker
- Implemented and documented only: Terraform, Playwright
- Preview or stub workflows: none

## Why examples matter

The example consumers in `examples/node-consumer`, `examples/python-consumer`, `examples/go-consumer`, and `examples/docker-consumer` are not filler. They show what a downstream repository actually writes and help catch interface drift:

- required and optional inputs stay understandable
- command defaults remain believable
- docs match the consumer experience

## Follow-up work

The next improvement after the current baseline should be promoting Terraform, if it stays lightweight enough for a real example-backed contract test. Playwright should be evaluated only after that using the same standard.

That validation is now in place via `.github/workflows/repo-ci.yaml` for the Node, Python, Go, and Docker consumers, with Terraform and Playwright still documented honestly until equally lightweight examples are justified.
