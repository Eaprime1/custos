---
id: annuit/001-first-decision
title: "The First Decision 🦋"
arc: annuit
sequence: 1
xp: 100
difficulty: journeyman
estimated_time: "ongoing"
requires: []
unlocks: []
tags:
  - annuit
  - jira
  - iteration-22
  - quest-log
---

**Prima-clock:** 202611010342 UTC · **Plank:** 1/3 (germ). A quest log: content is added as it is found, until the plank is full.

## Lore

The 21st iteration, the blackjack one, is nearly through its liminal window. Nothing restarts. The work morphs into
the 22nd while it is still going: a monarch in its chrysalis, ready to clutch out. The first decision is the nod that
lets the space for concept, time and everything after it begin to develop.

In the Shepherd's words, carried as his and not yet verified: the empty_vector is where the quanta (sparkles
expanded) gather; it could anchor a low-pressure-zone effect, except it does not exist, though it can sometimes
interact as if it did; the passage from empty_vector to anti_vector is the transition.

## Objective

> Gather what is needed to verify the first decision, so that `annuit` can be given on NEXUS-6 with the evidence beside it.

## Tasks

1. Read `atelier/annuit-first-decision/annuit-draft.md` and mark each row of its navigo-read table: verified, framing only, or unconfirmed.
2. Hand `atelier/annuit-first-decision/info-request-202611010100.json` to the conversations that may hold the missing material (items R1 to R5).
3. Collect replies as comments on NEXUS-6. Add each one to the Log below with its source, marked first-hand or second-hand. Do not fill a gap from memory.
4. When the table has no row left unconfirmed, or the Shepherd decides to proceed anyway, record the Shepherd's `annuit` (or `ratihabitio`) in the Log.

## Completion Check

```bash
test -f atelier/annuit-first-decision/annuit-draft.md \
  && test -f atelier/annuit-first-decision/info-request-202611010100.json \
  && python3 -c "import json;json.load(open('atelier/annuit-first-decision/info-request-202611010100.json'))" \
  && grep -Eq "^- .*(annuit|ratihabitio) given" quests/annuit/001-first-decision.md && echo "COMPLETE" || echo "NOT YET"
```

It reads `NOT YET` until a Log line records that the nod (`annuit` or `ratihabitio`) was given. That is intended.

## Reward

100 XP on the prime ladder, and the first seed of the 22nd iteration filled.

## Hints

- The Shepherd decides whether the critical-path point is set now or after the evidence arrives. That is his call; do not set it for him.
- A reply that says "I have nothing on this" is a valid and useful reply.

## Log

Newest at the bottom. One line each: stamp UTC, what, source, first-hand or second-hand.

- 202611010342 · Quest opened from the Shepherd's call at 202610311708 Pacific. Source: Shepherd's message, first-hand.
- 202611010100 · navigo_claude's check-in posted on NEXUS-6, comment 10032. Source: Jira, first-hand.
- 202611010100 · Info request R1 to R5 drafted. Not yet handed to any conversation.
