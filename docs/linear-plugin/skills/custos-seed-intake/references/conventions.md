# Custos / THE-UNEXUS — Linear conventions

## Workspace facts (read from Linear)
- Workspace: Qrunexusiam (linear.app/qrunexusiam)
- Team: Qrunexusiam, key QRU (the only team)
- Projects: Primoris (P-QRU-2, backlog constellation of seeds), Shadow Awareness Navigation Framework (P-QRU-1)
- Statuses: Backlog, Todo, In Progress, In Review, Done, Canceled, Duplicate
- Labels: Bug, Improvement, Feature, plus two label groups created 2026-10-09 (UTC). Suit group: Seed (♦️), Carbonite (♣️), Aethereal (♥️), Pinnacle (♠️). Plank group: Germ, 1/3 Plank, 2/3 Plank, 3/3 Plank, Crystallized. Linear does not allow emoji in label names, so the suit emoji live in the label descriptions and in the issue header. Apply exactly one Suit label and one Plank label per seed issue, and keep the header text in sync with them.

## Role of Linear in the system
Linear is the technical backbone: architecture, protocols, entity definitions, evolution tracking. WordPress (unexusi.com) is the public publication layer. GitHub (eaprime1/*) holds repos that branches extract into. Custos is the routing and custody hub; it does not develop things.

## Issue title pattern (match existing issues)
`<emoji> NAME — Short descriptor | Key phrase | Key phrase`

## Issue body header (match existing issues)
```
# <emoji> NAME — Descriptor

**Prima-clock:** YYYYMMDDHHMM (UTC)
**Iteration:** Blackjack 21
**Origin:** <Custos / Navigo session | Stream N return from <agent> | upload>
**Motion State:** <suit emoji> <plank>
**Destination:** <eaprime1/repo or "undetermined">

## What This Is
...
```

## Suit and plank
- Suits: ♦️ Seed, ♣️ Carbonite (working copy), ♥️ Aethereal (living copy), ♠️ Pinnacle (single master; vault copy)
- Planks: Germ, 1/3, 2/3, 3/3, Crystallized
- Prima-clock stamp format: YYYYMMDDHHMM in UTC. UTC is the official clock. Eric's home time zone is Pacific, so when he gives a local time, convert it to UTC for the stamp and mention the Pacific equivalent in prose if useful. Get the current time from the time tool; never guess it.

## Status mapping (confirmed by Eric)
- Germ, 1/3 -> Backlog
- 2/3 -> Todo or In Progress if being actively worked
- 3/3 -> In Review (ready for Prima Iteration)
- Crystallized/Pinnacle or extracted to its own repo -> Done, with a comment recording the departure
- Superseded -> Duplicate; abandoned -> Canceled

## Known branches (as of project description 202605271650)
121-architecture (♦️ 2/3, eaprime1/121); diamond-reservoir (♦️ 1/3); milkweed-vectors, fodere-runyatr-agnoscere, photo-anchors, sensory-lexicon, apex-milkweed-tree, viceroy-architecture, ka-boundary-dynamics, blackjack-card-concepts (all ♦️ Germ). Check Linear for current state before relying on this list.

## Working in Linear
Eric is still learning Linear and expects things to be out of whack at first. Tidy as you go: prefer small, reversible changes, say what you changed, and surface mismatches (wrong status, missing project, duplicate issues) instead of silently fixing large batches. Linear automations are configured in Linear's own settings, not through this plugin; suggest candidates, don't claim to have set them up.
