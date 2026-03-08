# Roadmap

## v0

- Establish reusable workflows for Node, Python, Go, Docker, Terraform, and Playwright
- Publish baseline docs, examples, and governance
- Add Dependabot and issue templates

## Current status after this session

- Contract-tested: Node, Python, Go, Docker
- Implemented and documented only: Terraform, Playwright
- Preview or stub workflows: none

## Next sensible steps

- Keep the v0 contract small and credible: Terraform is the next candidate for lightweight example-backed validation if it can be tested without cloud assumptions or heavy fixtures
- Revisit Playwright after Terraform and apply the same standard: small downstream example, clear contract, no framework sprawl
- Cut versioned releases and switch examples to immutable refs
- Add a CodeQL companion workflow pattern for consumers
- Add release notes automation once change volume justifies it

## Next session focus

1. Audit whether Terraform can be promoted from documented-only to minimally contract-tested with a tiny local example.
2. If Terraform stays lightweight, wire it into repo CI and local validation with the same honesty standard used for Docker.
3. Reconcile Terraform docs, README truth model, and test strategy together.
4. Only after Terraform is settled, evaluate whether Playwright deserves the same treatment or should remain documented-only in v0.

## Explicitly not planned for now

- deployment orchestration
- cloud-specific auth workflows
- monorepo generators
- custom runner fleets
- opinionated release pipelines for applications
