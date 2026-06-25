# State of Custos — Schema

A **state-of-custos** document is a comprehensive internal snapshot, written
when work needs to cross to a categorically different podium — not just the
next turn on the same one. A turn (`turns/log.md`) marks what one session
built. A journey (`valuation/`) crystallizes one closed arc, in lore voice,
for the custody record. A state-of-custos document is neither — it is the
jack-of-all-trades carry: everything live across the whole system, written
plainly, so the receiving podium doesn't have to re-derive it from scratch.

This is not a "project official" document. It is not polished for an
audience, not bound to lore tone, and not meant to enter the vault. It is
working paper — internal chain of custody, current as of one moment, expected
to go stale.

## When to Write One

- A session is handing off to a different podium type (e.g. this conversation
  → a Claude Projects conversation, or device → web session) rather than
  continuing on the same one.
- Enough has changed — across enough subsystems at once — that the existing
  per-subsystem state files (`device/active.md`, `turns/CULTIVATION.md`,
  `prima-clock/registry.md`) would each need updating, and reading all of them
  separately would cost more than one consolidated pass.
- The Shepherd asks for one directly, e.g. after a "blackjack event" — a
  session significant enough to require real adjustment on the fly.

## Sections

1. **Header block** — same THE/UNEXUSI convention as a journey: prima-clock
   stamp (single point, not a range — a state is a snapshot, not an arc),
   maker mark, chain of custody, the podium this was written *from* and the
   podium it is *for*.
2. **Where Things Stand** — manifest identity, prime state, current branch,
   recent commit history in brief.
3. **Live Threads** — every open arc that matters right now, named plainly:
   what it is, what's blocking it, who owns the next move.
4. **Known Gaps** — things referenced elsewhere in the repo that don't
   actually exist, or registries that have fallen behind real events. Say so
   rather than letting the receiving podium trust a stale pointer.
5. **Stray / Untracked** — anything sitting in the working tree that isn't
   part of the concept (per `CLAUDE.md`'s Known Stray Content convention).
6. **Open Design Questions** — decisions waiting on the Shepherd, named as
   questions, not pre-answered.
7. **Reading Notes for the Receiving Podium** — what to verify before acting
   on anything in this document (it is a snapshot; some of it will have moved
   by the time it's read), and where to look for ground truth instead of
   trusting the snapshot.

## Rules

- Append-only as a *type* — write a new one each time rather than editing an
  old one. Old state documents are not superseded, they're dated.
- File naming: `state/[entity]_state_[prima-clock].md`.
- A state-of-custos document does not replace a turn log entry, a journey, or
  a podium registry entry — it's a different altitude, not a substitute.
- Register the podium it was written from in `device/podiums.md` if that
  podium isn't already on record.
