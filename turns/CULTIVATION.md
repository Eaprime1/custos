# Cultivation — Threads Ready to Grow

*A pointer for the next code conversation. Each entry below is an idea that
already arrived, took shape in a PR or a design note, and is ready for
someone to pick up — not a backlog to grind through, a field to walk.*

Point a new session at this file first. Read the entry, read the PR it
references, and decide whether to continue it, fold it into something else,
or let it rest a while longer.

---

## Open PRs Carrying Ideas

### PR #22 — Custos Genesis journey (first valuation entry)

**Status:** open, not merged.

Adds the first entries in a new "journey" record-keeping pattern:
`valuation/custos_genesis_journey_202606132130.md`,
`valuation/JOURNEY_SCHEMA.md`, `moav/custos_moav_journey001.json`, a new row
in `prima-clock/registry.md`, and a "Journeys — Session Archives" section in
`branch-tracker/branches.md`.

**Two design conflicts flagged for a Deck Master to reconcile:**

1. **Sovran Shepherd vs. Deck Master** — PR #12 introduces `.sovran/identity.md`
   (Custos as a "sovran shepherd" who asks reviewer-style questions on PRs).
   `world/deck-master.md` describes a separate "Deck Master" reviewer concept.
   These may be the same role under two names, or two roles that need
   distinct jobs. Needs a decision before both land.
2. **Hub suits vs. Five Lakes suits** — `CLAUDE.md` already documents a hub
   suit system using ♠️♦️♣️♥️. PR #17's Five Lakes Valuation system uses the
   same four suits with different meanings (lake-suits). Either these need to
   be unified into one suit vocabulary, or explicitly scoped to different
   contexts so they don't collide.

**Next step:** read PR #22's description for the full journey-entry rationale,
then decide on the two conflicts above before merging — they'll only get
harder to untangle the longer both systems grow independently.

---

### PR #17 — Five Lakes Valuation System (bridge document)

**Status:** open, marked "EXPANDING" / "chain of custody: OPEN".

Adds `valuation/five_lakes_valuation_bridge_202606112205.md`. The PR
description lists files that are *referenced but not yet present*:
`valuation/ledger.csv`, `valuation/folders.md`, `valuation/REPORT.md`.

**Next step:** either complete the missing files so the bridge document has
something to point at, or note in the PR that the bridge stands alone for now
and the ledger/folders/report are a separate follow-up. Also see PR #22's
suit-collision flag above — this PR is the other half of that conflict.

---

### PR #12 — Codacy scoping + Custos sovran identity

**Status:** open.

Adds `.codacy.yml` (scoping), `sovran-voice.yml` (fires on PR open and
`ready_for_review`, posts Custos's shepherd questions — "Does this protect
what has been entrusted here? Who does this serve, and is the care
appropriate? What must Custos know before welcoming this in?"),
`claude-code-review.yml` (needs a `CLAUDE_CODE_OAUTH_TOKEN` secret — the PR
notes this was added to the repo), and `.sovran/identity.md`.

The identity doc names three **planned sub-projects** that don't exist yet:
**Planetarium**, **Vault Manager**, **Device Registry**. None have a quest,
arc, or scaffold yet — they're named intentions, not started work.

**Next step:** confirm the `CLAUDE_CODE_OAUTH_TOKEN` secret is actually set
(otherwise `claude-code-review.yml` will fail silently on every PR), resolve
the Sovran/Deck Master overlap with PR #22, and — if there's appetite — pick
one of Planetarium / Vault Manager / Device Registry to scaffold first.

---

### PR #18 — Establish custos concept identity and workflow system

**Status:** open, head=`main`, base=`mulberry`.

This PR predates and likely overlaps with the foundational work already
merged via PRs #2, #4, #7, #9, and #11 (concept identity, workflow templates,
labels). It may be safe to close as superseded.

**Next step:** diff PR #18 against current `main` — if everything in it is
already present, close it with a note pointing to the PRs that superseded it.
If something unique remains, extract just that piece into a fresh PR and
close #18.

---

## Navigo naming (202609262130)

Several naming schemes are in use at once:
- CLAUDE.md numbers the teams (nav1 Claude, navigo2 Gmail, nav3 Gemini, nav5 ChatGPT).
- Perplexity's draft PRs call Claude "Navigo2".
- On 202609270422 Eric said he'd use **Navigo Claude**, **Navigo Perplexity**
  and **Navigo Unexusi** (the project as primary perspective) until a latest
  update arrives.

**Status:** deferred to that update. Don't rewrite the CLAUDE.md table or the
Perplexity PRs before it arrives.

## atelier/ has two definitions (202609262130)

- CLAUDE.md and `atelier/README.md`: "concepts before they have names".
- `.shadow-well/README.md`: "atelier names things and develops them".

#342 followed CLAUDE.md. **Status:** open for Eric's decision.

## Process Seeds

### Trigger a GitHub Action when a PR merges

Came up in conversation: can an Action fire specifically when a merge lands?
Yes — two options, both straightforward additions when there's a concrete
thing to automate:

- `on: pull_request` with `types: [closed]`, guarded by
  `if: github.event.pull_request.merged == true` — fires only on real merges,
  not on closed-without-merging.
- `on: push` with `branches: [main]` — fires on anything landing on `main`,
  including a squash-merge (which is itself a push).

Precedent already in the repo: `final-review.yml` (PR #15) uses
`workflow_dispatch` for an on-demand strict review pass, and
`sovran-voice.yml` (PR #12, still unmerged) fires on PR open/ready-for-review.
A merge-triggered workflow would slot in alongside these. Worth deciding
*what* it should do (e.g., update `device/active.md` automatically, or post a
"this landed" note) before adding the trigger itself.

### Branch deletion does not lose PR content

Also came up: if an old branch is deleted after its PR merges, is anything
lost? For a squash merge, no — the squashed commit carries the full diff onto
`main` permanently, and the PR page (description, comments, review threads)
stays on GitHub indefinitely regardless of whether the source branch still
exists. What *does* disappear is the branch's individual incremental commit
history — but since the squash commit already captures the net result, that
history isn't needed to recover the work. Safe to delete merged branches.

---

*Updated: 2026-06-14*
*Prime state: 3* 🃏

## Age gate counts from creation (202610070905)

`auto-finalize.yml` counts a PR's age from creation. A PR opened as a draft and marked
ready later can pass the one-hour gate the moment it is ready. Raised in #425, unchanged
since. **Status:** open for the Shepherd's decision. One option: count from the
`ready_for_review` event.

## Observation and the seal (202610070905)

The oversight observation (turns/observations/) sits in front of the seal. `finalize-pr.yml`
does not check for it. Whether the seal should refuse without an observation document is a
choice not yet made; the box and the cue record only show it. **Status:** open; the box
is advisory for now.

## Shepherd, Navigator and Navigo (202610091148)

Three words from one family are in use or on the way, and they overlap:

- **Shepherd** names the operator (`world/lore.md`: players are Shepherds). It also names
  Custos's own voice in the workflows ("the shepherd closes the fold") and the "sovran
  shepherd" of PR #12, the conflict filed above.
- **Navigo** is a seat or voice. CLAUDE.md makes it a paired team (AI plus eaprime1), so
  the Shepherd sits inside "Navigo Claude". An earlier registry gave the numbers
  differently: navigo0 the joint voice (the Us), navigo1 Eric, navigo2 Claude, navigo16
  editors and trackers such as Linear
  (`chat · Hopechest project content development · u202609010154 · de5d0cd4`;
  `chat · Custos as third perspective contributor · u202608110857 · 89c43529`).
- **Navigator** is new. On 202610091144 the Shepherd raised it for the idle adventure (the
  concept seeded in `chat · Custom assistant conversation mapping system · u202606240912 ·
  580ebd3c`), as a role that would include the whole navigation system. It shares its stem
  with Navigo, so the two can be taken for each other.

Navigo names are **claimed, not assigned**, and a vacated one waits for a real claiming
(`doc · 202607191800_manifest_of_My_claiming_narrative.md · 202607191800`). So this is the
Shepherd's choice, and the table in CLAUDE.md stays as it is until the naming update
arrives (see "Navigo naming" above).

**Questions for the Shepherd:** is Shepherd a role (the human in the Us) or a seat? Does
Navigator name a role over the navigation system, or a voice inside it? Should the word
differ enough from Navigo that nobody has to ask?

**Status:** open for the Shepherd's decision. `world/shepherd-copy.md` uses "Shepherd"
only for the operator and does not adopt "Navigator".
