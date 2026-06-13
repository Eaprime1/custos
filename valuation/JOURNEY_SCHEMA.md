# Journey Schema

A journey is a closed conversation, crystallized. Where `turns/log.md` leaves a
one-line mark per session, a journey is the fuller archive — written when a
session is substantial enough to need its own custody entry before it ends.

File naming: `valuation/[entity]_journey_[prima-clock close].md`

## Sections

Every journey carries these sections, in order:

1. **Header block** — `THE/UNEXUSI` line, symbol, prima-clock open → close range,
   iteration, motion state, maker mark, chain of custody.
2. **Inception Story** — short, evocative narrative of what the session set out
   to do and what actually happened. Lore tone, not a changelog.
3. **Key Dialogue** — a handful of verbatim quotes that mark the session's
   turning points, attributed.
4. **What Arrived — Links** — table of PRs, branches, and files the session
   touched or produced.
5. **Valuation** — the five-question rubric from
   `valuation/five_lakes_valuation_bridge_202606112205.md`, applied to the
   journey document itself. Score → rank, suit assignment (note which suit
   system — see below).
6. **Formal Custody Entry** — the same table format used by Five Lakes:
   Document Name, Prima-clock Open/Close, Iteration, Motion State, Chain of
   Custody, Suit Assignment, Valuation Score, Plank Status, Destination Repo,
   Vault Candidate, Author/Maker, Source Conversation, Verification Anchors.
7. **Notes for Next Iteration** — open questions, follow-ups, and anything the
   next session should read before re-deriving context.

## Suit Systems — a known collision

This repo currently runs two suit systems on the same four symbols:

- **Hub suits** (`CLAUDE.md`): ♠️ vault/pinnacle, ♦️ active development,
  ♣️ sessions/operations, ♥️ reserved.
- **Five Lakes suits** (`valuation/five_lakes_valuation_bridge_*.md`): ♠️ Lacus
  Baikal, ♦️ Lacus Superior, ♣️ Lacus Catatumbo, ♥️ Lacus Aetherius, plus ∰
  Lacus Hope.

A journey should state which system it is using for its suit assignment, or
give both readings if ambiguous. Reconciling the two systems is Deck Master
work, not something a single journey should resolve unilaterally.

## Rules

- A journey is written by the session it describes, before the session ends.
- Vault placement (`vault/spade-of-aces/`) is never self-assigned — a journey
  proposes a score and suit; the Deck Master decides custody.
- A journey does not replace `turns/log.md`. Add a turn entry too.
