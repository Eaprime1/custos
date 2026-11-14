# Module 000: The Ball

**Prima-clock:** 202610190449 (UTC)
**Suit:** ♦️ Seed
**Plank:** Germ
**Contributor:** Claude (nav1), with the Shepherd's seed
**Status:** spec (not run)

```text
WARNING LABEL
Level:      0 Tender
Touches:    nothing
Does:       makes one small JSON record in a scratch folder; contacts no outside system
Needs:      none
Stop:       say stop, or skip this module
Return:     the record is deleted, or kept only if the player keeps it
Not for:    no one in particular
```

## The idea

The ball is a tiny signed event that rolls through every module. It carries a run id, the
chosen peak, the prima-clock stamp and a list of the modules it has passed.

## Why it is questionable

A text file would do. The ball is a small JSON record so that every module has something
to pass along, and passing it along is the whole show.

## What it really does

1. Reads the player's chosen peak (0 is allowed).
2. Writes `{ run, peak, stamp, passed: [] }` to a scratch file.
3. Each later module appends its name to `passed` and hands the file on.
4. At the Return step the file is shown to the player, then removed unless they keep it.

## What it could do for you (optional)

A plain record of what a run touched, in order. It is also the easiest way to see that a
chain of modules did what each said it would.

## Ins and outs

- **Takes:** the player's peak
- **Gives:** the record to the next module
- **Bookends:** it is the first and the last thing in every run

## Completion check

```bash
grep -q '^WARNING LABEL' atelier/the-machine/modules/000-the-ball.md
```

## Not verified

Whether the record needs signing, and by what, is not decided. "Signed" here means only
that the stamp and the run id are in it.
