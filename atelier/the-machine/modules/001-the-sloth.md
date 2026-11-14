# Module 001: The Sloth

**Prima-clock:** 202610190449 (UTC)
**Suit:** ♦️ Seed
**Plank:** Germ
**Contributor:** Claude (nav1), with the Shepherd's seed
**Status:** spec (not run)

```text
WARNING LABEL
Level:      0 Tender
Touches:    nothing
Does:       waits a short, stated time and says so; contacts no outside system
Needs:      none
Stop:       say stop, or skip this module
Return:     hands the ball on unchanged except for its name in the list
Not for:    no one in particular
```

## The idea

A deliberately slow link. It holds the ball, tells the player how long it will wait and
why, and then lets go. It is a breath built as a module.

## Why it is questionable

It does nothing, on purpose, for a stated number of seconds. Many pipelines hide their
waits. This one announces them.

## What it really does

1. Prints how long it will wait and that the player can skip it.
2. Waits that long, or less if the player says skip.
3. Appends its name to the ball and hands it on.

## What it could do for you (optional)

A visible pause between two heavy-feeling steps. It is also a handy way to see how a
chain behaves when one link is slow.

## Ins and outs

- **Takes:** the ball
- **Gives:** the ball
- **Bookends:** may be placed at the Breath step

## Completion check

```bash
grep -q '^WARNING LABEL' atelier/the-machine/modules/001-the-sloth.md
```

## Not verified

The right default wait is not known. A few seconds is a guess.
