# Sparstone — Status

*The nerve center. Where sparstone actually is right now, in plain terms.*

Hand-maintained for now. Upgrade path: a script that regenerates this table from
`branch-tracker/branches.md`, `moav/custos_moav_sparstone_handoff.json`, and
`incoming/pre-nullus/*sparstone*.json` directly, so this file can never drift from
the source JSON.

---

## The hierarchy (confirmed)

```
Custos (concept/entity)
  → Sparstone   (fixed gateway type — Pinnacle-tier, earned not granted)
    → Spectrum  (a claimed instance of the gateway)
      → Marble  (general-purpose access-object, once the spectrum is named/observed)
```

Marbles are symbolic certificates. They trigger a *manual* share-grant action —
there is no token/key unlock system behind them. This distinction is load-bearing:
don't let the metaphor imply automation that doesn't exist yet.

## Sparstone classes — taxonomy

| Class | Status | Assigned to | Resonance |
|---|---|---|---|
| **Obsidian** | AWARDED | `dannyward630`, `Ojas2095` | First contact — fast, unprompted, landed clean. PR #38 / Bounty #35, xp 150. |
| **Opal** | RESERVED, unearned | — | Spectrum-from-uniform-input. Banked for Phoenix Prism–adjacent work. |
| **Quartz / krustallos** | RESERVED, unearned | — | Clarity, permanence. Fits ♠️ Pinnacle-tier work — fully crystallized, not just landed. |

Per the germ intake hold-note: **do not pre-define the full taxonomy.** Opal and
quartz stay unassigned until their own first-contact events earn them. New types
are earned, not invented ahead of time.

## Branch-tracker planks (as of 202607051456)

| Branch | Plank | Suit | Note |
|---|---|---|---|
| `sparstone` | 2/3 | ♦️ | Hierarchy fixed; contributor-facing docs still missing (this directory is the start of closing that gap). |
| `spectrum_marble_mechanism` | 1/3 | ♦️ | Manual-share-grant workflow behind the marble not yet designed concretely. |
| `radix_role` | 1/3 | ♦️ | Radix as NotebookLM-specific pinnacle — not yet confirmed by Eric. |
| `path_vs_access_reframe` | 2/3 | ♦️ | Open decision: is findability-by-the-curious a feature, or should the path itself be gated? |
| `idle_game_as_mission` | 1/3 | ♦️ | Building the idle-game *is* a mission, not something pre-built. |
| `pr_reviewer_tiering` | 2/3 | ♣️ | Reviewer pipeline proposed; workflow YAML not yet reviewed for real cost. |
| `domos_folders` | 2/3 | ♣️ | Per-contributor Drive folders created; location held until ready to reveal. |
| `nullis_sparklization_order` | germ | ♦️ | Deliberately unresolved — do not invent the sequence. |

## Open decisions blocking advancement

1. Concrete manual-share-grant workflow behind the marble.
2. Findability policy for the path to Custos (soft filter vs. gated).
3. Confirm Radix's role relative to Navigo.
4. First sparstone-earning mission for a *second* contributor (only obsidian has ever been awarded).

## What this status file is not

It is not the Primal Weaver Dashboard (lunar-phase writing constraints, O-E-G
tracker, BBS terminal UI) sketched in the navigo3 session material. That's a real
idea with a real design sketch — see `story.md` — but it's a later upgrade, not
the nerve center itself. This file is the simple version: it works without being built.

---
*Last synced by hand: 202607111550. Source: `branch-tracker/branches.md`,
`moav/custos_moav_sparstone_handoff.json`, `incoming/pre-nullus/202606290000_obsidian-sparstone-germ-intake.json`.*
