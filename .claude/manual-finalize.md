# The Manual Ticket: Finalize by Hand

`prima-clock: 202610160810`
`suit: ♣️ Club, working copy. A backup method, kept out of the main stream.`

## Why it exists

A store keeps a card imprinter for the day the terminal goes down. The clerk writes the sale by hand,
calls in for approval, and keys the tickets in when the system returns. This is the same idea for
sealing a PR. The main stream is `ultima probatio`. When the Latin words are in a mess, `finalize`
and a handwritten ticket still get the work done.

## When to reach for it

- The cue parser or the seal gate misreads a plain `ultima probatio`.
- The cue record or labels disagree with the PR and nobody can say why.
- Actions are down, or an approval prompt is stuck.
- A word is in dispute and the PR must still close today.

## The three levels

| Level | Method | What it needs |
|---|---|---|
| 1. Older cue | The owner comments `@claude finalize`. `finalize-pr.yml` still reads it. | Actions running. |
| 2. Hand seal | The owner writes the ticket below in a PR comment, then states the seal in the conversation. | A person. |
| 3. Paper ticket | The owner keeps the ticket in a file when GitHub is down. | Nothing. |

Level 1 is the same seal by an older word. The footer and quote rules still apply to it. A navigo does
not post that cue unless the owner asks.

## The ticket

Write it longhand and complete, because it is keyed in later.

```text
MANUAL TICKET
PR:            <repo>#<number>
Head commit:   <full sha at the time of sealing>
Prima-clock:   <YYYYMMDDHHMM, UTC>
Sealed by:     <the owner>
Why manual:    <what was in a mess>
Checks seen:   <which were green, which were not, and why that is acceptable>
Open threads:  <none, or each one and its disposition>
Oversight:     <the final oversight report, or why there is none>
Carried over:  <what is deferred, with an owner and a destination>
```

## Keying it in when the system returns

1. Post the ticket as a PR comment if it is not there already.
2. Run the seal through the normal path once the words work again (`ultima probatio`).
3. Add one line to `turns/log.md` naming the manual ticket and the reason.
4. File what was learned about the mess through `queue/artesium-weir/`, so the words get fixed.

## What stays true

- The seal is the owner's alone.
- Merge waits for the owner's word in the conversation.
- A red required check is not waived by a ticket.
- A new head after the ticket needs a new ticket.
