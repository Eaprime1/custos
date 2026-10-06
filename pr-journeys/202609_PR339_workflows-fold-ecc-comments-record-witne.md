# PR Journey: #339 — Workflows: fold ECC comments; record witnesses by comment, sealed at finalize

**Repository:** Eaprime1/custos  
**prima-clock:** 202609260235  
**Branch:** `claude/trusting-faraday-kdoq87` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Two workflow changes: get `ecc-tools[bot]`'s audit comments out of the reading path, and make **witnessing** a real, recorded act instead of a `witnessed: false` line nobody flips.

## What Arrived

**1. `minimize-ecc-comments.yml` (rewritten)**
- Each ECC comment is folded as "outdated" (still expandable) the moment it lands. Before, only comments from older commits were folded.
- A `workflow_dispatch` sweep (*Actions → Minimize ECC Tools comments → PR number*) folds every existing ECC comment on a PR. Only a 404 counts as "not a PR"; other API errors are reported as they are, and the sweep fails if any comment can't be folded.
- `github-script` is pinned to the v7.1.0 commit SHA.

**2. `witness-pr.yml` (new)**
- Comment **`witnessed`** on a PR, with the word at the start of the comment, and you're recorded as a witness. Each entry has your handle, the comment's prima-clock and a link.
- **The comments are the record.** Every run rebuilds the list from the PR's `witnessed` comments (the earliest per person; bots are ignored) and shows it in the PR description. Lines typed into the description by hand are not trusted. If GitHub drops a queued run during a burst, the next run still sees every comment.
- Anyone can witness. The first `witnessed` comment gets a 👍, and a repeat gets a 👀. Ordinary comments don't start a runner.
- The list replaces the template's `**witnessed:** false` line:
  ```
  
  **witnessed:** true — 2 witnesses

  - @eaprime1 · 202609230901 · [comment](…)
  - @someone · 202609230903 · [comment](…)
  
  ```

**3. `finalize-pr.yml` (extended): finalize seals the witnessing**
- `@claude finalize` seals the list, rebuilt from `witnessed` comments posted up to the finalize comment: `witnessed: true — N witnesses · sealed <clock> by @sealer`.
- The sealer is added as a witness if they aren't listed already.
- The finalization comment shows the sealed list and carries a bot-authored seal record. A repeat finalize keeps the first seal's cutoff and sealer.
- The PR Journey document gets a **Witnesses** section. It used to hard-code `witnessed: true`.
- After sealing, a late `witnessed` comment gets 😕 and a short note, and the list stays as sealed. A witness run never writes over a sealed description. Finalize re-checks the description three times after sealing and re-applies the seal if a racing witness run overwrote it.
- Section parsing stops at a `---` rule, so the Resonance and What Door sections no longer pick up the footer.

These take effect once on `main`, because `issue_comment` workflows run from the default branch.

## Resonance

*witnessed

---*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609230815 | @Eaprime1 |
| Finalized | 202609260235 | @Eaprime1 |

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
| DeepSource: Analysis | ⏭ |
| Codacy Static Code Analysis | ✅ |
| claude-review | ✅ |
| validate | ✅ |
| dependency-review | ✅ |
| scan | ✅ |
| scan | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir, DeepSource: Analysis

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 19 CI check(s) — all passed |
| Consistency | 5/5 | Template complete · ethics 5/5 |
| Scope | 5/5 | 3 file(s) changed |
| Verification | 5/5 | 19 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited). Anyone can be recorded as a witness.
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run. The only hits are JavaScript `.replace()` calls, which aren't placeholders.
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable. There's no shell; the dispatch input is typed `number` and checked to be a PR.

## What Door Does This Open?

Should the auto-finalize bot (`auto-finalize.yml`) also seal witnesses when it finalizes bot PRs? Should nullus/naught/maw get the same witness workflow?

---

**prime state:** 3  
**witnessed:** false

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01XVihLtjp6k5TStKRVFcQsD

---
**prima-clock:** 202609260235  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*