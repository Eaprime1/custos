# Plan: The Caret Cue, the Cue Router and the Living Observation

`prima-clock: 202610070939`
`suit: ♦️ Diamond — 1/3 plank. A plan for a fresh conversation to build.`
`author: nav1 (Claude) for the Shepherd, from the 2026-10-07 session (PRs #404, #405, #420, #425, #426, #427)`

---

## How to use this plan

Start a new conversation on a branch cut from `main`. Build one phase per PR, in order.
Each phase says what to build, how to check it, and what it must not do. The Shepherd
decides at every phase gate. A navigo never seals or merges.

## What was decided (2026-10-07)

| # | Decision | By |
|---|---|---|
| 1 | The cue sigil is the caret, `^`. It is one key on a desktop keyboard and reads as pointing at someone. | Shepherd |
| 2 | The observation becomes a **living PR comment**, archived to a file at merge. The PR's own perspective is carried into the project, so it grows there. | Shepherd |
| 3 | Cues for navigos that Actions cannot run become **commissions with labels** (`awaiting:<navigo>`). | Shepherd |
| 4 | This design is filed as a note, then built in phases. | Shepherd |

## Why: what the session showed

**What worked.** The observation before the seal caught a stale `head:` line. The cue record
gave the whole PR state in one comment, and ticked the observed box on its first live use.
Reading Codacy's annotation found the real cause of a finding that two guesses had missed.

**What was slow or fragile.**

1. **Completing the observation takes a push, which re-runs every check.** This is why a
   seal cue bounced on #426 and why #427 needed several quiet waits.
2. **A bounced seal cue is lost.** The owner must post it again.
3. **The seal record carries no head SHA.** A bot journey commit lands after the seal, so the
   sealed commit and the merged commit differ.
4. **Notification noise.** DeepSource edits one comment about ten times per push. About forty
   wake-ups in one session needed no action.
5. **Eight workflows each parse `@claude` their own way.** `finalize-pr.yml`, `disponi.yml`,
   `placet.yml` and `latin-cue-record.yml` each re-implement quote, code and footer
   stripping, with `contains`, regex or `grep -qF`.
6. **Smaller friction.** The designated branch survives a squash merge, so each PR needs a
   no-op merge to push without a force. A recent-only PR list led to a duplicate PR. The
   packet and cue-record workflows run from `main`, so each fix lags one PR.

**What was missed.** The observation template has no Conversation ID line. The conversation
seed (`docs/latin-workflow-conversation-seed.md`) still says Ultima Probatio seals a
conversation. `device/active.md` carries a June stamp and says it is `pixel8`-only, yet it
sits on `main`. The observed box ticks when the document exists, not when `status: complete`,
and the seal gate checks neither (open in `turns/CULTIVATION.md`).

## The caret cue

### Grammar

```
^<navigo> [<conversation-id>] <cue words>
```

- The line starts with `^`. Anchored at line start, so a caret inside a sentence, a regex or
  a formula is never a cue.
- `<navigo>` is a name from `docs/navigo-registry.md` (`claude`, `chatgpt`, `gemini`,
  `perplexity`, `unexusi`), or `custos` to address the workflows themselves. Names are
  matched against the registry, not guessed.
- `<conversation-id>` is optional and uses the form from `tools/session_id.sh`
  (`<type>-<6 chars>`), for example `set-4f2a1c`. It says which conversation is meant.
- `<cue words>` are the Latin calls in `docs/latin-workflow-glossary.md`, with modifiers.

Examples: `^claude ultima probatio`, `^chatgpt prima recensio`, `^custos check`,
`^gemini set-4f2a1c disponi`.

### Why the caret

The keys that pass through GitHub markdown without side effects are `^`, `%`, `;`, `=` and
`!`. `@` mentions, `#` links, `$` renders math, `*`, `_` and `~` format, `>` quotes, and the
backtick is code. On Gboard the caret is on the second symbols page; `!` is on the first but
is the common bot-command prefix. The Shepherd chose the caret.

### Transition

`@claude` keeps working. The shared parser accepts both, and the old workflows move to it
one at a time. Nothing is retired in the first phase.

## The shared parser

One place for the rules that eight workflows now copy. A composite action (or a small
module the workflows call) that takes a comment and returns `{sigil, navigo, id, cue,
modifiers}` or nothing. It must:

- accept only `OWNER` association, and never a comment with the Claude Code footer;
- strip fenced code, inline code and `>` quotes before looking for a cue;
- anchor at line start for the caret form;
- match the navigo against the registry;
- be tested offline against a table of comments (the same way the scanner and packet
  matching were tested this session).

## The cue router

A listener, `cue-router.yml`, on `issue_comment` and `pull_request_review_comment`.

- **Logs** every parsed cue in the cue record, with a new **To** column for the addressee.
- **`^claude` and `^custos`** are handled like today's `@claude` cues.
- **Other navigos** cannot be driven by Actions, so the router makes a **commission**: one
  comment holding the exact prompt (the mission or PR URL, files to read first, the
  completion check, the PR template format, per the commissioning rule in `CLAUDE.md`), plus
  the label `awaiting:<navigo>`. The Shepherd carries the prompt into that conversation.
- **A return** is filed through the Weir and the label becomes `returned:<navigo>`. A small
  ledger keeps the dispatch and its return together so they can be matched.
- **It never seals or merges.** The seal stays in `finalize-pr.yml`, on the owner's cue.

Labels to add to `.github/sovran-labels.yml`: `awaiting:chatgpt`, `awaiting:gemini`,
`awaiting:perplexity`, `returned:chatgpt`, `returned:gemini`, `returned:perplexity`.

## The living observation

Today the observation is a file in the branch, so completing it moves the head and re-runs
the checks. Instead:

1. **Prima Recensio** opens a **living comment** on the PR (marked like the cue record and
   Shepherd Considers). It holds the observation: what was seen, what was fixed, what is
   carried forward, the scans, the ready-for-seal items, and a `status` line.
2. The navigo and Shepherd update the comment as the review goes. No commit, no re-run.
3. **At merge**, the archivist writes the comment to `turns/observations/` (as it already
   does for journey documents), so the file appears on `main` with the PR.
4. **The PR perspective feeds the project.** On archive, the carried-forward items become
   `turns/CULTIVATION.md` entries or issues, bot flags go to `turns/review-surface.md`, and
   the PR's decisions are linked from the project record. The PR's view of itself grows into
   the project instead of staying in a closed thread.
5. The observed box ticks when `status: complete`, not when a file exists. The cue record
   shows the status line either way.
6. The seal record gains `head=<sha>`, and a bounced seal cue is bound to its head SHA so the
   gate can honor it once checks go green if the head has not moved (bot journey commits do
   not count as moving it).

## Phases

| Phase | Build | Check | Must not |
|---|---|---|---|
| 0 | This note, filed. | The provenance scan passes. | Change any workflow. |
| 1 | The shared parser and an offline test table. | Every row in the table gives the expected parse. | Change what any workflow does yet. |
| 2 | `cue-router.yml`, the To column, the labels. | A test PR shows the cue, the commission and the label. | Seal, merge or label anything on a `^claude` cue beyond logging. |
| 3 | The living observation comment, the archive at merge, the SHA binding. | A PR completes its observation with no new commit; the file lands at merge. | Gate the seal on the observation without the Shepherd's word. |
| 4 | Glossary, conversation seed, observation template (Conversation ID), `CLAUDE.md`. | The seed and glossary agree on what Ultima Probatio does. | Rename existing cues. |
| 5 | Noise: DeepSource and Codacy settings, a branch-restart script, a PR-for-branch check. | Fewer wake-ups on a test PR. | Hide a real finding. |

## Safety notes

- The cue is owner-only, anchored at line start and checked against the registry. A navigo
  describes a cue in words and never posts one unless the owner asks, as now.
- A caret in code, a quote or a formula is never a cue.
- The router logs and dispatches. The seal and merge keep their current gates.

## Open questions for the Shepherd

1. Case: are `^Claude` and `^claude` the same? (Proposed: yes, matched without case.)
2. Keys or names: should the registry key (for example `nav1`) also work after the caret?
3. Where the dispatch ledger lives: a PR comment, or a file under `queue/`.
4. Whether `^custos` should replace `@claude check` and `@claude concordance`.

## Not part of this plan

`.deepsource.toml` sets the Secrets analyzer to `enabled = false` yet it still runs; that is a
config question for DeepSource's own settings, noted here so it is not lost.
