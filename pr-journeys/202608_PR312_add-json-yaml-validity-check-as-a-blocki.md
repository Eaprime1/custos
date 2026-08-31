# PR Journey: #312 — Add JSON/YAML validity check as a blocking CI gate

**Repository:** Eaprime1/custos  
**prima-clock:** 202608310356  
**Branch:** `feat/validate-json-yaml` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Seed Weir pick — build the JSON/YAML-validity check named after pixelator PR #2's silent merge corruption.

## What Arrived

`tools/validate_json_yaml.sh` + `.github/workflows/validate-json-yaml.yml` — a real, blocking correctness check (unlike advisory `scan_lexeme.sh`). Testing it against custos itself immediately found a design gap: `.claude/homunculus/instincts/inherited/*.yaml` is a deliberate hybrid frontmatter+Markdown format, not pure YAML — excluded explicitly with a comment rather than left to false-positive. Added to `tools/repo_hygiene_manifest.txt`. Ported directly to pixelator and prima (Prima-voiced name for prima's copy) — both pass clean.

## Resonance

*foundational

---*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202608302242 | @Eaprime1 |
| Finalized | 202608310356 | @Eaprime1 |

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
| claude-review | ✅ |
| validate | ✅ |
| scan | ✅ |
| scan | ✅ |
| dependency-review | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 18 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 5 file(s) changed |
| Verification | 5/5 | 18 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — only harmless false positives (the word "broken" describing the check's own purpose)
- ✅ No unintended harm surface
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

The other open Seed Weir entry (branch-triage-before-closing pattern write-up) is still open, not built here.

---
**prima-clock:** 202608310356  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*