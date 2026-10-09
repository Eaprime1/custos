# Linear plugin for Custos / THE-UNEXUS

Prima-clock: 202610091148 (UTC)

Customized copy of the Linear plugin (name stays `linear`). Keeps the hosted Linear MCP connection and adds four skills:

- `custos-seed-intake` — plant a seed as a Linear issue with Suit and Plank labels
- `custos-custody-entry` — Prima Iteration entries and branch-to-repo extraction receipts
- `custos-stream-return` — route external agent returns to the right issues
- `custos-linear-setup` — verify the Suit and Plank labels and tidy the workspace

Shared conventions: `skills/custos-seed-intake/references/conventions.md`.
Prima-clock stamps are UTC (official). First authored 202610091052 UTC.

## Where this lives

This folder is the source copy (a Carbonite) of the plugin installed in the Shepherd's
Claude account. The installed plugin is what runs; this copy is what the repo keeps so
the work survives and can be reviewed. If the two differ, say which is newer before
changing either. Handoff for the next working session: [`HANDOFF.md`](HANDOFF.md).
See [`../README.md`](../README.md) for how plugin folders are laid out.
