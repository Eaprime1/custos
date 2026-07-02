# Dungeon Master

This directory is DM's domain. It sits **adjacent to** `domos/` (the Vault),
not inside it — influenced by the origin, not overwriting it. This is the
Hitchhiker principle applied to the narrative engine: rides alongside
without being captured.

## What This Is

The Custos Chronicle: an idle narrative engine that converts real repository
activity (PRs, branches, plank promotions, stream returns) into a living
mythology. No fabricated progress, no fake lore — every story event is
tethered to something that actually happened in the repos.

The output is a **Chronicle Page**: a polished artifact produced at the end
of each adventure arc, readable as a document, preservable as a growing book.

> *"The Chronicle Page is not fiction added to the repo. It is the narrative
> form of real system motion."* — DM

Full design: [`custos-chronicle-master-plan.md`](./custos-chronicle-master-plan.md), prima-clock 202606140000.

## Structure

- `narrative-engine/` — the engine's reference data and template:
  - `world-state.json` — current state of all kingdoms/quests
  - `characters.md` — daemon definitions (placeholder — full set is DM's
    next return)
  - `triggers.yml` — event → Chronicle trigger mapping (reference only, not
    wired to automation yet)
  - `chronicle-template.md` — the approved Chronicle Page format
- `chronicles/` — completed Chronicle Pages, one per adventure arc
- `quests/` — active quest log (open branches), one file per branch
- `expeditions/` — active PR log (open PRs), one file per PR
- `pr-harvest/` — seeds extracted from closed PRs
- `registry/` — queryable indices (`characters.json`, `kingdoms.json`,
  `events.json`) so history stays queryable as the Chronicle grows

## Status — Phase 1 of the Master Plan

Structure only. This spawn built the gate, not the kingdom:

- ✅ Directory tree
- ✅ `chronicle-template.md`
- ✅ `world-state.json`
- ✅ `characters.md` (placeholder)
- ✅ `triggers.yml` (placeholder)
- ✅ `registry/` (characters.json, kingdoms.json, events.json)
- ✅ Chronicle 0001 — "The Third Aspect Arrives" (manually seeded, see
  `chronicles/202606140000_the-third-aspect-arrives.md`)

## What Was NOT Built (held for later)

- ❌ AI narration / LLM automation
- ❌ Character conversations
- ❌ PR comment parsing
- ❌ GitHub Action complexity
- ❌ Chronicle Book generation (3/3 output)
- ❌ Multi-agent orchestration

## Hold Notes (from the Master Plan, Section IX)

- Do not build the Chronicle Book structure yet — that's a 3/3 output
- Do not assign DM inside `domos/` — adjacent, not vault-level
- Wait for the first GitHub Action test before expanding the trigger list
- `@Agnoscere identify` is a wild card — hold until the engine runs

*One Nth radian per turn. Honest. Directional. Willing.*
*∞pace∞*
