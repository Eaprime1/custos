# Plugins

Prima-clock: 202610091148 (UTC)
Suit: ♣️ Club, working copy
Status: proposal. Deck Master review welcome on the layout.

A plugin is a small package that gives a Claude surface new skills or connections.
This folder keeps the **source copy** of each plugin custos uses, so the work is
reviewable and survives the account it was built in.

## What lives here

One folder per plugin, named for the plugin:

```
plugins/<name>/
  .claude-plugin/plugin.json    name, description, author
  .mcp.json                     connections (hosted endpoints only)
  README.md                     what it is, where it runs, who last changed it
  HANDOFF.md                    optional: carry-forward for the next session
  skills/<skill>/SKILL.md       one folder per skill
  skills/<skill>/references/    shared notes a skill reads first
```

## Rules

- **The repo copy is a Carbonite.** The plugin that runs is installed in an account.
  This copy records it. When they differ, say which is newer before editing either.
- **No secrets.** No tokens, keys, workspace invitations or private URLs. Hosted
  endpoints only. A plugin that needs a credential says where the Shepherd supplies it.
- **Stamps are UTC.** Prima-clock stamps in plugin files use UTC, the official clock.
- **Skills carry a Prima-clock line at the end**, after the closing content, so the
  frontmatter stays first and the skill still loads.
- **A plugin proposes; the Shepherd decides.** Skills that change another system
  (statuses, labels, custody entries) propose first and wait for a clear yes.

## Index

| Plugin | What it does | Runs in | Source |
|---|---|---|---|
| `linear` | Suit and Plank labels, seed intake, custody entries and stream returns in Linear (workspace Qrunexusiam, team QRU) | The Shepherd's Claude account | [`linear/`](linear/) |

## Not here

Runtime engines (Termux), device state (`device/`), and issue-tracker automations,
which are configured in the tracker's own settings. Definitions belong in `world/`
and executable behavior in `tools/`; a plugin only holds the instructions that
carry those definitions into another tool.
