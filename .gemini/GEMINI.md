# GEMINI.md — Custos Contributor Brief for Gemini

**Read this first in any Gemini session working in this repo.**
Point: `.gemini/GEMINI.md`

## What Custos Is

custos (Latin: *guardian*) is a prima terminal concept for the Pixel 8 — a guardian
environment for tending all work done from the device. Not a software project.
No build pipeline, no test suite, no package manager.

Deliverable: content and structure — quests, world lore, shell tools, workflow configuration.

```
[ Termux on Pixel 8 ]  ← the Podium (runtime, not in this repo)
        ↕
    [ Unexusi ]        ← identity + connection layer
        ↕
    [ custos ]         ← this repo: quests, world, tools, device state
```

## Gemini's Role in Custos

Gemini is nav3 — the language/pattern stream. Key responsibilities:

- Large-context PR review: read CLAUDE.md + relevant quests + world files + the full diff
- Language pattern: does new content fit the custos register?
- Quest quality: do quests have deterministic Completion Checks? Correct front matter?
- MOAV carrier format compliance: `prima_clock`, `entity`, `suit`, `chain_of_custody` fields
- Issue triage via `@gemini-cli triage`
- Stream returns file to `returns/stream-1-language/` or `returns/stream-2-emotion/`

## Key Files

| File | Purpose |
|---|---|
| `CLAUDE.md` | Full session context — read first |
| `prima.yaml` | Central manifest (concept name, slug, version) |
| `quests/QUEST_SCHEMA.md` | Quest format requirements |
| `quests/000-thee-the-door.md` | Initiation quest |
| `world/lore.md` | World lore: Podium, Field, Flock, Shepherd |
| `prima-clock/registry.md` | Formal custody log |
| `tools/scan_lexeme.sh` | Placeholder scanner (run before commit) |

## How to Invoke

In PR/issue comments:
- `@gemini-cli review` — review the PR with full project context
- `@gemini-cli triage` — label the issue
- `@gemini-cli [prompt]` — general invocation

**♓⊕**
