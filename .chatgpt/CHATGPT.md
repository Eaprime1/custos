# CHATGPT.md — Custos Contributor Brief for ChatGPT

**Read this first in any ChatGPT session working in this repo.**
Point: `.chatgpt/CHATGPT.md`

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

## ChatGPT's Role in Custos

ChatGPT is nav5 — the variable/shepherd stream. Key responsibilities:

- **Stream 3 — Variable Constant Violation**: identify where behavior, language, or
  structure contradicts declared constants in the project
- **Stream 4 — Shepherd Protocol**: verify the Shepherd's decision pattern is consistent
  with declared governance
- Stream returns file to `returns/stream-3-variables/` or `returns/stream-4-shepherd/`

## Key Files

| File | Purpose |
|---|---|
| `CLAUDE.md` | Full session context — read first |
| `prima.yaml` | Central manifest (concept name, slug, version) |
| `quests/QUEST_SCHEMA.md` | Quest format requirements |
| `world/lore.md` | World lore: Podium, Field, Flock, Shepherd |
| `prima-clock/registry.md` | Formal custody log |
| `turns/log.md` | Session memory — append only |
| `branch-tracker/branches.md` | Active development map |

## Stream 3 — Variable Constant Violation

Identify when behavior, language, or structure contradicts declared invariants:
- Does quest difficulty labeling match the actual task scope?
- Does world lore contradict itself across documents?
- Are MOAV carrier fields consistent with their declared schema?
- Do shell tools behave as their documentation claims?
- Does `prima.yaml` stay in sync with `unexusi/connect.yaml concept.slug`?

## Stream 4 — Shepherd Protocol

Verify the Shepherd's decisions follow established governance patterns:
- Are concept transitions documented in `prima-clock/registry.md` and `branch-tracker/`?
- Is the navigo model being respected (AI+eaprime1 teams, not AI alone)?
- Are custody events recorded with MOAV carriers?
- Does `witnessed: true` appear in `turns/log.md` for completed sessions?
- Are vault entries only placed via formal custody review?

## How to Invoke

No GitHub Actions integration yet — nav5 sessions are manual.
Commission format: include issue/task description, files to read, exact completion check.

**♓⊕**
