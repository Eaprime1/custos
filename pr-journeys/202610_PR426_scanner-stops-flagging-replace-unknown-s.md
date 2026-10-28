# PR Journey: #426 — Scanner stops flagging replace/unknown; Shadow of Polaris scene index and checklist

**Repository:** Eaprime1/custos  
**prima-clock:** 202610070855  
**Branch:** `claude/quirky-carson-uez4sb` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Stop the placeholder scanners flagging words that are just language, give Shadow of Polaris scene contributors an index and a ready-for-review checklist, and add an oversight observation step before the seal.

## What Arrived

1. **Scanner.** `tools/scan_lexeme.sh` and `review-packet.yml` flag only shouted markers (capitals, whole word) plus a few phrases. `REPLACE` is dropped and `replace` goes to a new draft `atelier/lexemes/reserved-lexemes.md`, which also holds the marker glossary. `CLAUDE.md` and the Gemini/ChatGPT styleguides match. Why `UNKNOWN` flagged: the old scan matched any case and any substring, so "unknown" in ordinary prose hit (137 lines repo-wide, now 8).
2. **Scene setup.** `scenes/INDEX.md` (append-only ledger plus alignment reading), `scenes/READY.md` (checklist), a Conversation ID line in the scene template, pointers from the guide and scenes README.
3. **Observation.** `turns/observations/` (README, template, and the first observation, for this PR), an `observed` box below `witnessed` in the PR template, and `latin-cue-record.yml` shows the observation and ticks the box when the document is on the head commit. The order is observation, then seal, then merge. Glossary updated.
4. Codacy findings fixed along the way. The branch carries a no-op merge of the old #425 branch history so it could push without a force.

## Resonance

*Lighter.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610070821 | @Eaprime1 |
| Finalized | 202610070855 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| DeepSource: Analysis | ⏭ |
| check | ⏭ |
| packet | ✅ |
| custos-speaks | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| validate | ✅ |
| scan | ✅ |
| packet | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Analysis

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 11 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 3/5 | 17 file(s) changed |
| Verification | 5/5 | 11 check run(s) completed |
| **Valuation** | **High** | 18/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Scene contributors get a place to file and a bar to reach before final review, and every PR gets a written oversight record before the seal.

## Witnesses

- @Eaprime1 · 202610070855 · sealed at finalize

---
**prima-clock:** 202610070855  
**witnessed:** true — 1 witness, sealed 202610070855 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*