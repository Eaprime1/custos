---
name: latin-workflow
description: Read and answer the Latin workflow calls (recensio, probatio, lustratio, judicium, novissimum, cursus, emenda, with modifiers like prima, ultima, extrema). Use when the owner writes a call, asks what a call means, asks which stage a piece of work is at, or wants to steer a conversation or PR by stage. Also use before posting any PR comment that contains a cue, when the owner asks for a merge call, and when adding, renaming or proposing a lexeme.
---

# Latin Workflow

**Prima-clock:** 202611091441
**Suit:** ♣️ Club, working copy
**Source of truth:** `docs/latin-workflow-glossary.md` (PRs), `docs/latin-workflow-conversation-seed.md` (conversations). Hodie's port is `hodie/docs/latin-workflow.md`. This skill is a working summary. When it disagrees with those, they win.

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
| | | `supplenda` | SPL |

The first three letters of `expeditus` would be EXP, and `confirmanda` or `coniunctio` would be CON. `cue-parser.js` already uses `exp-`, `set-`, `con-` and `oth-` as conversation-ID prefixes, so EXD, CNF and CNJ avoid the clash. The owner confirms or replaces them.

**Hyphen call form (proposed).** Name, then modifier, then action:

| Call | Reads as |
|---|---|
| `^claude-ult-rec` | Claude produces an ultima recensio document |
| `^omnes-ult-rec` | Every contributor able produces an ultima recensio comment or document |
| `^omnes-rec` | A recensio from every contributor able |
| `^omnes-ren-rec` | Renovata recensio from everyone, for a significant change in the PR |

Status: proposed. `cue-parser.js` reads `^name cue words` with spaces today, and no workflow reads the hyphen form, so for now it is vocabulary for the conversation. Not settled: the order of the `emenda` modifiers (`confirmanda`, `supplenda`) in hyphen form, and the owner's idea of `^^^` (a triple prime) as an attention flag.

The older two-letter examples (`PR-REC`, `UL-PRO` and the rest) were inherited examples and were not installed as labels. They are superseded by the codes above.

### Proposed lexemes (awaiting the owner's ruling)

| Lexeme | Code | Proposed meaning |
|---|---|---|
| `coniunctio` | CNJ | The merge call: merge when ready. Check the gates first (required checks, open threads, seal covers this head, file review). If any concern remains, stop and state it as a `judicium` (options, recommendation, what each choice changes) and wait. Merge only when no concern remains. |

Proposed in answer to the owner's #517 review comment: "add a latin lexeme for the merge when ready (if there is a concern I want to address it before the merge)". *Coniunctio* is Latin for a joining. The word is the owner's to accept or swap for another. No workflow reads it. After the owner calls it, a navigo merges by the repo's merge method, which matches the rule that a navigo merges when the owner asks in the conversation. Until the owner rules, do not add it to the glossary or any recorder list.

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
| a call the recorder knows, or opening a PR ready | `latin-cue-record.yml` | Logs one row in a living comment: checks, threads, merge state. Calls no model. Custos reads recensio, probatio, lustratio, judicium, novissimum and cursus with the modifiers prima, ultima, suprema, extrema, renovata and expeditus. Hodie's `cue-parser.js` also reads `emenda`, `confirmanda` and `supplenda`. |
| `@claude placet` | placet workflow | Flips a mission to in-progress. Owner only. |
| every other call | nothing | Words for the conversation. That includes `emenda` in custos and every proposed lexeme. |

Neither a seal label nor a passing assessment merges. The owner asks for merge separately; `coniunctio` is the proposed call for that.

**Owner direction (not implemented):** `@claude` should return to its primary mission, calling Claude, and the seal should leave the `@claude finalize` wording for the Latin grammar. That touches `finalize-pr.yml` (and its file name, if a rename is practical), its tests, the docs that name it, and hodie's copy, so it needs its own PR and review. Until it lands, the cues in the table above remain live.

## The road of a PR

1. Contributor opens the PR ready. First witness, logged as Prima Recensio.
2. Contributor `recensio` / `ultima recensio`: reviews its own PR and fixes what it finds.
3. Shepherd `probatio`: soft seal.
4. Shepherd `@claude finalize` or `ultima probatio`: the seal. Owner only.
5. Shepherd runs oversight (hodie: the `final-oversight` label, then the approval). Report only.
6. Shepherd `emenda`: asks the contributor to repair a flag. A fix is a new head and needs a new seal.
7. Shepherd says merge in the conversation.

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
3. **Source of truth first.** Add it to `docs/latin-workflow-glossary.md` and `docs/latin-workflow-conversation-seed.md` (the seed block and its table). Stamp the change with `bash tools/prima_clock.sh` and add a reconciliation note if it changes an older statement.
4. **Mirrors** (words only):
   - `hodie/docs/latin-workflow.md` and `hodie/docs/latin-lexemes.txt`
   - `guides/navigo-session-kit/owner-cues.md` and the pointer in `.perplexity/latin-workflow-glossary.md`, which list the terms
   - any other system that keeps its own list: add its path here so the next change finds it
5. **Only if a workflow must read it** (a separate PR, because workflow paths need Deck Master review):
   - custos `.github/workflows/latin-cue-record.yml`: the `contains(...)` prefilter lines and the `ACTIONS` / `MODS` arrays
   - hodie `.github/scripts/cue-parser.js` (`ACTIONS`, `MODIFIERS`, `VERBS`), with `scripts/test_cue_parser.js` and `scripts/test_latin_cue_record.js`
6. **Update this skill:** the Actions or Modifiers table, the codes table, the live-versus-words table, the frontmatter description if it adds a trigger, and the `Prima-clock` line.
7. **Check nothing was missed:** `grep -rIl -i '<word>' custos hodie fleet-commander armarium mandelbrot`, then `bash tools/scan_lexeme.sh`.
8. **Keep it proposed until the owner rules.** List a new word under Proposed lexemes, as `coniunctio` is, and move it into the main tables only after the ruling.

Known gap: the custos recorder does not read `emenda`, `confirmanda` or `supplenda`, while hodie's parser does.

## Pairing

To grade finished work against these stages, use the `work-eval` skill. Its verdicts map onto these calls (ready for `probatio`, needs `emenda`, needs `judicium`).
