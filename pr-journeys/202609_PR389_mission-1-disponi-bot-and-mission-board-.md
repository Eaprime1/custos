# PR Journey: #389 — mission 1: disponi bot and mission board state labels

**Repository:** Eaprime1/custos  
**prima-clock:** 202609291811  
**Branch:** `claude/epic-volta-peuls2` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Build the disponi bot so a navigo can ask `disponi` on a mission issue and get open, in progress, or paused from the labels. Closes #388.

## What Arrived

- `.github/workflows/disponi.yml` — read-only answer to a `disponi` cue on a `mission` issue. It skips bots, PRs, non-mission issues, and cues inside quotes or code, and its reply never repeats the cue, so it cannot loop.
- `in-progress` and `paused` labels, added to `sovran-labels.yml` and to the list inside `sovran-labels-sync.yml` (the sync keeps its own list).
- `docs/mission-board.md` — `anchor-review` removed from the label table; a note says the board does not use `claimed` (public claim tracker) or `anchor-review` (broad anchor label), and that Deck Master review follows CODEOWNERS paths.

Tested by running the workflow script against a mocked context: 12 cases (each state, non-mission issue, plain comment, quoted cue, inline code, fenced code, cue mid-comment) all pass. Completion check from #388 passes.

Like the earlier sync, an `issue_comment` workflow runs from `main`, so the bot goes live after merge. The label sync then creates `in-progress` and `paused`.

## Resonance

*Even, the board learns to answer.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609291804 | @Eaprime1 |
| Finalized | 202609291811 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| DeepSource: Lua | ⏭ |
| DeepSource: Apex | ⏭ |
| DeepSource: Dart | ⏭ |
| DeepSource: Erlang | ⏭ |
| DeepSource: Helm | ⏭ |
| DeepSource: Perl | ⏭ |
| DeepSource: VB.NET | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| GitGuardian Security Checks | ✅ |
| packet | ✅ |
| custos-speaks | ✅ |
| claude-review | ✅ |
| claude-review | ⏭ |
| check | ⏭ |
| claude-review | ⏭ |
| packet | ✅ |
| dependency-review | ✅ |
| custos-speaks | ✅ |
| validate | ✅ |
| scan | ✅ |
| scan | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 25 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 4 file(s) changed |
| Verification | 5/5 | 25 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — the only hits are `.replace(` calls in the new workflow's code, which are intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable (the comment body is read in script code, never put into a shell command)

## What Door Does This Open?

Mission 2 (the petitio template) can now hook the "open" answer. Should it?

## Witnesses

- @Eaprime1 · 202609291811 · sealed at finalize

---
**prima-clock:** 202609291811  
**witnessed:** true — 1 witness, sealed 202609291811 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*