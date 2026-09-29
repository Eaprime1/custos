# PR Journey: #381 — refactor: replace == with = in shell test for portability

**Repository:** Eaprime1/custos  
**prima-clock:** 202609290759  
**Branch:** `deepsource-autofix-f2ddf4ac` → `main`  
**Author:** @deepsource-autofix[bot]  
**State:** FINALIZED  

## Intent

Port the DeepSource BASH-W0121 fix — replace `==` with `=` in a `[[ ]]`
shell test in `tools/repo_hygiene_check.sh` for POSIX portability.

## What Arrived

One-line change in `tools/repo_hygiene_check.sh`:

```
- [[ -z "$ITEM" || "$ITEM" == \#* ]] && continue
+ [[ -z "$ITEM" || "$ITEM" = \#* ]] && continue
```

`==` is a Bash extension; `=` is the POSIX standard for string equality
in `[[ ]]`. The same fix was applied in commit `0ea5d2b` on the `radix`
branch (PR #380); this lands it on `main`.

## Resonance

*Tidy*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609290718 | @deepsource-autofix[bot] |
| Finalized | 202609290759 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| packet | ✅ |
| check | ✅ |
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
| packet | ✅ |
| check | ✅ |
| GitGuardian Security Checks | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| validate | ✅ |
| custos-speaks | ✅ |
| scan | ✅ |
| claude-review | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 24 CI check(s) — all passed |
| Consistency | 4/5 | Template complete · ethics 0/0 |
| Scope | 5/5 | 1 file(s) changed |
| Verification | 5/5 | 24 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

*No ethics checklist found.*

## What Door Does This Open?

*Not recorded.*

## Witnesses

- @Eaprime1 · 202609290759 · sealed at finalize

---
**prima-clock:** 202609290759  
**witnessed:** true — 1 witness, sealed 202609290759 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*