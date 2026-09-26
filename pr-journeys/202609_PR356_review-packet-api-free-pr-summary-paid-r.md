# PR Journey: #356 — Review packet: API-free PR summary; paid review only on request

**Repository:** Eaprime1/custos  
**prima-clock:** 202609261157  
**Branch:** `claude/great-dirac-yp319k-review-packet` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED (auto)  

## Intent

A review step that costs no model usage, running on every PR including drafts. It gathers the content so it's ready to review. The paid Claude review then runs only when asked, and reads the gathered packet first.

## What Arrived

- **`.github/workflows/review-packet.yml` (new).** It runs on `pull_request_target` with **no checkout**, so PR code never runs. It reads only the API file list and patches. It posts one comment and updates it in place on each push. The comment lists:
  - files by area, with lines added and removed;
  - paths that need Deck Master review (`vault/`, `moav/`, `prima-clock/`, `branch-tracker/`, `world/`, `device/`);
  - workflow files touched;
  - PR template sections present or missing;
  - issues the PR closes or refs;
  - new `.md` files without a prima-clock stamp;
  - placeholder words in added lines (the same list as `tools/scan_lexeme.sh`).
- **`claude-code-review.yml`.** It used to run on every opened, synchronize and reopened event. Now it runs **once per PR**: when the PR opens as non-draft, or when it's marked ready for review. It runs again only when the owner adds the **`ai-review`** label. Its prompt says to start from the review packet.
- **`ai-review` label** added to `.github/sovran-labels.yml` and `sovran-labels-sync.yml`. It's placed at the top of each list, so it merges cleanly with PR #343, which I checked with `git merge-tree`.
- **`turns/AAR.md`.** Closing entry for the PR #343 session, with seeds: an owner-cue detector built on the packet, a navigo number for Perplexity, and one home for the Latin cue terms.
- **Review fixes (d9a0931).** Five bot findings, all adopted:
  - removed files now show as `d`;
  - comments from deleted users no longer crash the script;
  - placeholder hits are deduplicated;
  - the non-draft message now says how to re-run the review;
  - the `opened` trigger covers non-draft PRs.

## Resonance

*gathered

---*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609260830 | @Eaprime1 |
| Auto-Finalized | 202609261157 | github-actions[bot] |

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
| validate | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 17 CI check(s) — all passed |
| Consistency | 5/5 | Description complete · ethics 5/5 |
| Scope | 5/5 | 5 file(s) changed |
| Verification | 5/5 | 17 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run: no new hits
- ✅ No unintended harm surface. `pull_request_target` never checks out PR code; it only reads the file list.
- ✅ YAML parses; the packet script passes a Node syntax check

## What Door Does This Open?

An owner-cue step (PR #355) could add a line to the packet when Eaprime1 comments a cue word, with no model call.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01HJY7Lmt3cJbNiKWa4jm4M6

---
**prima-clock:** 202609261157  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*