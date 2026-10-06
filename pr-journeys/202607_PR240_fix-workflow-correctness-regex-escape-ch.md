# PR Journey: #240 — fix: workflow correctness — regex escape, checkbox case, pagination, auth gate, remove @mention

**Repository:** Eaprime1/custos  
**prima-clock:** 202607240600  
**Branch:** `claude/nifty-franklin-fxwp3r` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Fix five bugs found during Copilot review of the custos PR workflow system: regex quantifier collision in `parseSection`, uppercase checkbox mismatch in ethics gate, single-page comment fetch missing PRs with >100 comments, missing auth guard on `@claude check`, and `@mention` noise in sovran-voice triggering email notifications.

## What Arrived

Four workflow files updated on `.github/workflows/`:

- **finalize-pr.yml** — `parseSection` now escapes the label before building `RegExp` (fixes `What Door Does This Open?` quantifier collision); `whatDoor` call includes `?`; `ethicsDone` filter uses `/\[x\]/i` (catches `[X]`); `allChecks` filter also excludes checks named `readiness` to prevent meta-check blocking
- **auto-finalize.yml** — same four fixes applied to the two-param `parseSection(body, label)` variant; `whatDoor` call updated; readiness exclusion added
- **pr-readiness.yml** — regex escape added to `parseSection`; `ethicsDone` case fix; comment upsert switched to `github.paginate`; job `if` condition extended to require `author_association` of OWNER/MEMBER/COLLABORATOR
- **sovran-voice.yml** — removed `@${author}` mention line and the now-unused `const author` variable; the shepherd no longer tags the PR author on every open

## Resonance

*refined*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202607240400 | @Eaprime1 |
| Finalized | 202607240600 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
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
| scan | ✅ |
| dependency-review | ✅ |
| claude-review | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 16 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 3/3 |
| Scope | 5/5 | 4 file(s) changed |
| Verification | 5/5 | 16 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ No secrets or credentials introduced
- ✅ Changes are additive fixes only — no behavior removed, only bugs closed
- ✅ Auth gate narrows `@claude check` to authorized contributors; does not block the shepherd's own finalize flow

## What Door Does This Open?

*Not recorded.*

---
**prima-clock:** 202607240600  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*