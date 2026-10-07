# PR Journey: #423 — setup P1b: pin actions by SHA, read-only token for two checks, Dependabot

**Repository:** Eaprime1/custos  
**prima-clock:** 202610070507  
**Branch:** `claude/workflow-hardening-p1b` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED (auto)  

## Intent

Harden the workflows, as split off from P1 (#422): pin every action, give a read-only token to the checks that had none, and keep the pins current automatically.

## What Arrived

- **Every action is pinned to a full commit SHA.** The release name sits in a comment, for example `actions/checkout@11d5960… # v4.4.0`. That is 32 references across 22 files.
  - Each SHA is the commit the floating tag (`@v4`, `@v7` …) pointed at today, so nothing changes in behavior.
  - The `github-script` pin reuses the one already in `finalize-pr.yml`.
  - A pinned SHA can't be moved under us, which a tag can.
- **Read-only token** for `prima-witness.yml` and `scan-lexeme.yml`, as `permissions: contents: read`. These two were the only workflows running with the default token scope. The other three I had listed in #422 already set their permissions per job, so that count was wrong.
- **`.github/dependabot.yml`**: watches the `github-actions` ecosystem weekly. It opens at most one grouped PR, labelled `upgrade`, and keeps the SHA and its version comment in step.

Notes:
- This PR touches `claude-code-review.yml`, so that workflow will skip its own review here, by design.
- The plan's other P1 security items (CodeQL, gitleaks, branch protection and secret-scanning settings) are P6. The settings need the GitHub settings page.

## Resonance

*fastened

---*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610070302 | @Eaprime1 |
| Auto-Finalized | 202610070507 | github-actions[bot] |

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
| check | ⏭ |
| packet | ✅ |
| DeepSource: VB.NET | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| check | ⏭ |
| record | ⏭ |
| claude-review | ⏭ |
| packet | ✅ |
| GitGuardian Security Checks | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| validate | ✅ |
| custos-speaks | ✅ |
| scan | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 24 CI check(s) — all passed |
| Consistency | 5/5 | Description complete · ethics 5/5 |
| Scope | 3/5 | 22 file(s) changed |
| Verification | 5/5 | 24 check run(s) completed |
| **Valuation** | **High** | 18/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts (fewer permissions, fixed versions)
- ✅ Shell inputs validated where applicable (n/a, no scripts changed)

## What Door Does This Open?

Should P6, the settings-page checks for branch protection, secret scanning and push protection, come next, or P2, the `domos/` move?

---

**prime state:** 3  
**witnessed:** false

🤖 Generated with [Claude Code](https://claude.com/claude-code)

---
**prima-clock:** 202610070507  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*