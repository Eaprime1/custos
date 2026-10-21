# Jira Pipeline

**Prima-clock:** 202610190449 (UTC)
**Suit:** ♣️ Club, working copy (CLAUDE.md suit list)
**Plank:** 1/3, structure forming
**Jira:** KAN-6, project KAN "primal shadow haven" at primalshadow.atlassian.net

*One place to look for where a piece of work stands, using words the repo already has.*

This is the second pass over what was built but scattered: the GitHub label schema
(`.github/sovran-labels.yml`), the Linear Suit and Plank labels
(`docs/linear-plugin/`), the Latin workflow road ([`latin-workflow-v2.md`](latin-workflow-v2.md))
and the Jira project. It reuses existing vocabulary where possible and distinguishes
new proposals from installed labels. It is a proposal until the Shepherd says otherwise.

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

Rule proposed here: reuse the same meaning for existing GitHub labels when applied in Jira.
For new labels in this guide, use lowercase hyphenated words without spaces; legacy Jira
labels such as `Codacy` may differ in case. These are conventions, not an installed sync.

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

### Derived from Linear (proposed Jira-safe suit and plank labels)

Linear's actual labels are `Seed`, `Carbonite`, `Aethereal`, `Pinnacle` and `Germ`, `1/3 Plank`, `2/3 Plank`, `3/3 Plank`, `Crystallized` (without prefixes). The `suit-*` and `plank-*` names below are proposed Jira-safe derivatives, **not existing Linear label names**. Emoji are shown here for reference only.
One proposed suit and one plank label per Jira seed ticket; these labels are not installed by this document.

| Label | Suit meaning (Linear / project instructions) | Origin |
|---|---|---|
| `suit-seed` ♦️ | Seed | Proposed Jira form of Linear `Seed` |
| `suit-carbonite` ♣️ | Working copy | Proposed Jira form of Linear `Carbonite` |
| `suit-aethereal` ♥️ | Living copy | Proposed Jira form of Linear `Aethereal` |
| `suit-pinnacle` ♠️ | Single master | Proposed Jira form of Linear `Pinnacle` |
| `plank-germ`, `plank-1of3`, `plank-2of3`, `plank-3of3`, `plank-crystallized` | Plank | Proposed Jira forms of Linear `Germ`, `1/3 Plank`, `2/3 Plank`, `3/3 Plank`, `Crystallized` |

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
For a short owner-facing list of live, manual and reserved lexemes, use the [Shepherd Latin workflow guide](latin-workflow-shepherd-guide.md).

| Road step ([v2](latin-workflow-v2.md)) | Repo signal | Jira label on the ticket |
|---|---|---|
| Contributor builds | draft PR | `in-progress` (status In Progress) |
| Prima Recensio | PR ready for review | `submitted` |
| Recensio / ultima recensio | owner's cue | none; note on the ticket |
| Probatio (soft seal) | `ready-for-oversight` label | Proposed Jira mirror: `ready-for-oversight`, status Idling, plus `needs-shepherd` |
| Final oversight run | `final-oversight` label and environment approval | `final-oversight` |
| Emenda (repair) | owner's cue | back to In Progress, remove `ready-for-oversight` |
| Ultima probatio | owner only, `finalize-pr.yml` | `finalized` |
| Merge | on the owner's word | status Done |

A person's push withdraws `ready-for-oversight` from the GitHub PR. The Jira ticket must
be updated separately unless a verified integration supplies this synchronization; it
must not be assumed to happen automatically.
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

## 7. Decided, and what is not settled

### Decided by the Shepherd (in conversation, 202610190754 UTC)

- **Starter tickets stay.** KAN-1 to KAN-3 are kept as worked examples. Nothing is deleted.
- **SAM1 stays as the practice board.** It is the only board with an In Review status and a
  full Epic and Task spread, so it serves as a safe place to try moves without touching KAN.
  It is not a clonable template; whether Jira can copy a team-managed project is unchecked.
- **The repo label system is primary.** Jira follows it. Good ideas from Jira can be absorbed
  into the repo labels, not the other way round.
- **`ultima recensio` is the last step before oversight.** Then the soft seal (`probatio`).
- **`probatio` should start the soft-seal scans.** Proposed shape: it dispatches the manual
  `final-review.yml` (the Codacy gate). Not built; it needs a workflow edit and the Shepherd's yes.
- **Three words accepted as future vocabulary, but not live automation:**
  - `refice`: repair by plan. If a plan exists, follow it; if not, write the plan, then repair. Already mentioned in `latin-workflow-v2.md` as **reserved**, but not defined as a live action in the glossary or `cue-parser.js`.
  - `semina`: sow the seed. Write a handoff block so work can continue in a new conversation. Not yet in `latin-workflow-v2.md`, the glossary or `cue-parser.js`.
  - `sustine`: hold back. **Intended** to apply `held` and prevent the final seal until the Shepherd releases the hold. That enforcement is **not built**: neither the Latin parser nor `finalize-pr.yml` currently implements this cue or gates the seal on `held` (see Not settled below).
- **`novissimum` means finish now:** only small tweaks, carry the rest forward by name.
  `cursus expeditus` stays as the glossary has it.

### Not settled

- Whether `finalize-pr.yml` should refuse to seal while `held` is on. Checked today: the label
  exists in `sovran-labels.yml` but nothing reads it. The gate's blockers are template gaps,
  observation gaps, unresolved threads, and failing or pending CI.
- How Jira and GitHub connect. Jira's GitHub app is already linked (the Development field on
  KAN-4 and KAN-6 has shown their PRs). Both PRs have since left draft status. What the
  integration can change on its own is unchecked.
  Comments remain the working method.
- The suit list conflict (§2).
- Whether `codacy` takes over from the capitalized `Codacy` already on KAN-4, or both stay.
- What DeepSource and Codacy offer on request. That lives in their settings, which the Shepherd changes.
- KAN-5's 48 originally reported findings are being handled in batches. Draft PR #476
  addressed 11 formatting occurrences and was subsequently marked ready for review.
  The remaining findings require reconciliation with the existing cleanup PRs.

## 8. Not yet done

Labels in §2 are not created anywhere in Jira until a ticket uses them (Jira makes labels
on first use). Existing tickets are labeled one at a time, as they are touched, not in a batch.
