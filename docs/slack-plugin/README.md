# Slack plugin for Custos / THE-UNEXUS

Customized copy of the Slack plugin (name stays `slack`). Keeps the hosted Slack MCP connection and adds three skills:

- `custos-session-close` — draft and post a session-close dispatch to #custos in the established format
- `custos-turn-notice` — a short turn-opens or turn-closes post
- `custos-channel-brief` — read #custos and route what is there (links, fragments, open steps)

Shared conventions: `skills/custos-channel-brief/references/conventions.md`.

Slack is for the handoff moment, not the record. Posts are drafted first and sent only after a clear yes.
Prima-clock stamps are UTC (official). Authored 202610092015 UTC.
