# Final Review Record: #312 — Add JSON/YAML validity check as a blocking CI gate

**Repository:** Eaprime1/custos
**Branch:** `feat/validate-json-yaml` → `main`
**Author:** @Eaprime1 (navigo15 — Claude Sonnet 5)
**State at time of writing:** OPEN — Final Review complete, awaiting eaprime1's go-ahead to Finalize

## Intent

Seed Weir pick: build the JSON/YAML-validity check named after pixelator PR #2's silent merge corruption.

## Reviewer Findings and Disposition — Round 1 (commit `bd50c27`)

| Reviewer | Finding | Disposition |
|---|---|---|
| Copilot | `json.load()` silently accepts duplicate keys (last one wins) — the exact bug class this check exists to catch would pass through undetected | **Applied** — `copilot-swe-agent[bot]` committed an `object_pairs_hook` fix directly (`c2ff8a1`, accepted via Copilot's repair-commit flow); extended to YAML in the follow-up rewrite. |
| claude[bot] | Bare `pip install` on ubuntu-24.04 runners risks PEP 668 "externally-managed-environment" | **Applied verbatim** (`eae399c`) — `python3 -m pip install`. |
| codereviewbot-ai | No `encoding='utf-8'` on file opens — risk in minimal/C-locale environments | **Applied** — added alongside the duplicate-key fix (`c2ff8a1`). |

## Reviewer Findings and Disposition — Round 2 (commit `eae399c`, `ce235e6`)

Self-identified while verifying the round-1 fixes, not from a new external review pass:

- Rewrote from one `python3` subprocess per file to a single batched Python process — the likely source of Codacy's original "1 medium performance" finding.
- Added `actions/setup-python@v5` (3.12) instead of relying on ubuntu-latest's preinstalled Python.
- Added a PyYAML-missing preflight check so a missing dependency reports clearly instead of looking like every YAML file is broken.

## Status at Time of Writing

All identified findings resolved. Codacy: 0 issues (was 1 medium). All CI checks passing. No issues/missions spun off — every finding was addressable within the PR's own scope.

## Filed To

`atelier/legatum/202608220000_pixelator-legacy-infusion.md` (origin of the Seed Weir entry this PR closes), `queue/seed-weir/README.md` (status updated to PLANTED).
