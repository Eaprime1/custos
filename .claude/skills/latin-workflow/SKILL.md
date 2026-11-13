---
name: latin-workflow
description: Read and answer the Latin workflow calls (recensio, probatio, lustratio, judicium, novissimum, cursus, emenda, with modifiers like prima, ultima, extrema). Use when the owner writes a call, asks what a call means, asks which stage a piece of work is at, or wants to steer a conversation or PR by stage. Also use before posting any PR comment that contains a cue, when the owner asks for a merge call, and when adding, renaming or proposing a lexeme.
---

# Latin Workflow

**Prima-clock:** 202611092118
**Suit:** ♣️ Club, working copy
**Source of truth:** `docs/latin-workflow-v2.md` (cues, contributors and the road to merge; the most current), `docs/latin-workflow-glossary.md` (PRs), `docs/latin-workflow-conversation-seed.md` (conversations) and `docs/latin-lexemes.txt` (plain quick reference). `.github/scripts/cue-parser.js` is what the workflows actually read. Hodie's port is `hodie/docs/latin-workflow.md`. This skill is a working summary. When it disagrees with those, they win.

A call names the **stage** of the work, so nobody needs a paragraph to say what kind of answer is wanted.

**This vocabulary grows.** Other systems keep their own lexemes and more will be added. [Adding a lexeme](#adding-a-lexeme) lists the files to touch, and this skill is one of them.

> **A call is a mode, not a keyword.** `ultima recensio … ready to finalize` means review and fix. It does not seal, even though the word *finalize* appears. Act on the stage named. If two stages seem to be named, ask.

## Grammar

A call is an **action**, optionally with a **modifier**. A call requests a stage of work. It is not proof the stage passed.

### Actions

| Action | Answer in this mode |
|---|---|
| `recensio` | Review. Scan, find, fix. Do the work asked. |
| `probatio` | The soft seal. Say whether the work is ready for oversight, or what blocks it. You do not seal. |
| `lustratio` | Polish. Change how it reads, not what it does. No quiet scope change. |
| `judicium` | Stop. Give options, a recommendation and what each choice changes. Do not act until the owner rules. |
| `novissimum` | Rear guard. Close loose ends, or carry each forward with a named owner and destination. |
| `cursus` | Run the remaining applicable stages in order and record each result. Not an automatic merge. |
| `emenda` | Amend what oversight flagged. One line per flag (see below). |
| `refice` | Rework, bigger than an amendment and still without fault. With a plan, follow it. Without one, write the plan first, then repair. |
| `semina` | Sow. Write a handoff block so the work continues in a new conversation: clutch in (leave the main stream and explore), clutch out (rejoin it). |
| `sustine` | Hold back. Meant to set `held` so the final seal waits for the Shepherd's release. Today the parser and the cue record read it and nothing more. |
| `observatio` | The observation call. Write the observation document for this PR, the history of what happened: what was seen, what was fixed, what is carried forward, the scores. The call names who writes it (`^claude observatio`); with no name, the oversight observer writes it. File `turns/observations/<prima-clock>_pr<N>_observation.md`, `status: open` until the owner says it is complete. Does not seal or merge. |
| `inspectio` | The oversight observer's review. Look into the PR on its current head as the oversight observer: checks, open threads, whether the seal covers this head, the observation, the file review, and a sample re-check of claims. Report to the Shepherd what holds and what does not, one line each. The `observatio` document records the result. Does not seal or merge. |

*Refice*, *semina* and *sustine* were accepted by the Shepherd on 2026-10-19 (comment in `cue-parser.js`; meanings in `docs/latin-workflow-v2.md`). The custos parser and cue record read them as actions. None of them changes a label or stops a seal yet.

*Observatio* was accepted by the Shepherd on 2026-11-12 (comment on PR #521: "observatio is accepted"). No workflow, parser or recorder list reads it yet.

*Inspectio* was accepted by the Shepherd on 2026-11-12 (in the conversation: "inspectio is the word"), after the call was asked for on PR #520: "we need a latin lexeme to call for this review added." `traditio`, the hand-over, was offered as the alternative and not chosen. It is not the same as `recensio` (the review everyone does) or `observatio` (the document). No workflow, parser or recorder list reads it yet.

### Modifiers

| Modifier | Means |
|---|---|
| `prima` | First. Orient and change nothing. Say where things stand and what is open. |
| `ultima` | Final. Fix everything found. No new scope. Say what is ready and what awaits the owner. |
| `suprema` | Highest. Presentation a stranger can act on without the conversation. Use sparingly. |
| `extrema` | Deepest. One thing to the bottom, root cause, with evidence shown. |
| `renovata` | Refresh. Re-read on the current state and say what changed. May stand alone. |
| `expeditus` | Prompt. Focused pass, same standards. Record anything deliberately omitted, with reason, approver, substitute evidence and follow-up. |
| `confirmanda` | With `emenda`: a claim or source cannot be checked from the repo. Cite it or mark it unconfirmed, rather than filling the gap from memory. |
| `supplenda` | With `emenda`: the work is sound but a step the road needs is missing. Supply it, or name who it waits on. Not a defect. |

### Three-letter codes

Owner direction from the #517 review: every code is at least three letters, because two-letter codes are easy to confuse.

| Action | Code | Modifier | Code |
|---|---|---|---|
| `recensio` | REC | `prima` | PRI |
| `probatio` | PRO | `ultima` | ULT |
| `lustratio` | LUS | `suprema` | SUP |
| `judicium` | JUD | `extrema` | EXT |
| `novissimum` | NOV | `renovata` | REN |
| `cursus` | CUR | `expeditus` | EXD (provisional) |
| `emenda` | EME | `confirmanda` | CNF |
| `refice` | REF | `supplenda` | SPL |
| `semina` | SEM | | |
| `sustine` | SUS | | |
| `observatio` | OBS | | |
| `inspectio` | INS | | |

The first three letters of `expeditus` would be EXP, and `confirmanda` or `coniunctio` would be CON. `cue-parser.js` already uses `exp-`, `set-`, `con-` and `oth-` as conversation-ID prefixes, so EXD, CNF and CNJ avoid the clash. REF, SEM and SUS follow the first-three-letters rule and clash with nothing. The owner confirms them or picks others.

**Hyphen call form (proposed).** Name, then modifier, then action:

| Call | Reads as |
|---|---|
| `^claude-ult-rec` | Claude produces an ultima recensio document |
| `^omnes-ult-rec` | Every contributor able produces an ultima recensio comment or document |
| `^omnes-rec` | A recensio from every contributor able |
| `^omnes-ren-rec` | Renovata recensio from everyone, for a significant change in the PR |

Status: proposed. `cue-parser.js` reads `^name cue words` with spaces today, and no workflow reads the hyphen form, so for now it is vocabulary for the conversation. Not settled: the order of the `emenda` modifiers (`confirmanda`, `supplenda`) in hyphen form, and the owner's idea of `^^^` (a triple prime) as an attention flag.

The older two-letter examples (`PR-REC`, `UL-PRO` and the rest) were inherited examples and were not installed as labels. They are superseded by the codes above.

For `confirmanda` and `supplenda`, anything only the Shepherd can supply goes in an Ask. The shape, and the thread ids that go with it, are in v2.1 of `docs/latin-workflow-v2.md`.

### Proposed lexemes (awaiting the owner's ruling)

| Lexeme | Code | Proposed meaning |
|---|---|---|
| `coniunctio` | CNJ | The merge call: merge when ready. Check the gates first (required checks, open threads, seal covers this head, file review). If any concern remains, stop and state it as a `judicium` (options, recommendation, what each choice changes) and wait. Merge only when no concern remains. |

Proposed in answer to the owner's #517 review comment: "add a latin lexeme for the merge when ready (if there is a concern I want to address it before the merge)". *Coniunctio* is Latin for a joining. The word is the owner's to accept or swap for another. No workflow reads it. After the owner calls it, a navigo merges by the repo's merge method, which matches the rule that a navigo merges when the owner asks in the conversation. Until the owner rules, do not add it to the glossary or any recorder list.

Added on the Shepherd's word on PR #520 (2026-11-12): "I do not see a latin lexeme for observation process ... if you don't find it, let's add it." None was found: the observation step had a document, a folder and a README, but no word. *Observatio* is Latin for watching, and sits with *recensio*, *probatio* and *lustratio*. Accepted on PR #521; it now stands in the Actions table above.

How it fits with the Shepherd's marker:
- **`shepherd observed`** (or `shepherd observation`, which the observation log in #467 already reads) is the *Shepherd's* part: his own attestation, with his local time typed as `hh:mm`. It records that he has observed. It does not write the history.
- **`^name observatio`** is the call that asks for the document, and it names the writer. That answers who writes it when the marker alone cannot say.
- **Trigger, proposed and not built:** when the marker is seen and no document is filed, the cue record could say "observation requested, no document filed, waits on the navigo named in the call, default the oversight observer". It would not write the document. This needs a change to `latin-cue-record.yml` (and the log's marker list for `observed`). Not done; the owner rules on that separately.

The Shepherd's own `shepherd observatio` note (as on #521, where he judged an observation document would be more clutter than content) is a decision about the document, not a call for one. The seal gate still asks for a filed observation, so a PR the Shepherd waives it for needs a short one marked `status: complete`, or a gate change in its own PR.

### Answering `emenda`

One line per flag, each one of:

- **fixed**, with the commit
- **not a defect**, with the path you traced
- **carried forward**, with an owner

### Check-in cues (custos only, issue comments)

`disponi` (is this mission open?), `petitio` (here is my plan), `placet` (owner's nod, flips the mission to in-progress). These belong to the mission board (`docs/mission-board.md`). They do not seal or merge anything. Hodie has not ported them.

## Addressing

| Form | Reaches |
|---|---|
| `^name cue words` | One contributor |
| `^name set-4f2a1c cue words` | One conversation of that contributor |
| `^omnes cue words` | Every contributor, each from its own seat |
| `^cuncti cue words` | The project as a whole. Read it first, then add your own view |
| `^custos` / `^hodie` | That repo's workflows |

Names the custos parser reads: `claude`, `chatgpt`, `gemini`, `perplexity`, `unexusi`, `custos`, `omnes`, `cuncti`. Hodie's parser also reads `hodie`.
If a call is addressed to someone else, answer "not mine" in one line.

Three separate matchers read comments, and they do not share one rule:

| Matcher | Reads | Position |
|---|---|---|
| Caret parser, `.github/scripts/cue-parser.js` (used by `probatio-label.yml`) | `^name cue words` from the owner, outside quotes and code, in a comment without the Claude Code footer | Start of a line only |
| Cue record, `latin-cue-record.yml` (its own matcher) | Any whole-word action or modifier from the owner, outside code and quotes, in a comment without the footer | Anywhere in the prose |
| Seal gate, `finalize-pr.yml` | `@claude finalize`, or `@claude` together with `ultima probatio`, outside code and quotes, in a comment without the footer | Anywhere in the prose |

So the line-start rule does not protect against an accidental seal. The seal gate ignores the footer, code and quotes, but it does not care where in the comment the words sit. Describe the seal cue in words, and keep `@claude` away from those words.

## What is live and what is only words

| Cue | Read by | Effect |
|---|---|---|
| `@claude finalize`, `@claude ultima probatio` | `finalize-pr.yml` | Seals the PR if the template, threads, CI and the filed observation pass. Owner only. `ultima probatio` is the final seal; `finalize` is the manual backup (`.claude/manual-finalize.md`). |
| `^name probatio` | `probatio-label.yml` (custos and hodie) | Sets `ready-for-oversight`. A person's push takes it off. Seals nothing. |
| a call the recorder knows, or opening a PR ready | `latin-cue-record.yml` | Logs one row in a living comment: checks, threads, merge state, observation. Calls no model. Custos reads ten actions (recensio, probatio, lustratio, judicium, novissimum, cursus, emenda, refice, semina, sustine) and eight modifiers (prima, ultima, suprema, extrema, renovata, expeditus, confirmanda, supplenda). Hodie's `cue-parser.js` reads the first seven actions. |
| `@claude placet` | placet workflow | Flips a mission to in-progress. Owner only. |
| every other call | nothing | Words for the conversation. `refice`, `semina` and `sustine` are logged and do nothing more. So is every proposed lexeme. |

Neither a seal label nor a passing assessment merges. The owner asks for merge separately; `coniunctio` is the proposed call for that.

**Owner direction (not implemented):** `@claude` should return to its primary mission, calling Claude, and the seal should leave the `@claude finalize` wording for the Latin grammar. That touches `finalize-pr.yml` (and its file name, if a rename is practical), its tests, the docs that name it, and hodie's copy, so it needs its own PR and review. Until it lands, the cues in the table above remain live.

## The road of a PR

From `docs/latin-workflow-v2.md` and `turns/observations/README.md`:

1. Contributor opens the PR ready. Prima Recensio is logged by the event, and the navigo opens the observation (`turns/observations/`, `status: open`).
2. Contributor `recensio`: reviews its own PR and fixes what it finds.
3. Contributor `ultima recensio`: every finding is fixed or carried forward by name.
4. Shepherd `probatio`: the soft seal. It sets `ready-for-oversight`, and the contributor posts one readiness note on that head.
5. Oversight review with the Shepherd (`inspectio`). The navigo files the observation, scored M1 to M8, and sets it to `status: complete`. The seal asks for this, so it comes before the seal.
6. Shepherd `emenda`: asks the contributor to repair a flag, then back to step 3. A fix is a new head and needs a new seal.
7. Shepherd `ultima probatio`: the final seal, on the owner's word only. `finalize` is the manual backup. In custos the seal applies the `shepherds-arch` label itself (it was `final-oversight` until 2026-11-13).
8. The owner approves the waiting final-oversight run. It is report only and checks the head after the seal: checks, threads, that the seal covers this head, the observation, and the file review. A red item means a fix, a new head, and a new seal and approval. In hodie the label is added by hand.
9. Shepherd says merge in the conversation. Merge by merge commit, then one confirming comment.

A contributor does not seal or merge on its own, and leaves a cue meant for another name to that contributor.

## Guardrails for Claude (read before posting any PR comment)

- **Describe a seal cue in words instead of typing it** (`@claude finalize`, `@claude ultima probatio`, `@claude placet`), unless the owner asked you to post that exact cue. Navigo comments post under the owner's login, so a typed cue could seal on the owner's behalf by accident. Example wording: "ready for the owner's seal".
- Cues inside backticks or `>` quotes are inert under the parser's rules. Do not use that to slip one in.
- Do not merge unless the owner asks in the conversation.
- **Address red checks whenever possible.** Some reds cannot clear until the PR merges, because the fix is in the PR itself. For those, record the failing and corrected states with evidence and put the call to the owner. A Latin comment does not turn a red check green. The seal is meant to catch these cases. Options such as a recorded bypass or filing an issue are the owner's idea for a seal-system upgrade mission, and are not built yet.
- `expeditus` changes tempo, not authority or evidence standards.
- If the owner uses a word that is not a call, or a call is unclear, say how you are reading it before acting.
- Report, hold, do not fill. Name a gap and leave the answer to the evidence.

## In a conversation (not a PR)

Same grammar, different outputs. With repo access, outputs land as files and PRs. Without it, they are documents for the owner to file.

| Call | Output |
|---|---|
| `prima recensio` | State-of-things snapshot, no work started |
| `recensio` | Work done, findings named, fixes made |
| `extrema recensio` | Findings with the evidence behind them |
| `judicium` | Options, recommendation, consequences, then a pause |
| `ultima recensio` | Everything found is fixed or named |
| `lustratio` / `suprema lustratio` | Clean record / a brief that works without the conversation |
| `novissimum` | Loose ends filed per `turns/CLOSING.md` |
| `ultima probatio` | Closing record written (turn log, journey if substantial), confirm all landed, then stop |

## Seed block

To start a conversation in this grammar, paste the seed block from `docs/latin-workflow-conversation-seed.md`, or point the navigo at it.

## Adding a lexeme

Other systems keep their own copies of this vocabulary, and more will be added. A new lexeme lands in every place that holds the list, with this skill updated in the same change.

1. **Define it.** One line of meaning, and the output a reader should expect. Decide whether it is an action, a modifier, an addressee name, or a check-in verb.
2. **Check for clashes.** The word, its three-letter code, the verbs already in use (`disponi`, `petitio`, `placet`, `finalize`, `check`, `concordance`, `sync-labels`), and the conversation-ID prefixes (`exp`, `set`, `con`, `oth`).
3. **Source of truth first.** Add it to `docs/latin-workflow-v2.md`, `docs/latin-workflow-glossary.md`, `docs/latin-workflow-conversation-seed.md` (the seed block and its table) and `docs/latin-lexemes.txt`. Stamp the change with `bash tools/prima_clock.sh` and add a reconciliation note if it changes an older statement.
4. **Mirrors** (words only):
   - `hodie/docs/latin-workflow.md` and `hodie/docs/latin-lexemes.txt` (a separate swap)
   - `guides/navigo-session-kit/owner-cues.md` and the pointer in `.perplexity/latin-workflow-glossary.md`, which list the terms
   - any other system that keeps its own list: add its path here so the next change finds it
5. **Only if a workflow must read it** (a separate PR, because workflow paths need Deck Master review):
   - custos `.github/scripts/cue-parser.js` (`ACTIONS`, `MODIFIERS`, `VERBS`), with `tools/test_cue_parser.sh` (hodie keeps its tests under `scripts/`)
   - custos `.github/workflows/latin-cue-record.yml`: the `contains(...)` prefilter lines and the `ACTIONS` / `MODS` arrays
   - `.github/scripts/probatio-label.js` and `tools/test_probatio_label.js`, if the word touches the soft seal
   - hodie `.github/scripts/cue-parser.js` and its tests, as a separate swap
6. **Update this skill:** the Actions or Modifiers table, the codes table, the live-versus-words table, the frontmatter description if it adds a trigger, and the `Prima-clock` line.
7. **Check nothing was missed:** `grep -rIl -i '<word>' custos hodie fleet-commander armarium mandelbrot`, then `bash tools/scan_lexeme.sh`.
8. **Keep it proposed until the owner rules.** List a new word under Proposed lexemes, as `coniunctio` is, and move it into the main tables only after the ruling.

Drift to know about: custos's parser reads ten actions and hodie's reads seven (no `refice`, `semina` or `sustine`), and custos's names list has no `hodie`. Check both before saying a lexeme is live.

## Pairing

To grade finished work against these stages, use the `work-eval` skill. Its verdicts map onto these calls (ready for `probatio`, needs `emenda`, needs `judicium`).
