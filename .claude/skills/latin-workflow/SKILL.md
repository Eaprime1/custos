---
name: latin-workflow
description: Read and answer the Latin workflow calls (recensio, probatio, lustratio, judicium, novissimum, cursus, emenda, with modifiers like prima, ultima, extrema). Use when the owner writes a call, asks what a call means, asks which stage a piece of work is at, or wants to steer a conversation or PR by stage. Also use before posting any PR comment that contains a cue.
---

# Latin Workflow

**Prima-clock:** 202611090500
**Suit:** ♣️ Club, working copy
**Source of truth:** `docs/latin-workflow-glossary.md` (PRs), `docs/latin-workflow-conversation-seed.md` (conversations). Hodie's port is `hodie/docs/latin-workflow.md`. This skill is a working summary. When it disagrees with those, they win.

A call names the **stage** of the work, so nobody needs a paragraph to say what kind of answer is wanted.

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

### Modifiers

| Modifier | Means |
|---|---|
| `prima` | First. Orient and change nothing. Say where things stand and what is open. |
| `ultima` | Final. Fix everything found. No new scope. Say what is ready and what awaits the owner. |
| `suprema` | Highest. Presentation a stranger can act on without the conversation. Use sparingly. |
| `extrema` | Deepest. One thing to the bottom, root cause, with evidence shown. |
| `renovata` | Refresh. Re-read on the current state and say what changed. May stand alone. |
| `expeditus` | Prompt. Focused pass, same standards. Record anything deliberately omitted, with reason, approver, substitute evidence and follow-up. |
| `confirmanda` | With `emenda`: a claim or source cannot be checked from the repo. Cite it or mark it unconfirmed. Never fill the gap from memory. |
| `supplenda` | With `emenda`: the work is sound but a step the road needs is missing. Supply it, or name who it waits on. Not a defect. |

### Combined codes (examples, not installed labels)

`PR-REC` prima recensio · `EX-REC` extrema recensio · `JUD` judicium · `NOV` novissimum · `UL-PRO` ultima probatio · `SU-LUS` suprema lustratio.

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

Names: `claude`, `chatgpt`, `gemini`, `perplexity`, `unexusi`, `custos`, `hodie`, `omnes`, `cuncti`.
If a call is addressed to someone else, answer "not mine" in one line.

A cue counts only at the **start of a line**, outside quotes and code, from the **owner**, in a comment **without the Claude Code footer**. Rules: `.github/scripts/cue-parser.js`.

## What is live and what is only words

| Cue | Read by | Effect |
|---|---|---|
| `@claude finalize`, `@claude ultima probatio` | `finalize-pr.yml` | Seals the PR if the template, threads and CI pass. Owner only. |
| `^name probatio` (hodie) | `probatio-label.yml` | Sets `ready-for-oversight`. A person's push takes it off. |
| any call, or opening a PR ready | `latin-cue-record.yml` | Logs one row in a living comment: checks, threads, merge state. Calls no model. |
| `@claude placet` | placet workflow | Flips a mission to in-progress. Owner only. |
| every other call | nothing | Words for the conversation. |

Neither a seal label nor a passing assessment merges. The owner asks for merge separately.

## The road of a PR

1. Contributor opens the PR ready. First witness, logged as Prima Recensio.
2. Contributor `recensio` / `ultima recensio`: reviews its own PR and fixes what it finds.
3. Shepherd `probatio`: soft seal.
4. Shepherd `@claude finalize` or `ultima probatio`: the seal. Owner only.
5. Shepherd runs oversight (hodie: the `final-oversight` label, then the approval). Report only.
6. Shepherd `emenda`: asks the contributor to repair a flag. A fix is a new head and needs a new seal.
7. Shepherd says merge in the conversation.

A contributor never seals, never merges, never answers a cue meant for another name.

## Guardrails for Claude (read before posting any PR comment)

- **Never type a live seal cue** (`@claude finalize`, `@claude ultima probatio`, `@claude placet`) in a comment unless the owner asked you to post that exact cue. Navigo comments post under the owner's login. Describe the cue in words instead: "ready for the owner's seal".
- Cues inside backticks or `>` quotes are inert, but do not rely on that to sneak one in.
- Do not merge unless the owner asks in the conversation.
- A red required check is **not** waived by a Latin comment. Record the failing and corrected states.
- `expeditus` changes tempo, not authority or evidence standards.
- If the owner uses a word that is not a call, or a call is unclear, say how you are reading it before acting.
- Report, hold, do not fill. Name a gap. Do not invent the answer.

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

## Pairing

To grade finished work against these stages, use the `work-eval` skill. Its verdicts map onto these calls (ready for `probatio`, needs `emenda`, needs `judicium`).
