# Shepherd's Latin Workflow Lexeme Guide

**Session anchor:** 202610212220 UTC (converted from the Shepherd's 202610211520 Pacific session marker; not a claimed creation time)  
**Suit:** ♦️ Diamond — working reference  
**Status:** guide, not an authorization or a substitute for the installed workflows  
**Origin:** Shepherd request in the review of KAN-6 / PR #469

This is the quick reading companion to [Latin Workflow v2](latin-workflow-v2.md), the [glossary](latin-workflow-glossary.md), the [plain-text pocket list](latin-lexemes.txt), and the [Jira pipeline](jira-pipeline.md). If this guide and an installed script disagree, check the script before acting. **A recorded cue is not proof a model ran, a review finished or a seal was granted.**

## 1. The road from a PR to a merge

| Stage | Voice | Evidence to expect | Effect |
|---|---|---|---|
| Prima Recensio | Contributor/event | Initial PR snapshot, current head and open findings | Recorded when a non-draft PR opens or becomes ready |
| Recensio | Contributor | Findings, changes, commit IDs and checks | Review and repair |
| Ultima Recensio | Contributor | Every finding fixed, rejected with evidence, or carried forward by owner/destination | Contributor final review; **no seal** |
| Probatio | Shepherd only | Current-head readiness and contributor response | Soft seal: the owner's caret cue applies `ready-for-oversight` |
| Final oversight | Independent observer | Observation/report and remaining risks | Review only, not automatic merge |
| Emenda (if needed) | Shepherd directs contributor | One disposition for each oversight flag | Repair, then repeat final contributor review |
| Ultima Probatio | Shepherd only | Resolved blockers and owner decision | Final seal; **not merge** |
| Merge | Shepherd explicitly decides | Merge approval and repository checks | Separate operation |

A **person's new push** after soft readiness removes the `ready-for-oversight` label; the changed head requires fresh review and a fresh soft cue. The observation and final seal are kept independent of contributor review.

## 2. Addressing a navigo

A caret at the **start of a non-quoted line** addresses a participant: `^chatgpt ultima recensio`. Other understood names include `claude`, `gemini`, `perplexity`, `unexusi`, `custos`, `omnes` (all contributors), and `cuncti` (whole-project perspective). A conversation-specific ID such as `set-4f2a1c` may follow the name.

The cue parser skips bots, non-owner commands, code blocks, quoted lines and recognized Claude Code footer comments. **This is a recorder and label interface, not a notification guarantee.** ChatGPT sessions without a subscribed bridge require the Shepherd to carry the PR number and instruction back into the conversation. Connected tools may post as the owner account, so GitHub identity alone must not substitute for an actual Shepherd decision.

## 3. Working lexemes

| Lexeme | Plain meaning | What the contributor returns |
|---|---|---|
| `recensio` | Examine and repair | Findings, commits, verification |
| `lustratio` | Polish and reconcile | Clearer reading path, no hidden scope change |
| `judicium` | Request a ruling | Choices, tradeoffs, recommended decision |
| `novissimum` | Rear guard | Small loose ends closed, remainder filed with owner |
| `cursus` | Traverse applicable stages | Stage-by-stage account, **not automatic merge** |
| `emenda` | Correct the named flags | Fixed, not a defect (with evidence), or carried forward |
| `renovata` | Refresh the current head | Changed state and any new blockers; may stand alone |
| `probatio` | Request readiness evidence | Contributor response; only the owner's qualifying cue can apply the soft label |

**Modifiers** adjust scope, never authority: `prima` (first/orient), `ultima` (final/no new scope), `suprema` (highest presentation), `extrema` (root-cause care), `renovata` (refresh), `expeditus` (focused pace, same standards). For example, `ultima recensio` is the last contributor review, whereas `ultima emenda` is the last planned repair pass.

**Issue-side check-in words:** `disponi` asks if a mission is available; `petitio` submits a plan for a nod; `placet` is the owner's nod. These are distinct from the PR lifecycle.

## 4. Proposed / reserved words — do not assume enforcement

| Word | Intended meaning | Current boundary |
|---|---|---|
| `refice` | Larger repair with a written plan | Reserved in v2; **not a live parser action** |
| `semina` | Seed a portable handoff to another conversation | Proposed; **not in the parser or v2** |
| `sustine` | Hold a PR pending the Shepherd's release | Proposed; neither the command nor a `held` final-seal gate has been installed |

The `held` label already exists, but **its presence alone does not currently stop `finalize-pr.yml`**. Do not treat a suggested label or phrase as a working safety gate. Likewise, the proposed soft-stage automatic Codacy scan is not installed by the Jira pipeline document.

## 5. Before giving a soft readiness cue

Check the PR **head SHA**, scope/acceptance criteria, diff and open review threads; distinguish superseded cancelled runs from current failures; record all required checks and any authorized exceptions; and name unresolved work with its owner and destination. The contributor can state readiness, but only the Shepherd issues the owner cue. After any head change, recheck the evidence.

A useful contributor receipt has: **PR/head; inspected evidence; each finding and resolution commit; checks and exact conclusions; carried-forward item, owner and destination; next authorized action.** Never write “passed” for a check that was not observed.

## 6. Suit and plank names across systems

Linear uses `Seed`, `Carbonite`, `Aethereal`, `Pinnacle`; and `Germ`, `1/3 Plank`, `2/3 Plank`, `3/3 Plank`, `Crystallized`. The prefixed `suit-*` and `plank-*` labels in the [Jira pipeline](jira-pipeline.md) are **proposed Jira-safe derivatives**, not the literal Linear names. The conflict with older suit descriptions in `CLAUDE.md` is recorded for the Shepherd to decide.

## 7. Practical reminders

- **No automatic wake-up:** a comment tagged `^chatgpt` can be recorded without contacting a ChatGPT session; carry the PR link here when necessary.
- **Soft is not final:** `ready-for-oversight`, final observation, owner final seal and merge are separate events.
- **Repair is not blame:** `emenda` names a corrective task; a finding can be disproved with evidence or carried forward explicitly.
- **Owner instructions require owner intent:** do not paste an owner-only final-seal command into a live PR as an example.
- **Unknown stays unknown:** label proposed rules and unchecked integrations as such.

*Custos keeps the record; the Shepherd keeps the final decision.*
