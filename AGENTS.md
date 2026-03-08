# Repository Guardrails

## Mission boundary

This repository exists to publish reusable GitHub Actions workflows and the minimum supporting docs needed to consume them safely.

Allowed scope:

- Reusable CI workflow definitions under `.github/workflows/`
- Consumer-facing docs and examples
- Security, versioning, and contribution guidance for workflow consumers
- Lightweight maintenance automation such as Dependabot configuration

Out of scope:

- Business application code
- Cloud-specific deployment orchestration
- Kubernetes manifests or deployment platforms
- Custom GitHub runners or self-hosted runner assumptions
- Large abstraction layers, generators, or internal frameworks

## Change control rules

Do not change the following without an ADR:

- Default permissions model
- OIDC stance
- Versioning contract for reusable workflows
- Repository scope and non-goals
- The decision to standardize on reusable workflows via `workflow_call`

Do not widen the repo mission through convenience edits. If a change adds cloud/provider behavior, product logic, or repo-specific exceptions, it belongs somewhere else unless an ADR explicitly says otherwise.

## Editing expectations

- Keep workflows readable over clever.
- Prefer small, explicit inputs over broad configurability.
- Pin external actions by full commit SHA where practical.
- Treat examples as contract documentation, not demos to embellish.
- Update docs in the same change when a workflow interface changes.
