# Latin Workflow v2: Cues, Contributors and the Road to Merge

**Prima-clock:** 202610160742
**Suit:** ♦️ Diamond, 1/3 plank. A design for the Shepherd's review.
**Builds on:** [`latin-workflow-glossary.md`](latin-workflow-glossary.md), [`latin-workflow-conversation-seed.md`](latin-workflow-conversation-seed.md)
**Quick reference:** [`latin-lexemes.txt`](latin-lexemes.txt), plain text for Notepad

The existing system works. This refines it and adds three things: a repair word, a cue that reaches
every contributor, and a clear road from contributor work to oversight to merge.

## The road of a PR

| Step | Who | Cue | What happens |
|---|---|---|---|
| 1 | Contributor | (opens PR ready) | *Prima Recensio* is logged by the event. |
| 2 | Contributor | `recensio` | Reviews its own PR, fixes what it finds. |
| 3 | Contributor | `ultima recensio` | Final review. Every finding is fixed or carried forward by name. |
| 4 | Contributor | `probatio` | The soft seal: a short note that the PR is ready for oversight. |
| 5 | Oversight | final oversight run | Report only. Lists flags. |
| 6 | Shepherd | `emenda` | Asks contributors to repair the flags. Loops to step 3. |
| 7 | Shepherd | `ultima probatio` | The final seal, on the owner's word only. |
| 8 | Shepherd | (says so in the conversation) | Merge by merge commit. |

Steps 2 to 4 belong to the contributor. Step 6 sends a PR back. A new head means a new seal.

## What is new

### `emenda` — repair

*Emendare*: to correct, to amend. The Shepherd asks a contributor to repair what oversight flagged.
It is an action, so every modifier applies to it.

| Call | Asks the contributor to |
|---|---|
| `emenda` | Fix the flags named in the PR comments and threads, then report each one. |
| `expeditus emenda` | Fix the small flags quickly: wording, counts, nits. |
| `extrema emenda` | Find the root cause of a flag that earlier attempts missed, then fix it. |
| `ultima emenda` | Make the last round of repairs. After it, anything left is carried forward by name. |

A repair report lists each flag with one of three outcomes: fixed (with the commit), not a defect
(with the path traced), or carried forward (with an owner and a destination).

### `renovata` — refresh, alone

*Renovata* may stand by itself. It asks for a refresh of the current work: re-read the PR on its
current head, update the description, counts and open items, and report what changed. It does not
repeat every deep scan.

### `omnes` — everyone

The caret needs a name. `^omnes` means every contributor able to do the work.

| Form | Reaches |
|---|---|
| `^omnes renovata` | Every contributor on the PR. |
| `^perplexity renovata` | Only Perplexity. |
| `^perplexity set-4f2a1c renovata` | One conversation of Perplexity. |

Any cue can take `^omnes`. A contributor that does not own the PR's branch answers "not mine" in
one line and does nothing else.

### `probatio` and `ultima probatio`

| Call | Who gives it | Meaning |
|---|---|---|
| `probatio` | Contributor or Shepherd | The soft seal. The PR is ready for oversight. It changes nothing on its own. |
| `ultima probatio` | Shepherd only | The final seal that `finalize-pr.yml` acts on. |
| `finalize` | Shepherd only | The older word for `ultima probatio`. Still accepted, to be retired after a clean cycle. |

## What each cue asks of a contributor

A contributor answers in the mode named, in one comment, and ends with the Claude Code footer so
the seal gate skips it.

| Cue | The contributor does | Reports |
|---|---|---|
| `prima recensio` | Orients: reads the PR, the files named, the checks. Changes nothing. | Where things stand, what is open. |
| `recensio` | Scans its own work against the PR template, the scans and the checks. Fixes findings. | Findings and the commits that fix them. |
| `extrema recensio` | Pursues one question to evidence. | The evidence, then the fix or the recommendation. |
| `ultima recensio` | Final review. No new scope. | Each finding fixed, or carried forward with an owner. |
| `emenda` (and modifiers) | Repairs the named flags. | One line per flag, with its outcome. |
| `renovata` | Refreshes the PR for its current head. | What changed since the last report. |
| `lustratio` | Polishes descriptions and reading path. | What reads differently now. |
| `novissimum` | Closes loose ends, or files them. | What is carried forward, and where. |
| `judicium` | Stops. Gives options, a recommendation and what each choice changes. | Waits for the Shepherd's ruling. |
| `probatio` | Checks the road so far, then states readiness. | Ready for oversight, or what blocks it. |
| `cursus` | Runs the remaining applicable stages in order. | The result of each stage. |

A contributor never posts `ultima probatio`, never merges, and never answers a cue meant for
another name.

## Reaching a contributor that is not subscribed

Some conversations subscribe to the PR and wake on comments. Others cannot. For those, the cue
comment is the record and the Shepherd carries one line into the conversation:

```text
Check PR <number> in <repo>. Read the newest comment that starts with a caret and your name.
Answer in the mode of the cue, in one comment, ending with the Claude Code footer.
Docs: docs/latin-workflow-v2.md in custos.
```

## What is built now and what waits

| Piece | State |
|---|---|
| `.github/scripts/cue-parser.js` reads `emenda`, `^omnes` and a bare `renovata`. | Built, with 10 new test rows. |
| This document and `latin-lexemes.txt`. | Built. |
| `finalize-pr.yml` treats `probatio` as a soft seal. | Waits for the Shepherd's go-ahead. |
| `latin-cue-record.yml` logs `emenda` and `renovata`. | Waits. It still uses its own word lists. |
| A `ready-for-oversight` label set by the soft seal. | Waits. |
| `^omnes` and `emenda` in the conversation seed block. | Waits for the Shepherd's review of this design. |

Nothing here changes what a live workflow does today.

## Open for the Shepherd

1. Is `emenda` the word? Other fits: *corrige* (correct), *refice* (make again).
2. Is `omnes` the word for everyone? Another fit: *cuncti*.
3. Should the soft `probatio` set a label, so oversight can list ready PRs in one view?
4. When `finalize` retires, after how many clean cycles?
