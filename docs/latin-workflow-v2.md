# Latin Workflow v2: Cues, Contributors and the Road to Merge

**Prima-clock:** 202610160742
**Suit:** ♦️ Diamond, 2/3 plank. Decisions made by the Shepherd on 202610160811; workflow side built.
**Builds on:** [`latin-workflow-glossary.md`](latin-workflow-glossary.md), [`latin-workflow-conversation-seed.md`](latin-workflow-conversation-seed.md)
**Quick reference:** [`latin-lexemes.txt`](latin-lexemes.txt), plain text for Notepad

The existing system works. This refines it and adds four things: a repair word, two ways to reach
contributors, a soft seal that sets a label, and a clear road from contributor work to merge.

## The road of a PR

| Step | Who | Cue | What happens |
|---|---|---|---|
| 1 | Contributor | (opens PR ready) | *Prima Recensio* is logged by the event. |
| 2 | Contributor | `recensio` | Reviews its own PR, fixes what it finds. |
| 3 | Contributor | `ultima recensio` | Final review. Every finding is fixed or carried forward by name. |
| 4 | Shepherd | `probatio` | The soft seal. Sets the `ready-for-oversight` label. The contributor states its readiness in a comment. |
| 5 | Oversight | final oversight run | Report only. Lists flags. |
| 6 | Shepherd | `emenda` | Asks contributors to repair the flags. Loops to step 3. |
| 7 | Shepherd | `ultima probatio` | The final seal, on the owner's word only. If the words are in a mess, see the manual ticket. |
| 8 | Shepherd | (says so in the conversation) | Merge by merge commit. |

Steps 2 and 3 belong to the contributor. Step 6 sends a PR back. A person's push after the soft seal
takes the label off, because a new head needs a new seal.

## What is new

### `emenda` — repair

*Emendare*: to amend, to improve. It is editing, not blame: nothing here implies a mistake. The Shepherd
asks a contributor to amend what oversight flagged. It is an action, so every modifier applies to it.

*Refice* (make again) is reserved for later. It would mean rework bigger than an amendment, still
without fault. Two repair words, two sizes: `emenda` now, `refice` when the need shows up.

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

### `omnes` and `cuncti` — everyone, and the whole

The caret needs a name. Two words reach more than one contributor.

| Name | Meaning | Use |
|---|---|---|
| `^omnes` | Every contributor able to do the work, each from its own seat. | `^omnes renovata` |
| `^cuncti` | The project as a whole. Each contributor reads the whole first, then adds its own view. | `^cuncti prima recensio` |

*Cuncti* is the project perspective. It replaces the long way of getting a conversation into the whole
before it speaks for itself.

| Form | Reaches |
|---|---|
| `^omnes renovata` | Every contributor on the PR. |
| `^perplexity renovata` | Only Perplexity. |
| `^perplexity set-4f2a1c renovata` | One conversation of Perplexity. |

Any cue can take `^omnes` or `^cuncti`. A contributor that does not own the PR's branch answers "not mine" in
one line and does nothing else.

### `probatio` and `ultima probatio`

| Call | Who gives it | Meaning |
|---|---|---|
| `probatio` | Shepherd (owner) | The soft seal. Sets the `ready-for-oversight` label. The contributor answers with its readiness. |
| `ultima probatio` | Shepherd only | The final seal that `finalize-pr.yml` acts on. |
| `finalize` | Shepherd only | The manual backup. It moved out of the main stream to [`.claude/manual-finalize.md`](../.claude/manual-finalize.md). |

The label workflow reads only the owner's caret cue. A comment with the Claude Code footer is a
contributor writing under the owner's login, so it never sets the label.

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
| `probatio` | Checks the road so far, then states readiness. | Ready for oversight, or what blocks it. The label is set by the owner's cue. |
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

## What is built

| Piece | State |
|---|---|
| `cue-parser.js` reads `emenda`, `^omnes`, `^cuncti` and a bare `renovata`. | Built, 12 new test rows. |
| `probatio-label.yml` and `probatio-label.js`: the soft seal sets and withdraws `ready-for-oversight`. | Built, with `tools/test_probatio_label.js` (15 rows). |
| `latin-cue-record.yml` logs `emenda` and a bare `renovata`. | Built. |
| `ready-for-oversight` in `.github/sovran-labels.yml`. | Built. The workflow also creates it if missing. |
| `.claude/manual-finalize.md`: the backup method. | Built. |
| This document, the glossary, the seed block and `latin-lexemes.txt`. | Updated. |
| `finalize-pr.yml` | Unchanged. It still reads `@claude finalize` and `ultima probatio`. |

## Decided by the Shepherd (202610160811)

1. `emenda` is the repair word. `refice` is reserved for bigger rework, later.
2. `omnes` is everyone. `cuncti` is the project as a whole.
3. The soft `probatio` sets the `ready-for-oversight` label.
4. `finalize` moves out of the main stream into a manual backup method.
