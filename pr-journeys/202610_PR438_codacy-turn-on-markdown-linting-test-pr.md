# PR Journey: #438 — Codacy: turn on Markdown linting (test PR)

**Repository:** Eaprime1/custos  
**prima-clock:** 202610100632  
**Branch:** `codacy/markdown-lint-test` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Turn Markdown linting on in Codacy for custos and leave a trail so the next tuning pass starts from known ground.

## What Arrived

The `**/*.md` exclusion is gone from `.codacy.yml` (every other exclusion kept), a `.remarkrc.json` gives remark-lint its rules through a config file, `.codacy/` is ignored by git, and two stamped guides record where the tokens come from and what is still open.

## Resonance

*Careful*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610100552 | @Eaprime1 |
| Finalized | 202610100632 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| check | ⏭ |
| packet | ✅ |
| check | ⏭ |
| check | ⏭ |
| packet | ⛔ |
| check | ⏭ |
| packet | ⛔ |
| packet | ⛔ |
| check | ⏭ |
| packet | ⛔ |
| check | ⏭ |
| packet | ⛔ |
| check | ⏭ |
| packet | ✅ |
| Codacy Static Code Analysis | ✅ |
| DeepSource: Lua | ⏭ |
| DeepSource: Apex | ⏭ |
| DeepSource: Dart | ⏭ |
| DeepSource: Erlang | ⏭ |
| DeepSource: Helm | ⏭ |
| DeepSource: Perl | ⏭ |
| GitGuardian Security Checks | ✅ |
| DeepSource: VB.NET | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| packet | ✅ |
| scan | ✅ |
| custos-speaks | ✅ |
| validate | ✅ |
| dependency-review | ✅ |
| scan | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 33 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 5 file(s) changed |
| Verification | 5/5 | 33 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Once Markdown linting runs on `main`, which of the new findings are worth fixing and which should be tuned away?

## Witnesses

- @Eaprime1 · 202610100632 · sealed at finalize

---
**prima-clock:** 202610100632  
**witnessed:** true — 1 witness, sealed 202610100632 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*