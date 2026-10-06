# PR Journey: #415 — tools: fixture tests for validate_json_yaml.sh

**Repository:** Eaprime1/custos  
**prima-clock:** 202610061152  
**Branch:** `claude/validator-tests-t2203p` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Give the validator regression tests, as the Shepherd approved. A reviewer pointed out that the duplicate-merge-key guard (custos #408, pixelator #17) had only been checked by hand.

## What Arrived

`tools/test_validate_json_yaml.sh`: nine cases that build small files in a scratch directory and check the validator's exit code.

- valid JSON passes; an unclosed JSON array fails; a duplicate JSON key fails
- valid YAML passes; a duplicate YAML key fails
- two `<<` merge keys in one mapping fail; one `<<` with a list of anchors passes; a local key overriding a merged key passes
- a missing directory exits 2

All nine pass against the real validator. Run against a stub validator that always exits 0, five of them fail, so the tests can detect a broken validator. ShellCheck is clean. The script writes nothing outside its scratch directory.

Not wired into CI: adding a step to `validate-json-yaml.yml` is a separate, governed change. A matching PR adds the same test to pixelator.

## Resonance

*pinned*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610061052 | @Eaprime1 |
| Finalized | 202610061152 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| copilot-pull-request-reviewer | ✅ |
| packet | ✅ |
| claude-review | ✅ |
| record | ✅ |
| custos-speaks | ✅ |
| Codacy Static Code Analysis | ✅ |
| claude-review | ⏭ |
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
| scan | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| validate | ✅ |
| packet | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 24 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 1 file(s) changed |
| Verification | 5/5 | 24 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Should the test run as a step in `validate-json-yaml.yml`, so the validator is checked on every PR?

## Witnesses

- @Eaprime1 · 202610061152 · sealed at finalize

---
**prima-clock:** 202610061152  
**witnessed:** true — 1 witness, sealed 202610061152 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*