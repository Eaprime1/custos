# Module 002: The Weathervane

**Prima-clock:** 202610190449 (UTC)
**Suit:** ♦️ Seed
**Plank:** Germ
**Contributor:** Claude (nav1), with the Shepherd's seed
**Status:** spec (not run)

```text
WARNING LABEL
Level:      1 Steady
Touches:    a reflective line about where a ticket or a PR stands
Does:       reads the state of one Jira ticket or one PR, if the player names it, and prints it back; writes nothing
Needs:      read access to the named ticket or PR; none if the player gives the state by hand
Stop:       say stop, or skip this module
Return:     prints the one next step from the ticket's last comment, then returns to zero
Not for:    anyone who does not want to see a work item's state today
```

## The idea

It points the way the wind is blowing. For a ticket parked in Idling, it reads the
`Where:` and `Next:` lines from the last comment (see `docs/jira-pipeline.md`) and
prints them. It never pushes or changes anything.

## Why it is questionable

The player could read the ticket. The weathervane reads the ticket, then tells the
player what the ticket says, with a small flourish.

## What it really does

1. Takes a ticket key or a PR number from the player.
2. Reads the status, the labels and the last comment.
3. Prints the `Where:` and `Next:` lines, or says the ticket has none.
4. Appends its name to the ball.

## What it could do for you (optional)

The pipeline habit in one place: a parked ticket shows its next step without anyone
having to remember it. It is the one starter module with a real use.

## Ins and outs

- **Takes:** the ball and a ticket key or PR number
- **Gives:** the ball and one printed line
- **Bookends:** may sit just before the Return step

## Completion check

```bash
grep -q '^WARNING LABEL' atelier/the-machine/modules/002-the-weathervane.md
```

## Not verified

It has not been run against Jira or GitHub. Whether the Jira tools expose the last
comment in a short form is not checked.
