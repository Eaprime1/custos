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

