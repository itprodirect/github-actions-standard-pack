# ADR-0001: Reusable workflow standardization is the first platform repo

## Status

Accepted

## Date

2026-03-08

## Context

The portfolio needs a first shared dependency that is useful immediately, low-risk to adopt, and credible in real consulting environments. Most new repositories need CI before they need infrastructure abstractions or deployment platforms.

Without a shared workflow repo:

- every repository reimplements build, test, lint, and baseline security checks
- permissions and action pinning drift quickly
- starter repos copy stale YAML forward
- platform guidance stays aspirational instead of executable

## Decision

Create `github-actions-standard-pack` as the first horizontal repository in the portfolio.

The repo will:

- publish reusable workflows through `workflow_call`
- centralize consistent CI standards
- default to least privilege
- avoid business logic and cloud-specific deployment behavior
- stay intentionally small for v0

## Consequences

Positive:

- faster bootstrapping for future repositories
- more consistent security posture
- clearer consulting-ready starting point
- lower maintenance cost than duplicated workflow files

Tradeoffs:

- changes in this repo can affect many consumers
- workflow contracts must be versioned carefully
- there is pressure to add non-standard edge cases that should be resisted
