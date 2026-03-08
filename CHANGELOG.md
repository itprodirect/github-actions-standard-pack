# Changelog

## Unreleased

- Harden the v0 baseline so required checks, example-backed coverage, and local validation behavior match the repo's intended contract.
- Add Go and Docker example consumer coverage so Node, Python, Go, and Docker are now contract-tested patterns.
- Add and reconcile consumer docs so the repo truth model distinguishes contract-tested workflows from documented-only workflows.
- Remove accidental Go cache artifacts from `examples/go-consumer`, tighten ignore coverage, and keep successful local validation runs from leaving tracked junk behind.

## v0.1.0 - 2026-03-08

- Initial v0 scaffold for reusable GitHub Actions workflows, docs, examples, and governance files.
