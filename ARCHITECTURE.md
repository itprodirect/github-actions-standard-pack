# Architecture

## Role in the portfolio

`github-actions-standard-pack` is a horizontal dependency. Future repositories consume it rather than re-implementing their own CI control plane. That makes this repo one of the first leverage points in the platform portfolio: a change here can improve or destabilize every downstream consumer.

## Design choices

- Reusable workflows are exposed through `workflow_call`.
- Workflow interfaces stay intentionally small and human-readable.
- Security defaults are applied in the shared layer so downstream repos inherit them automatically.
- Examples document the intended consumer contract and double as lightweight validation fixtures.

## Internal layout

- `.github/workflows/`: reusable workflow interfaces
- `.github/ISSUE_TEMPLATE/` and `.github/pull_request_template.md`: maintenance hygiene
- `docs/`: consumer documentation and governance notes
- `examples/`: minimal downstream callers
- `adr/`: architecture decisions for scope and governance

## Trust model

Downstream repositories trust this repo to execute CI steps safely and predictably. That means:

- permissions should default to least privilege
- any auth or publishing behavior must be explicit
- breaking interface changes must be versioned
- examples and docs must remain aligned with actual workflow behavior
