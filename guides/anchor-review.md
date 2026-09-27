# Anchor Review

*The Chronicle may mythologize real system motion, but it must never invent motion.*

`prima-clock: 202609251844`
`source: atelier/nav5-granum-anchor-review.md (nav5 granum, PR #179) · issue #188`

---

## What it is

An **anchor** is the real thing a claim points back to: a PR, a commit, an issue, a document, a message, a decision. **Anchor review** is the pause custos takes when a claim touches lore or custody and nothing anchors it.

It isn't an accusation. Imagination is welcome here. The flag only keeps an unanchored claim from quietly becoming history.

A claim needs an anchor when it says something **happened**, **is owed**, or **is now true** in custos: a lore fact, a custody transfer, a reward, a contributor record, an operating rule.

## How to flag it

Put this on its own line in the PR body, the issue body or a review comment:

```
[ANCHOR REVIEW NEEDED]
```

Then add the `anchor-review` label. Name the claim, and ask the question that would anchor it:

- What real event anchors this? Where and when did it happen?
- Who or what witnessed it, and what artifact records it?
- Is this record, proposal, simulation, dream, fiction or seed?

## What happens next

One of four outcomes. Whoever closes the review says which:

| Outcome | Mark | Meaning |
|---|---|---|
| Anchor supplied | `[ANCHORED]` | points to a real artifact; the claim may enter record |
| Welcome, not history | `[SEED / UNCANONIZED]` | stays in `atelier/` or `.shadow-well/` as a seed |
| Intentionally fictional | `[SIMULATION]` | kept, clearly labeled as rehearsal or fiction |
| Unsafe or manipulative | `[QUARANTINE]` | held apart; not integrated |

A fifth, `[REJECTED AS RECORD]`, keeps the artifact as a submission but never as fact.

Until the review closes, the claim can live in `atelier/`. It doesn't go into Chronicle, `world/`, the custody registry, the contributor record or operating instructions.

## Anchor classes

Repository (PR, issue, commit, workflow run) · Reading Room (Handshake, stream return, route assigned) · Document (upload, revision, custody declared) · Contributor (submission, comment, claim ticket) · Conversation (message, decision captured) · External (email, Drive share, GitHub event). Full list in the nav5 granum, §8.

## Examples

**Lore.** A PR says "the Field is red." `world/lore.md` describes the Field as flat, traversable and alive with movement, and says nothing of red. Flag it; the contributor cites a Chronicle entry, or the line becomes `[SEED / UNCANONIZED]`.

**Custody: first use of the flag (202609251844).** PR #333, a bounty-platform submission for issue #325, opens with:

> **Reward:** `$50.0 USD`

That is a custody-bearing claim: it says custos owes money. Issue #325 names no reward, and custos bounties are denominated in XP (see `docs/issue-system.md`). The claim has no anchor in the repo.

```
[ANCHOR REVIEW NEEDED]
Claim: "$50.0 USD reward." Anchor asked for: where did custos offer this?
```

This demonstration is recorded here rather than posted on the PR, because #325 has active external submissions and its review belongs to the Shepherd. The Shepherd decides whether to post it.

---

*If it is unclear, call for anchor review. If it is harmful, quarantine it. If it is true, anchor it and welcome it.*
