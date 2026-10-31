# Module NNN: Name

**Prima-clock:** YYYYMMDDHHMM (UTC)
**Suit:** ♦️ Seed
**Plank:** Germ
**Contributor:** name or login
**Status:** spec (not run)

```text
WARNING LABEL
Level:      <0-3 and name>
Touches:    <plain words, or "nothing">
Does:       <what it will really do, including any system contacted>
Needs:      <access it uses, or "none">
Stop:       say stop, or skip this module
Return:     <how this module hands back on zero>
Not for:    <who should skip it, or "no one in particular">
```

## The idea

One or two sentences. What link in the chain is this, and what is the roundabout way it
does its job?

## Why it is questionable

One honest sentence on why it is a longer road than it needs to be. This is the joke, and
it has to be true.

## What it really does

The real function, in numbered steps. Each step is something a person can check.

1. First step, something a person can check.
2. Second step.

## What it could do for you (optional)

The useful side, if there is one. It is fine for this to be "nothing".

## Ins and outs

- **Takes:** what it receives from the previous module
- **Gives:** what it hands to the next one
- **Bookends:** which step is the quiet start, which is the return to zero

## Completion check

One deterministic command that shows the spec is well formed, for example:

```bash
grep -q '^WARNING LABEL' atelier/the-machine/modules/NNN-slug.md
```

## Not verified

What you could not check. Say it plainly.
