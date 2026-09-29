# PR Journey: #379 — chore: root cleanup + index.html publish prep

**Repository:** Eaprime1/custos  
**prima-clock:** 202609290547  
**Branch:** `main-publish-prep` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Prepare `main` for the first radix snapshot and publish run. Two concerns: the root had accumulated session exports and unrouted materials that would land visibly on the published site; and `index.html` had stale terminology that didn't reflect what's on main.

## What Arrived

**Root cleanup — 20 files routed from root to proper homes:**

| Destination | Files |
|---|---|
| `.gemini/` | `Gemini—Scribe_of_the_Field.md`, `The_Gemini_Journey.md`, `gemini-code-1781930306290.md`, `gemini-code-1781930323398.md`, `compass_artifact_wf-b08a5ffb.md` |
| `atelier/commissions/` | `seneschal.md`, `seneschal-v2.md` |
| `.shadow-well/` | `PORTAQUE_MANIFEST.json`, `📦PORTAQUE_CONTENT.json`, `📦PORTAQUE_FECAL_TRUTH.json`, `📦INTEGRATION_PROTOCOL.md`, `plexworkflow.md`, `The Science and Phenomenology of Tickling.md`, `📜MOMENTUM_ARCHIVE-*.md` (2 files) |
| `queue/artesium-weir/` | `first_sparklization_journey.docx`, `the-first-sparklization-journey.jpg`, `🌾 The -Grain- Concept.pdf`, `👷🪶AI Project- Navigo….pdf`, `👷🪶AI-Human Creation….pdf` |

Root now holds only standard project files: `CLAUDE.md`, `CONTRIBUTING.md`, `README.md`, `prima.yaml`, `index.html`, `LICENSE.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, `CHANGELOG.md`, `NOTICE.md`, `_config.yml`, `.nojekyll`, `.prime`.

**`index.html` updates:**
- Navigo table: `nav1/nav3/nav5` → `Navigo Claude / Navigo Gemini / Navigo ChatGPT` (reflects naming from PR #377)
- `Bounty` → `Sparstone Trial` in the Gate section (term retired per CLAUDE.md)
- Constellation: added `navigo` and `121` repos alongside `custos` and `tabularium`

## Resonance

*TBD — Shepherd seals.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609290540 | @Eaprime1 |
| Finalized | 202609290547 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| scan | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| validate | ✅ |
| packet | ✅ |
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
| Consistency | 4/5 | Template complete · ethics 0/0 |
| Scope | 3/5 | 21 file(s) changed |
| Verification | 5/5 | 8 check run(s) completed |
| **Valuation** | **Medium** | 17/20 |

## Ethics Check

*No ethics checklist found.*

## What Door Does This Open?

*Not recorded.*

## Witnesses

- @Eaprime1 · 202609290547 · sealed at finalize

---
**prima-clock:** 202609290547  
**witnessed:** true — 1 witness, sealed 202609290547 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*