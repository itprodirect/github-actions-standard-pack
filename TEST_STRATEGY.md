# Test Strategy

## What we validate in v0

This repository does not ship application code. Its test surface is the reusable workflow contract.

The main validation layers are:

- static review of workflow YAML for permissions, ordering, and pinning
- repo CI that calls local reusable workflows against example consumers
- example consumers that demonstrate real `workflow_call` usage
- manual GitHub-side checks before publishing or versioning

## Why examples matter

The example consumers in `examples/node-consumer` and `examples/python-consumer` are not filler. They show what a downstream repository actually writes and help catch interface drift:

- required and optional inputs stay understandable
- command defaults remain believable
- docs match the consumer experience

## Follow-up work

The first improvement after v0 should be self-validation in GitHub Actions for changed reusable workflows and examples. That can remain small: syntax validation, contract smoke checks, and a release gate.

That first improvement is now partially in place via `.github/workflows/repo-ci.yaml`, focused on Node and Python because those are the initial example consumers.
