# Jira Pipeline

**Prima-clock:** 202610190449 (UTC)
**Suit:** ♣️ Club, working copy (CLAUDE.md suit list)
**Plank:** 1/3, structure forming
**Jira:** KAN-6, project KAN "primal shadow haven" at primalshadow.atlassian.net

*One place to look for where a piece of work stands, using words the repo already has.*

This is the second pass over what was built but scattered: the GitHub label schema
(`.github/sovran-labels.yml`), the Linear Suit and Plank labels
(`docs/linear-plugin/`), the Latin workflow road ([`latin-workflow-v2.md`](latin-workflow-v2.md))
and the Jira project. It adds nothing that exists already under another name. It is a
proposal until the Shepherd says otherwise.

## 1. The shape

Statuses stay few. The pipeline stages ride on labels, not on new statuses.

| Status | Meaning |
|---|---|
| To Do | Named, not started |
| In Progress | Someone is building it now |
| Idling | Parked: waiting on something, usually a flag for the Shepherd. The next step is already prepared (see §4) |
| Done | Finished, or carried forward with a named owner and destination |

Jira has no In Review status in KAN, and none is added. "In review" is a label (§2).

## 2. One label vocabulary

Rule: if a word exists as a GitHub label, Jira uses it with the same meaning. Jira labels
are lowercase words with no spaces, so the names below are already Jira-safe.

### Reused from the repo (GitHub)

| Label | Meaning | Origin |
|---|---|---|
| `mission`, `sparstone-trial`, `upgrade`, `lexeme`, `feedback` | Work type, one per ticket | `sovran-labels.yml` |
| `open`, `claimed`, `submitted` | Claim lifecycle | `sovran-labels.yml` |
| `needs-shepherd` | Blocked on a Shepherd decision, device access or an outside system | `sovran-labels.yml` |
| `in-progress`, `paused` | Mission board state | `sovran-labels.yml` |
| `ready-for-oversight` | Soft seal (probatio) given | `sovran-labels.yml` |
| `final-oversight` | Owner opted in to the report-only last look | `sovran-labels.yml` |
| `ai-review` | Owner opted in to the paid review | `sovran-labels.yml` |
| `held`, `witnessed`, `finalized` | Custody states | `sovran-labels.yml` |
| `glossary-update`, `anchor-review`, `payment-demand`, `bot-friendly` | As in the repo | `sovran-labels.yml` |

### Reused from Linear (suit and plank)

Linear does not allow emoji in names, and neither do we, so the emoji live in this table.
One suit and one plank per seed ticket.

| Label | Suit meaning (Linear / project instructions) | Origin |
|---|---|---|
| `suit-seed` ♦️ | Seed | Linear Suit group |
| `suit-carbonite` ♣️ | Working copy | Linear Suit group |
| `suit-aethereal` ♥️ | Living copy | Linear Suit group |
| `suit-pinnacle` ♠️ | Single master | Linear Suit group |
| `plank-germ`, `plank-1of3`, `plank-2of3`, `plank-3of3`, `plank-crystallized` | Plank | Linear Plank group |

Only the Shepherd sets `plank-3of3`, `plank-crystallized` and `suit-pinnacle`.

### New here

| Label | Meaning | Why it is new |
|---|---|---|
| `codacy` | Raised by Codacy's Jira option | Codacy already writes `Codacy` and `API`; this normalizes the case going forward |
| `rube-machine` | Belongs to the Machine seed (KAN-7) | Names a new area |

Nothing else is added. If a stage needs a word, look in the first table before making one.

### The suit conflict (undecided)

`CLAUDE.md` says ♦️ Diamond is active development, ♣️ Club is sessions, ♠️ Spade is
Pinnacle, and ❤️ Heart is reserved. The Linear conventions and the project instructions say
♦️ Seed, ♣️ Carbonite, ♥️ Aethereal, ♠️ Pinnacle. Both are recorded above and in
`CLAUDE.md`; only ♠️ agrees. This document uses the Linear set for the `suit-*` labels
because that set was confirmed in Linear on 2026-10-09 (UTC), and flags the conflict rather
than choosing. The Shepherd decides; see `turns/CULTIVATION.md`.

## 3. The PR road, as labels

The Latin cues stay the owner's voice. Jira records where a PR is, it does not call anything.

| Road step ([v2](latin-workflow-v2.md)) | Repo signal | Jira label on the ticket |
|---|---|---|
| Contributor builds | draft PR | `in-progress` (status In Progress) |
| Prima Recensio | PR ready for review | `submitted` |
| Recensio / ultima recensio | owner's cue | none; note on the ticket |
| Probatio (soft seal) | `ready-for-oversight` label | `ready-for-oversight`, status Idling, plus `needs-shepherd` |
| Final oversight run | `final-oversight` label and environment approval | `final-oversight` |
| Emenda (repair) | owner's cue | back to In Progress, remove `ready-for-oversight` |
| Ultima probatio | owner only, `finalize-pr.yml` | `finalized` |
| Merge | on the owner's word | status Done |

A person's push takes `ready-for-oversight` off the PR, so the Jira label comes off with it.
Contributors never post `ultima probatio` and never merge. A navigo describes the seal cue in
words, and never posts it unless the owner asks.

## 4. Idling and the habit of the prepared next step

Idling means the ticket is waiting and the wait is on someone, most often a flag for the
Shepherd. The test for leaving a ticket there is that the next step is obvious from the
ticket alone, without remembering anything.

Every ticket that parks carries two lines in its last comment:

```text
Where: <the one place the thing lives: PR link, file path, or issue>
Next: <the single next action, and whose it is>
```

Rules of thumb:

- Same spots every time. The PR link and the branch go in the ticket; the ticket key goes
  in the branch name and the PR title (`KAN-6: ...`).
- Groups of PRs are processed together, so the saved searches below list a group at once.
- One Idling reason at a time: the label says who is waited on (`needs-shepherd`), the comment
  says for what.

## 5. Saved searches (JQL)

| Question | JQL |
|---|---|
| What is waiting on me? | `project = KAN AND status = Idling AND labels = needs-shepherd ORDER BY updated ASC` |
| What is ready for oversight? | `project = KAN AND labels = ready-for-oversight AND status != Done` |
| What am I building? | `project = KAN AND status = "In Progress" ORDER BY updated DESC` |
| What did Codacy raise? | `project = KAN AND labels in (codacy, Codacy) AND status != Done` |
| What is parked longest? | `project = KAN AND status = Idling ORDER BY updated ASC` |

These are written, not saved. Saving them as Jira filters is a step for the Shepherd or a
later ticket.

## 6. Reviews called by comment

Not everything should run on every push. What runs today (from the workflow headers):

- Automatic and API-free: `review-packet.yml`, `sovran-voice.yml`, `scan-lexeme.yml`.
- Opt-in: the paid review runs when a PR becomes ready and again only when `ai-review` is
  added. `final-oversight` waits for the owner's approval.
- External: Codacy and DeepSource. The Shepherd reports they update on every change.
  Whether they have an on-request or PR-only mode has **not** been checked, so no setting
  is recommended here.

## 7. What is not settled

- Whether Jira and GitHub connect through Jira's GitHub app, Codacy's Jira option, or comments only.
- Whether a confirmation scan gets its own cue.
- The suit list conflict (§2).
- What happens to the starter tickets KAN-1 to KAN-3 and the SAM1 sample project.
- Whether `codacy` replaces the capitalized `Codacy` already on KAN-4, or both stay.

## 8. Not yet done

Labels in §2 are not created anywhere in Jira until a ticket uses them (Jira makes labels
on first use). Existing tickets are labeled one at a time, as they are touched, not in a batch.
