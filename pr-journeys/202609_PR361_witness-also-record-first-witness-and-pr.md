# PR Journey: #361 — Witness: also record "First Witness" and "Prima Witness"

**Repository:** Eaprime1/custos  
**prima-clock:** 202609262301  
**Branch:** `claude/trusting-faraday-kdoq87-first-witness` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Let witnessing answer to eaprime1's own words. On #360 the witness comment was "First Witness eaprime1", and the workflow skipped it because it only knew `witnessed`.

## What Arrived

- **`witness-pr.yml` and `finalize-pr.yml`:** one shared pattern at all three places a witness comment is recognised.
  - A witness comment may start with **`witness`** or **`witnessed`**, optionally prefixed by **`First`** or **`Prima`**, in any capitals. That covers `First Witness`, `Prima Witness`, and also `First Witnessed`, which is deliberate leniency.
  - It still has to start the comment and stand as its own word.
  - The job's pre-filter now looks for `witness`, which also covers `witnessed`.
  - The workflow header documents these forms, and the finalize matcher notes that it uses the same ones (Copilot review, 7991d08).

Checked against real and edge-case comments:

| Comment | Result |
|---|---|
| `witnessed`, `Witnessed` + `@claude final review`, `First Witness  eaprime1`, `prima witness`, `Witness.` | recorded |
| `I have not witnessed`, `witnesses are listed`, `First witnessing`, `witness-pr is great`, `@claude ultima Probatio` | skipped |

Finalize rebuilds the list from comments at the seal, so any `First Witness` comment posted before a seal counts. `actionlint` passes on both files.

## Resonance

*prima witness*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609262255 | @Eaprime1 |
| Finalized | 202609262301 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| claude-review | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| validate | ✅ |
| GitGuardian Security Checks | ✅ |
| DeepSource: Analysis | ⏭ |

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

- ✅ Entity agency respected (human, AI, concept — all contributors credited). The owner's own phrasing becomes the protocol.
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — nothing new
- ✅ No unintended harm surface in tools or scripts. Comment text is still only matched against a pattern, never executed; permissions are unchanged.
- ✅ Shell inputs validated where applicable — n/a

## What Door Does This Open?

Should "First Witness" also map onto the Latin grammar, as *Prima Testis*, in the glossary?

## Witnesses

- @Eaprime1 · 202609262301 · sealed at finalize

---
**prima-clock:** 202609262301  
**witnessed:** true — 1 witness, sealed 202609262301 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*