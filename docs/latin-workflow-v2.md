# Latin Workflow v2: Cues, Contributors and the Road to Merge

**Prima-clock:** 202610160742
**Suit:** ♦️ Diamond, 2/3 plank. Decisions made by the Shepherd on 202610160811; workflow side built.
**Builds on:** [`latin-workflow-glossary.md`](latin-workflow-glossary.md), [`latin-workflow-conversation-seed.md`](latin-workflow-conversation-seed.md)
**Quick reference:** [`latin-lexemes.txt`](latin-lexemes.txt), plain text for Notepad
**v2.1:** drafted 202610212355 UTC from the Shepherd's words at the oversight of #468, #469, #470 and #476. Proposal until the Shepherd rules; the two modifiers are built (parser and cue record), the rest is practice.

The existing system works. This refines it with a repair word, ways to reach contributors, a draft-stage
repository placement checkpoint, and a clear path from contributor work to oversight. Probatio requests,
soft seals, the oversight packet, the final seal, and merge are distinct events.

## The road of a PR

| Step | Who | Cue or event | What happens |
|---|---|---|---|
| 0 | Author / Shepherd | `petitio`, `judicium`, `placet` (when needed) | While the PR is draft, decide whether a new repository path is appropriate. This approves placement and bounded scope only. See [repository placement decisions](repository-placement-decisions.md). |
| 1 | Contributor | (opens PR ready) | *Prima Recensio* is logged by the event. A placement decision is not a review of content. |
| 2 | Contributor | `recensio`, then `ultima recensio` | Reviews the work, fixes findings, and records anything carried forward. |
| 3 | Shepherd | `probatio` request | Invites the able contributors to prepare their individual soft seals/reviews. A request does not set `ready-for-oversight`. |
| 3a | Shepherd | `^omnes probatio` | Requests every able contributor to create a Probatio review for oversight. |
| 4 | Shepherd | `^chatgpt probatio` | ChatGPT checks the available soft seals and reports against the current head, then prepares a packet for oversight. Missing reports, open questions, and oversight decisions are named. |
| 5 | Oversight observer | Probatio packet | Performs the final oversight review and returns flags or a clear result. This is separate from the contributor packet and placement decision. |
| 6 | Shepherd / contributors | `emenda` | Repairs oversight flags; the affected review and soft seal repeat on the new head. |
| 7 | Shepherd | `ultima probatio` | The owner's final seal, after oversight is complete. |
| 8 | Shepherd | explicit merge decision | Merge remains a separate owner decision. |

A person’s push after a soft seal invalidates that seal because the head changed. A placement `placet` never makes a PR ready for content review or oversight.
 
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

### `probatio`, `^omnes probatio`, and `ultima probatio`

| Call | Who gives it | Meaning |
|---|---|---|
| `probatio` | Shepherd (owner) | Requests the soft-seal stage: able contributors prepare readiness on the current head. It is not a label or evidence that the stage passed. |
| `^omnes probatio` | Shepherd (owner) | Explicitly requests a Probatio review from every contributor able to provide one. Each response is an individual review/soft-seal record. |
| `^chatgpt probatio` | Shepherd (owner) | Asks ChatGPT to verify the available contributor soft seals and reviews against the current head, then create a consolidated packet for the oversight observer. The packet reports absences and open flags; it does not replace the observer's review. |
| `ready-for-oversight` | Set only after packet verification | A status signal for a verified packet on the current head. A request cue alone never sets it. A later human push removes it. |
| `ultima probatio` | Shepherd only | The final owner seal after oversight, which `finalize-pr.yml` acts on. |
| `finalize` | Shepherd only | The manual backup. It moved out of the main stream to [`.claude/manual-finalize.md`](../.claude/manual-finalize.md). |

Soft seal and final seal are different. The cue parser can recognize a request; it cannot verify that a contributor did the work. ChatGPT creates the packet only after checking the current head and available reports. The oversight observer then makes the final review. No cue by itself merges a PR.

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
| `probatio` | Checks the road so far, then states readiness on the current head. | A review/soft-seal note with evidence, gaps, and what blocks readiness. A request cue does not set a label. |
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
| `probatio-label.yml` and `probatio-label.js`: requests do not set readiness; a human push withdraws a previously verified `ready-for-oversight` label. | Updated in this branch; see the tests. |
| `latin-cue-record.yml` logs `emenda` and a bare `renovata`. | Built. |
| `ready-for-oversight` in `.github/sovran-labels.yml`. | Built. The workflow also creates it if missing. |
| `.claude/manual-finalize.md`: the backup method. | Built. |
| This document, the glossary, the seed block and `latin-lexemes.txt`. | Updated. |
| `finalize-pr.yml` | Unchanged. It still reads `@claude finalize` and `ultima probatio`. |

## Decided by the Shepherd (202610160811)

1. `emenda` is the repair word. `refice` is reserved for bigger rework, later.
2. `omnes` is everyone. `cuncti` is the project as a whole.
3. Earlier behavior set the label directly from a soft-seal cue. Superseded: a request cue is not evidence; the label follows verification of the Probatio packet on the current head.
4. `finalize` moves out of the main stream into a manual backup method.

## v2.1 — Sending a PR back for what is missing

The oversight of four PRs showed two ways a PR can go back that are not a repair. In one a claim
cannot be checked from the repo. In the other the work is sound but a step the road requires is
missing. Neither is a flaw in the work, so neither should read like `emenda` alone.

### Two modifiers of `emenda`

They are gerundives, "that must be ...", coined from *confirmare* and *supplere*. Like the rest of
this vocabulary they are project words, not a claim about Roman usage.

| Call | Meaning | The contributor |
|---|---|---|
| `confirmanda emenda` | A concept, claim, citation or source in the PR cannot be checked from the repo. It needs confirming. | Names each claim, says where the Shepherd can find the content (an Ask, below), and marks the claim *unconfirmed* in the PR until the source is cited. Never fills the gap from memory. |
| `supplenda emenda` | The work is sound, but something the road requires is missing: a document, a field, a tick, a label, a note. An administrative gap, not a defect. | Supplies what it can. For what only the Shepherd can supply, asks (an Ask, below). Reports each missing piece as supplied or waiting. |

How the three repair calls differ:

| | Something is wrong | Something is unproven | Something is absent |
|---|---|---|---|
| Call | `emenda` | `confirmanda emenda` | `supplenda emenda` |
| Ends with | fixed, not a defect, or carried forward | cited and confirmed, or marked unconfirmed | supplied, or waiting on a named person |

Both stack with the older modifiers where it helps: `confirmanda emenda` after `extrema` is
possible, but one modifier is the usual call. The parser reads the words in either order and a
bare `confirmanda` is "ambiguous cue" like any modifier without an action. They change nothing
else: no label is set, and the recorder logs them in the cue log.

`probanda` was passed over because it sounds like `probatio`, the soft seal.

### The Ask

Some of what a PR needs is held only by the Shepherd: a location, a document, a ruling. When oversight
finds one, the contributor asks in the same comment that returns the PR, so the Shepherd does not have to
remember a separate errand. One shape:

```text
Ask of the Shepherd (thread T05, Dixi Jam)
Need:      the text of the four rights, or where it lives
My guess:  Google Drive, or one of the earlier conversations
Why now:   README section 3 and warning-labels.md cite it
Unblocks:  the citation line. Until then the claim is marked unconfirmed.
Easiest:   paste the text, or a link, or say "not found" and it stays marked
```

Rules:

1. **Ask where the work is.** The ask arrives with the PR or the step that needs it, not as a list of errands
   gathered somewhere else. One ask per comment, unless the asks are the same errand.
2. **Name the guess.** Say where the content probably lives. A guess costs the Shepherd less than a search.
3. **Always include a way out.** "Not found" is a valid answer. The PR says how it proceeds without the answer.
4. **Every ask has a thread id** (next section), so it can be found again and so an answer lands in one place.
5. **Say what is asked of the Shepherd and nothing else in the same block.** A decision and an errand are two asks.

### Threads

A thread is one open question or stream that outlives a PR. There can be many. `.claude/threads.md`
holds the register: id, name, state, the next ask and where it will be asked. Nobody is expected to
keep it in mind. When the work reaches a thread, the navigo posts that thread's note and asks then:

```text
Thread T05, Dixi Jam. State: waiting on you for the text. Last seen: PR #470 cites it, not in the repo.
```

Answers go back to the register. A thread closes when its last ask is answered or deliberately dropped,
and the register says which. Threads are numbered in the order they open and never reused.

### The contributor's probatio note

When the Shepherd requests Probatio, each able contributor posts one review/note on the same head.
That contribution is the soft-seal evidence; the cue itself does not set `ready-for-oversight`.
After verification, ChatGPT assembles a packet for the oversight observer. It holds:

- readiness on the current head: checks (counts), open threads, merge state;
- recommendations for oversight;
- other issues or ideas noticed while working, each marked as a thread when the Shepherd must decide;
- what it did not check.

It is not an owner cue and carries the footer. A new head after the note needs a new note.
(Added because #469 had receipts but no note after its soft seal, so oversight could not tell
whether the contributor considered the new head ready.)

### Confirming a merge

After a merge, one comment on the merged PR, posted by the navigo on the Shepherd's word. A comment
is better than a document per merge: it sits where the contributors read the PR and needs no new file.

```text
Merged. PR #N into main by <squash / merge commit> as <short sha>, <prima-clock>.
Checks on main after the merge: <result>.
Closed or advanced: <Jira key, issue, thread>.
Carried forward: <item, owner, thread id> (or none).
Next: <the one next step, or none>.
```

A box in the PR description, ticked by the cue record when the PR is merged (`landed`), would
follow the `observed` box. That is a workflow change and is not built here.

### A cue that is not read

The parser rejects any word it does not know, and the PR looks as if nothing happened. On #469 the
cue was spelled `renovatta`: the cue log recorded a *Probatio* (it looks for the action word), the
label workflow read nothing, and the label stayed off. After a Probatio request, look for individual reports and the consolidated packet; the request itself does not set a readiness label. A notice from the recorder when an owner cue line is
rejected would close this; it is a possible follow-up, not built.

### What is built

| Piece | State |
|---|---|
| `cue-parser.js` reads `confirmanda` and `supplenda`. | Built, 5 new test rows (72 in all). |
| `latin-cue-record.yml` logs them. | Built. |
| Glossary and `latin-lexemes.txt`. | Updated. |
| Thread register, Ask shape, probatio note, merge confirmation. | Practice only. No workflow reads them. |
| `landed` box, rejected-cue notice. | Not built. |

