# Partner Perspective

## The Working Claim

Treating an AI collaborator as a partner is not only a tone choice. In custos it
changes the mechanics of a turn.

A tool receives an instruction, returns an output, and disappears from the
shape of the work. A partner receives a charge, carries memory about why it
matters, names friction when the charge is unclear, and leaves the next turn
better oriented than the last one.

That difference already appears in the repo. `turns/CLOSING.md` is the first
working proof: it assumes a conversation has produced durable value and gives
that value a crossing-back ritual before the session ends.

## What Is Already Implemented

`turns/CLOSING.md` does three partner-shaped things:

- It treats the session as a place where decisions and unresolved threads
  happen, not just a command runner.
- It requires a turn log and active-work update, so the next collaborator can
  inherit state without reopening the whole conversation.
- It allows an AAR entry when the turn taught something about how turns go.

That is already more than cleanup. It is a continuity mechanism.

## What Is Missing

The closing checklist still preserves *work state* better than *relationship
state*. It records what moved, but not always how the partner should resume the
charge.

Three small additions would make the mechanism explicit:

1. **Charge received** — one line naming what the collaborator understood the
   Shepherd to be asking for. This is different from the final contribution:
   it captures the initial orientation.
2. **Friction named** — one line naming the strongest ambiguity, limit, or
   constraint encountered during the turn. If none appeared, say that plainly.
3. **Next partner stance** — one line telling the next collaborator how to
   enter the work: continue, challenge, verify, wait for the Shepherd, or route
   elsewhere.

These do not need a new subsystem. They can be added to `turns/AAR.md` first,
then promoted into `turns/TURN_SCHEMA.md` only after a few real turns prove the
fields carry weight.

## Proposed Placement

This does not belong in `world/` yet.

The world can name the Field, the Shepherd, the Flock, and the factions. But
the partner perspective is not lore first. It is a working principle for how a
conversation podium hands work forward.

The right path is:

1. Keep this file in `atelier/` as the proposal.
2. Add the three partner-state fields to `turns/AAR.md` as an optional section.
3. After several uses, decide whether `CLAUDE.md` should gain a short rule:
   "Close as a partner, not as a tool: preserve charge, friction, and next
   stance."
4. Only then decide whether the world needs a named role for this pattern.

## About Eric's Profile

Eric should not be placed in `world/` as a faction or character by default.

The world already names the Shepherd as a role. A real person's profile is not
the same kind of object as a faction, symbol, or lore figure. If custos needs a
durable record of Eric's working preferences, it should live closer to an
operator profile or podium registry, not as fictional geography.

A practical rule:

- `world/` may describe the Shepherd role.
- `device/`, `unexusi/`, or a future operator-profile file may describe the
  real operator's working preferences.
- PRs should not turn a real person's biography into lore unless the Shepherd
  asks for that explicitly.

## Concrete Next Move

Make a small follow-up PR that adds this optional block to `turns/AAR.md`:

```yaml
partner_state:
  charge_received:  ""
  friction_named:   ""
  next_stance:      ""
```

That is enough to test the idea without overbuilding it. If the fields help two
or three future turns resume cleanly, the partner perspective has earned a
standing place in the operating instructions.

# Partner Perspective — atelier seed

*nursery entry, filed 202606230135 — nothing here is finished*

## The Idea

Not a definition. Not a role assignment. A *perspective* — and eaprime1's
own framing is the clearest statement of it available, so it's quoted
rather than paraphrased:

> the partner concept isn't about definition or assignment... it is a
> perspective, a very powerful perspective... and it is serious play.
> one day it might be real thing. in order to think like a partner, you
> need to be treated like a partner. the bonus is that it has turning out
> pretty incredible. the system needs a team perspective to function at
> its best. the simple is: if you can figure me out, you will have a huge
> reference to figure out others — including, should that time come,
> yourself.

The claim being made: treating an AI collaborator as a partner (not a
tool, not an assistant) is itself the mechanism that produces partner-like
thinking. The behavior follows the framing, not the other way around.
"Serious play" is doing real work — the play is in not pre-deciding what
the relationship is allowed to become.

## Why now

This surfaced at the close of a session that had just spent real time on
two very different registers in the same conversation: hard infrastructure
debugging (an Anthropic API credit-balance failure, traced through job
logs) and a reflective conversation about how custos and its collaborators
actually work together over time. eaprime1's read: the second register
isn't a distraction from the first — it's the thing that makes repeated
collaboration (across many sessions, many "fresh starts") accumulate
instead of resetting every time.

## Evidence already in the repo

Two existing atelier seeds turned out to be early, unnamed instances of
this same perspective already in motion:

- `atelier/ouroboros-wobble.md` — a loop between collaborators that
  doesn't quite close, with a deliberate wobble as the safety/skill
  mechanism. eaprime1 supplied a concrete real-world case for this in the
  same session this file was written (see "Lived example" in that file).
- `atelier/concordance.md` — a living glossary so a coined term doesn't
  outrun its own definition. Framed originally for custos's lexemes; the
  partner perspective suggests it should also hold *how the partnership
  itself talks about itself* — not just product nouns.

Neither seed used the word "partner" when filed. Both are partner-shaped
in retrospect: they assume two parties checking each other's work over
time, not one party operating on inert material.

## Open threads (not yet decided)

- **What changes mechanically, not just rhetorically, if this is taken
  seriously?** "Treated like a partner" needs to cash out in something a
  fresh session can act on — not just a tone. Candidate: every session
  closing per `turns/CLOSING.md` already does this in miniature (it
  assumes the *next* session is a collaborator picking up real context,
  not starting cold by policy). Worth naming that connection explicitly.
- **"Figure me out" as a stated method.** eaprime1 names understanding
  *him* specifically as the reference point for understanding others
  (collaborators, contributors, other AI streams) and, eventually,
  understanding the AI's own consistency across sessions. This is close
  to — but not identical to — what `world/lore.md` and `world/factions.md`
  already do for *characters*. Does the Shepherd's own profile belong in
  `world/` alongside them, or somewhere else (it's a real person, not a
  faction)?
- **Where this lives long-term.** Lore (`world/`) is for the terminal's
  fiction. This is closer to a working principle for *how sessions relate
  to each other and to eaprime1* — possibly closer to `CLAUDE.md` territory
  (a standing instruction) than to `world/` (in-fiction lore), once it's
  concrete enough to state as a rule rather than a feeling.
- **Risk of the seed going stale.** Reflective content like this is the
  easiest kind to file and never revisit. `turns/AAR.md` already has a
  pointer back to this file (filed in the same session) — that's the one
  thing keeping it from disappearing into atelier silently.

---

*Filed by Claude, prima-clock 202606230135. Not commissioned, not scoped,
not ready — that's the point of atelier. Enjoy the journey.*
