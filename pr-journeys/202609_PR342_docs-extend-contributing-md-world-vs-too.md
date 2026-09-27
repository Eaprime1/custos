# PR Journey: #342 — docs: extend CONTRIBUTING.md — world/ vs tools/ routing guidance for bots & contributors

**Repository:** Eaprime1/custos  
**prima-clock:** 202609270422  
**Branch:** `docs/contributing-pr-conventions` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Cut wasted-effort PRs by telling contributors, human and automated, where content belongs before they write it. The trigger was #331, #333 and #335 on issue #325, which disagreed on whether a routing definition was lore or code.

## What Arrived

`CONTRIBUTING.md` gains three sections. The existing Final Review Gate and Codacy guidance is unchanged.

- **Where Content Goes.**
  - Concept, lore and routing-definition entities go in `world/<name>.md`.
  - Executable shell or tooling behavior goes in `tools/`, and only when the issue describes behavior the codebase actually runs.
  - A one-line test: would a `.md` definition or a `.sh` runtime file resolve the issue's stated problem?
- **Pull Request Guidelines, two additions.** Reference the issue with `Fixes #NNN` or `Closes #NNN`. Nothing auto-merges, and an unreviewed PR is queued, not rejected.
- **Key Reference Points.**
  - `pandora/germs/` is where most missions start.
  - The one-line roles of `.artesian/`, `.shadow-well/`, `atelier/`, `vault/` and `guides/`.
- **For Automated Contributors and Outside Platforms.**
  - Check for existing PRs on the issue first; multiple submissions are triaged together.
  - State the `world/` vs `tools/` reasoning in the PR body.
  - Flag an ambiguous issue instead of guessing.

**Review fixes along the way:**
- The earlier example paths `world/entities/` and `quests/routing_maps.yaml` are gone, because neither exists. `src/` was replaced with `tools/`, since this repo has no `src/`.
- `atelier/` now reads "nursery (concepts before they have names)", matching CLAUDE.md.
- The retired `bounty` label is now `sparstone-trial`, per `docs/issue-system.md`.

## Resonance

*routed*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609231041 | @Eaprime1 |
| Finalized | 202609270422 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| check | ⏭ |
| packet | ✅ |
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
| packet | ✅ |
| dependency-review | ✅ |
| validate | ✅ |
| scan | ✅ |
| scan | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 20 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 1 file(s) changed |
| Verification | 5/5 | 20 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts (docs only)
- ✅ Shell inputs validated where applicable (none; no scripts changed)

## What Door Does This Open?

Should the `atelier/` definitions in CLAUDE.md and `.shadow-well/README.md` be reconciled into one?

## Witnesses

- @Eaprime1 · 202609231105 · [comment](https://github.com/Eaprime1/custos/pull/342#issuecomment-5793699513)

---
**prima-clock:** 202609270422  
**witnessed:** true — 1 witness, sealed 202609270422 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*