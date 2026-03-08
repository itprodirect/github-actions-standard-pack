# Changelog

## Unreleased

- Fix main branch required checks to match the real nested reusable-workflow status names.
- Add Go example consumer coverage in repo CI.
- Add Docker example consumer coverage in repo CI and local validation.
- Add consumer docs for Go, Docker, Terraform, and Playwright workflows.
- Remove accidental Go cache artifacts from `examples/go-consumer` and tighten ignore rules for local validation output.
- Tighten local validation cleanup so successful runs do not leave repo junk behind.

## v0.1.0 - 2026-03-08

- Initial v0 scaffold for reusable GitHub Actions workflows, docs, examples, and governance files.
