# PR Journey: #343 — Clear the unclaimed issue board; set up the issue system (labels, claims, bounty terms, Bot Brief, lexeme fallback)

**Repository:** Eaprime1/custos  
**prima-clock:** 202609260342  
**Branch:** `claude/great-dirac-yp319k` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED (auto)  

## Intent

Clear every open issue that has no outside claim or submission. Then set up the issue system: labels, claims, what a bounty pays, missions a bot can actually finish, a fallback when a mission can't be done, and a final "does it make sense?" check.

Closes #128, closes #186, closes #188, closes #201, closes #202, closes #320, closes #321, closes #322, closes #330

## What Arrived

**Resolved in this PR** (each issue's own completion check passes):
- #128: `world/concordance.md`, with lexemes and methods. Seven entries, including *claude-code-action auth precedence*.
- #186: `tools/shepherd_considers.sh`. Tested on empty directories, non-`.md` files, a missing directory, view/note/skip and quit.
- #188: `guides/anchor-review.md` and the `anchor-review` label. The flag's first use is a worked example: the unanchored "$50 USD reward" in PR #333. It's recorded in the guide and not posted on the PR.
- #201: registry row documenting the six root custody files as a Shepherd-placed exception. The files weren't moved.
- #202: `missions/` added to the README structure table and to CLAUDE.md.
- #320: navigo2 row in the CLAUDE.md navigo table. It says plainly that there's no workspace folder yet.
- #321: `turns/review-surface.md`, seeded with PR #319.
- #322: `.claude/drift.md`, seeded with PR #319 and with this session's own unasked-for calls.
- #330: `world/polarity.md` (`now_here ↔ nowhere`) and three `.shadow-well/` entries. The README now records the form and routing decisions.

**Consolidated** (closed separately, content kept):
- #194–#198 and #204 → `missions/TABULARIUM_BACKLOG.md`. Each needs the Pixel 8 library, `agy` or the tabularium repo.
- #323, #327, #328 → `.claude/missions.md`. Each needs Gmail filter creation, trigger setup or the Shepherd at the inbox.

**Already satisfied** (closed separately): #127 (the audit check prints nothing) and #324 (`.artesian/` exists with its README and mission files).

**Left alone** (outside claims or submissions): #325, #235, #187.

**Issue system**
- `docs/issue-system.md`: four issue types, state and modifier labels, the claim lifecycle, what a custos bounty pays (XP, credit and recognition, not cash), the six-part **Bot Brief**, the **lexeme fallback** (with the great stag example), the **Sense Check**, and a triage routine.
- `.github/ISSUE_TEMPLATE/lexeme.yml`: new template.
- `mission.yml` and `bounty.yml` gain *Read first*, *Write to* and *Out of scope* fields. All templates end with the fallback line and a Sense Check reminder.
- PR template: new **Sense Check** section.
- `atelier/lexemes/README.md`: the note shape and its completion check.
- Ten labels added to `.github/sovran-labels.yml` and to the sync workflow. They apply after merge, or when someone comments `@claude sync-labels`.

## Resonance

*cleared

---*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609260149 | @Eaprime1 |
| Auto-Finalized | 202609260342 | github-actions[bot] |

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
| claude-review | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| dependency-review | ✅ |
| scan | ✅ |
| scan | ✅ |
| validate | ✅ |
| GitGuardian Security Checks | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 18 CI check(s) — all passed |
| Consistency | 5/5 | Description complete · ethics 5/5 |
| Scope | 3/5 | 30 file(s) changed |
| Verification | 5/5 | 18 check run(s) completed |
| **Valuation** | **High** | 18/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run. New hits are only YAML `placeholder:` keys in issue templates, the same as the existing ones.
- ✅ No unintended harm surface in tools or scripts. `shepherd_considers.sh` only reads `.md` files and appends to one log.
- ✅ Shell inputs validated where applicable. The directory argument is checked.

## What Door Does This Open?

Once the labels sync, should protected issues get `claimed` and `submitted` (#187, #235, #325), and should bounty aggregators be told custos bounties are XP-only?

---

**prime state:** 3  
**witnessed:** false

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01HJY7Lmt3cJbNiKWa4jm4M6

---
**prima-clock:** 202609260342  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*