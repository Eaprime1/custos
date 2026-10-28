# PR Journey: #455 — workflow-lint: adopt hodie's expression-injection check (with a fix), fix track-pr-failures

**Repository:** Eaprime1/custos  
**prima-clock:** 202610160537  
**Branch:** `claude/nifty-mendel-vyji3n` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Second peer swap, run lean from one conversation: take hodie's workflow-injection check, because custos has the most comment-driven workflows and no guard against a `${{ }}` value pasted into a `run:` script.

## What Arrived

- `tools/check_workflow_injection.py`: hodie's checker, split into small functions (Lizard clean at 5 / 20 lines / 4 params) and **fixed**. Hodie's version matched only a single-line `run: cmd`. The block pattern was never reached, because `run: |` also fits the inline pattern, so `run: |` and `run: >-` blocks and `- run:` steps were never scanned. Those blocks are where injection usually lives.
- `tools/test_check_workflow_injection.sh`: 11 checks, shellcheck clean. Against hodie's original script, 5 of the 11 fail, so the table does catch the blind spot.
- `.github/workflows/workflow-lint.yml`: runs the table and then the checker over `.github/workflows` when a workflow or the checker changes. Read-only, no API.
- `.github/workflows/track-pr-failures.yml`: the fixed checker found three expressions in its `run:` script (`workflow_run.event`, `.conclusion`, and `toJson(github.event.workflow_run)`, which carries branch names, commit messages and PR titles a contributor controls). They now go through `env:`. Checked locally with the step body: the normal outputs are unchanged for a PR failure, a push and a PR success, and a hostile payload (branch `x; echo PWNED`, a commit message with an `EOF` line) produces nothing injected.
- `CLAUDE.md`: workflow count 28, the new test, the new workflow, a usage line.

Watched paths touched, named here: two files under `.github/workflows/` (`workflow-lint.yml` new, `track-pr-failures.yml` edited). Nothing under `vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/` or `device/`.

## Resonance

*Guarding*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610160512 | @Eaprime1 |
| Finalized | 202610160537 | @Eaprime1 |

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
| final-oversight | ⏭ |
| dependency-review | ✅ |
| validate | ✅ |
| custos-speaks | ✅ |
| scan | ✅ |
| injection-check | ✅ |
| scan | ✅ |
| packet | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 21 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 5 file(s) changed |
| Verification | 5/5 | 21 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — no distressed lexemes in the new files
- ✅ No unintended harm surface in tools or scripts: read-only checker, no secrets, no network
- ✅ Shell inputs validated where applicable (the one workflow step that changed now takes its values through `env:`)

## What Door Does This Open?

The same fix belongs in hodie's copy, which has the same blind spot (its own workflows come out clean with the fixed checker). Does the swap-back go as its own small hodie PR? I am preparing it.

## Witnesses

- @Eaprime1 · 202610160537 · sealed at finalize

---
**prima-clock:** 202610160537  
**witnessed:** true — 1 witness, sealed 202610160537 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*