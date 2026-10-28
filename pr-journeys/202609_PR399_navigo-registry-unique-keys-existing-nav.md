# PR Journey: #399 — Navigo registry: unique keys, existing nav numbers stay

**Repository:** Eaprime1/custos  
**prima-clock:** 202609292030  
**Branch:** `claude/navigo-registry-keys` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Revise the draft navigo registry (#397) on the Shepherd's direction: existing nav numbers stay, and a unique key column identifies each navigo instance.

## What Arrived

`docs/navigo-registry.md` rewritten around three identifiers: **key** (unique system id per instance, never reused), **number** (the existing `nav1`, `navigo2`, `nav3`, `nav5`, unchanged) and **label** (the name the Shepherd uses). Table rows for Claude, Gemini Notebook (Ethica Nexus), Perplexity, Unexusi, ChatGPT and Gmail. Perplexity and Unexusi are left unnumbered; `nav4` is noted as free. The one number conflict (Perplexity's PRs call Claude "Navigo2") is written out. CLAUDE.md and `turns/CULTIVATION.md` stay untouched until the keys are confirmed. Drift entry recorded.

## Resonance

*Anchored.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609292013 | @Eaprime1 |
| Finalized | 202609292030 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| DeepSource: Analysis | ⏭ |
| Codacy Static Code Analysis | ✅ |
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
| Correctness | 5/5 | 8 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 2 file(s) changed |
| Verification | 5/5 | 8 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Once the keys are confirmed, should the mission board record the holder's key when `placet` accepts a petitio?

## Witnesses

- @Eaprime1 · 202609292030 · sealed at finalize

---
**prima-clock:** 202609292030  
**witnessed:** true — 1 witness, sealed 202609292030 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*