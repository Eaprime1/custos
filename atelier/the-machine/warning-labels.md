# Warning Labels

**Prima-clock:** 202610190449 (UTC)
**Suit:** ♦️ Seed
**Plank:** Germ

*Every module wears one. The label comes first, before the story, and is short enough to read at a glance.*

## Why a scale

Custos already warns the reader first in other places: `payment-demand` tells an AI not
to open payout links, and `anchor-review` marks a claim that lacks an anchor. Those are
single signals. The Machine needs a small ladder, so a player can pick how far to go
before they start.

This scale is plain-language and made for this repo. It has no clinical source and is
not a safety standard. If a module touches something that needs real care, the
right move is to leave it out or to point to a person, not to rely on a label.

## The ladder

| Level | Name | Means | Cap on `peak` |
|---|---|---|---|
| 0 | Tender | Jokes, puzzles and plumbing. Nothing that asks anything of the player's feelings | 0.0 |
| 1 | Steady | A little weight: a reflective line or an unfinished thing named, nothing pressing | 0.25 |
| 2 | Brisk | Some real feeling is possible: surprise, frustration, tenderness. Stop at any step | 0.5 |
| 3 | Deep | Close to something that matters to the player. Opt-in only, with a witness suggested | 0.75 |

There is no level 4. A module that needs one is not shipped. It is held, and the Shepherd
is asked.

## What a label carries

Every module opens with this block, in this order:

```text
WARNING LABEL
Level:      <0-3 and name>
Touches:    <what the module may bring up, in plain words, or "nothing">
Does:       <what it will really do, including any system it contacts>
Needs:      <access it uses, or "none">
Stop:       <how to stop at any step; always "say stop" or skip>
Return:     <how the run ends on zero>
Not for:    <who should skip it, if anyone, or "no one in particular">
```

Rules:

- The label is true or the module is not merged. A joke may be silly; the label may not.
- `Does` names every outside system touched. A module that reaches mail, a calendar, chat, money or a device is at least Steady until a person has run and read it, and needs the Shepherd's yes to run.
- `Touches` never names a diagnosis, never guesses at a player, and never mentions a person who is not in the room.
- A module may lower its own level after review. It may never raise itself without a new label and a new review.
- Level 3 modules are never in the default run.

## Words to stay out of

No promises of healing or cure, no claims about what the module will do for a player's
condition, and no instructions that tell a player how to feel. The Machine offers a
route. The player decides what it was.
