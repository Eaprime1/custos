# PR Journey: #396 — Mission 6: placet handler — the Shepherd's nod flips a mission to in-progress

**Repository:** Eaprime1/custos  
**prima-clock:** 202609291953  
**Branch:** `claude/placet-handler` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Build the accept step of the mission board: the owner's `placet` cue on a petitio flips the mission from open/paused to `in-progress`.

## What Arrived

`.github/workflows/placet.yml` (issue_comment, owner-only, skips footer comments, quotes and code, needs a `mission` issue with a petitio in the thread; adds `in-progress`, removes `open`/`paused`, names the petitio that holds the seat; never sets `claimed`). Docs in `docs/mission-board.md` and `docs/latin-workflow-glossary.md`; item 9 in `docs/mission-ideas.md` updated; drift entry recorded.

Tested by extracting the github-script and running it under node with mocked `context`/`github`/`core`. Nine cases pass: accept from open, accept from paused (latest petitio wins), no petitio, petitio only inside code, already in progress, `claimed` set, quoted or inline-code cue, non-mission issue, closed issue. The last three take no action at all. Live test comes after merge (issue_comment workflows run from `main`).

## Resonance

*Assent.*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609291934 | @Eaprime1 |
| Finalized | 202609291953 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
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
| Codacy Static Code Analysis | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| scan | ✅ |
| validate | ✅ |
| packet | ✅ |
| GitGuardian Security Checks | ✅ |

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

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Should `in-progress` also record who holds the seat (an assignee or a marker line), so a `paused` return can name the previous holder?

## Witnesses

- @Eaprime1 · 202609291953 · sealed at finalize

---
**prima-clock:** 202609291953  
**witnessed:** true — 1 witness, sealed 202609291953 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*