# PR Journey: #334 — Extend pr-lifecycle guide: full lifecycle, cue vocabulary, reviewer roster

**Repository:** Eaprime1/custos  
**prima-clock:** 202609211046  
**Branch:** `guides/pr-lifecycle-cue-vocabulary` → `main`  
**Author:** @Eaprime1  
**State:** MERGED (momentum stub — not finalized)  

## Intent

Formalize the comment-cue-driven PR workflow and the reviewer roster pattern. This gives external contributors and internal Voices of Navigo a shared vocabulary for how a PR moves from draft to merge, and gives custos a defined coordination role.

## What Arrived

### `guides/pr-lifecycle.md` — extended

Added before the existing Three Stages:

**Full Lifecycle section** — shows the complete flow with cue triggers:
```
draft → [ready for review] → final review → [finalize] → finalize → [merge] → merged
```

**Contributor Types** — distinguishes external contributors from Voices of Navigo (internal navigo teams). Both use the same cue pattern; the distinction is who they are, not how they participate.

**Cue Vocabulary table** — four comment triggers:

| Cue | Who | Effect |
|---|---|---|
| `ready for review` | Shepherd | PR is clean; custos builds reviewer roster |
| `final review: [name] done` | Any reviewer | custos checks that reviewer off the roster |
| `finalize` | Shepherd | Opens finalize stage once all reviewers are done |
| `merge` | Shepherd | custos merges when clean |

**Reviewer Roster** — PR-body checklist pattern. custos maintains it, checks entries as cue comments arrive, posts a notice when all are complete. Makes review state visible at a glance without requiring GitHub's required-reviewers system.

**Relationship table** — added entries for `final-review.yml` and `finalize-pr.yml`.

Updated `suit` and `prima-clock`.

## Resonance

*clarified*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609211025 | @Eaprime1 |
| Merged | 202609211046 | @Eaprime1 |

## Files Changed

1 file(s) · +67/−2

---
**prima-clock:** 202609211046  
**witnessed:** true  
*momentum stub — archivist · 🌿 Custos — the shepherd closes the fold · ∰🌿*