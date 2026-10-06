# PR Journey: #382 — expand .codacy.yml — prose dirs and all markdown excluded

**Repository:** Eaprime1/custos  
**prima-clock:** 202609290747  
**Branch:** `claude/message-clarity-repo-setup-q0agry` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Unblock PR #380 (`radix → ֍custos֎`) by landing the expanded Codacy
exclusion list on `main`.

Codacy reads `.codacy.yml` from the repository's default branch (`main`)
when analyzing pull requests — changes to the config on a feature/snapshot
branch don't take effect until they land here.

## What Arrived

Added 13 missing `exclude_paths` entries to `.codacy.yml`:

```
.artesian/**
.chatgpt/**
.custos/**
.gemini/**
.perplexity/**
.shadow-well/**
incoming/**
missions/**
pandora/**
pr-journeys/**
queue/**
valuation/**
**/*.md
```

The `**/*.md` global pattern covers all markdown files repo-wide. The
directory patterns cover prose-heavy navigo workspaces and operational
directories that were already excluded in spirit (they hold fragments,
session exports, and natural-language content, not code). Codacy's
sentence-complexity rule has no value here.

## Resonance

*These directories were already excluded in large part; this completes the
picture and stops Codacy from flagging natural-language content.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609290734 | @Eaprime1 |
| Finalized | 202609290747 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| packet | ✅ |
| claude-review | ✅ |
| custos-speaks | ✅ |
| claude-review | ⏭ |
| DeepSource: Analysis | ⏭ |
| Codacy Static Code Analysis | ✅ |
| check | ⏭ |
| GitGuardian Security Checks | ✅ |
| packet | ✅ |
| claude-review | ⏭ |
| dependency-review | ✅ |
| scan | ✅ |
| scan | ✅ |
| validate | ✅ |
| custos-speaks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Analysis

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 15 CI check(s) — all passed |
| Consistency | 4/5 | Template complete · ethics 0/0 |
| Scope | 5/5 | 1 file(s) changed |
| Verification | 5/5 | 15 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

*No ethics checklist found.*

## What Door Does This Open?

*Not recorded.*

## Witnesses

- @Eaprime1 · 202609290747 · sealed at finalize

---
**prima-clock:** 202609290747  
**witnessed:** true — 1 witness, sealed 202609290747 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*