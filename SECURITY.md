# Security

## Security model

This repository is secure-by-default on purpose because it will become a shared dependency across multiple repositories.

Baseline controls:

- reusable workflows default to `permissions: contents: read`
- external actions are pinned by full commit SHA where used
- secrets are not required for the default CI paths
- OIDC is not enabled by default
- provider-specific publishing logic is intentionally absent from v0

## Pinned actions

The reusable workflows currently pin:

- `actions/checkout`
- `actions/setup-node`
- `actions/setup-python`
- `actions/setup-go`
- `hashicorp/setup-terraform`

When updating a pinned action:

1. Review the upstream release notes.
2. Update the full commit SHA, not just a version tag.
3. Re-check workflow permissions and inputs.
4. Update docs or examples if behavior changes.

## Secrets policy

- Do not add long-lived credentials to this repository.
- Do not design reusable workflows that silently assume cloud credentials.
- If a future workflow needs secrets, document the exact secret names, purpose, and permissions impact.
- Prefer short-lived federation patterns over stored secrets when a real deployment use case exists.

## OIDC stance

OIDC is intentionally excluded from v0 because this repo is focused on build, test, lint, and baseline validation. If a future workflow needs OIDC:

- add it only to the job that performs authentication
- keep the rest of the jobs at least privilege
- document the trust boundary and target identity provider
- record the decision in an ADR

## Reporting

For now, security issues should be reported privately to the repository maintainers rather than filed publicly if they could expose a bypass or credential handling flaw.
