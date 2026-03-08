# Changelog

## Unreleased

- Fix main branch required checks to match the real nested reusable-workflow status names.
- Harden the v0 baseline so example-backed coverage, local validation behavior, and repo docs match the intended workflow contract.
- Add Go and Docker example consumer coverage so Node, Python, Go, and Docker are now contract-tested patterns.
- Add and reconcile consumer docs so the repo truth model distinguishes contract-tested workflows from documented-only workflows.
- Remove accidental Go cache artifacts from `examples/go-consumer`, tighten ignore rules for local validation output, and keep successful validation runs from leaving tracked junk behind.

## v0.1.0 - 2026-03-08

- Initial v0 scaffold for reusable GitHub Actions workflows, docs, examples, and governance files.
