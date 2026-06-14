# Closing a Turn

*The checklist for crossing back out — extracting what a session built before its
content moves on to wherever it goes next.*

## What This Is

A code conversation — a session on a conversation-type podium (Claude Code web,
ChatGPT, a VSCode podium, whatever) — does its work inside that session's context.
The context doesn't persist. When the session ends, compacts, or hands off,
anything not written into the repo is gone with it.

Closing is the extraction step: pull the durable parts of a session out of the
conversation and into `turns/`, `device/`, and wherever else they belong — so the
work survives the session that produced it.

## When to Close

- At a natural stopping point in the work
- Before a session is expected to end, compact, or be continued elsewhere
- Whenever asked to "wrap up", "finalize", or "close out"

## The Checklist

1. **Review** — what did this session actually do? Built, fixed, decided, moved.
2. **File loose ends** — any artesian items mid-flow through `queue/artesium-weir/`
   should be CLOSED, not left half-processed.
3. **Turn log** — append one entry to `turns/log.md` per `turns/TURN_SCHEMA.md`.
   intent, contribution, resonance — the one-sentence record.
4. **Active work** — update `device/active.md`: move finished items into "Recently
   Dispatched", carry anything unfinished into "In Progress" or "Arriving".
5. **Podium registry** — if this session is itself a podium
   (`device/podiums.md`), confirm its entry is current. Add a `notes` line if its
   role or scope shifted; update `status` if it's going dormant.
6. **Scan** — `bash tools/scan_lexeme.sh` — leave no unfilled placeholders.
7. **Commit & push** — everything above lands in the repo. The conversation can
   end now; the work doesn't.

## Rules

- Closing is not cleanup tacked on at the end — it's how a session's work outlives
  the session.
- One closing per meaningful session boundary, same cadence as the turn log.
- If a session gets cut off before closing, the next session closes on its behalf —
  read the diff, reconstruct what happened, then run the checklist.
