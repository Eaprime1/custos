# PR Journey: #367 — Seal-cue guard, whole-word packet scan, Latin cue record

**Repository:** Eaprime1/custos  
**prima-clock:** 202609270405  
**Branch:** `claude/great-dirac-yp319k-cues` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Three follow-ups from the #356 and #343 merges:
1. Stop a quoted cue, or a navigo's reply, from sealing a PR.
2. Cut noise in the review packet.
3. Give the Latin workflow calls a free record. Other conversations can work a PR with those calls, and we verify the gathered state in the final review before merge.

## What Arrived

- **`finalize-pr.yml`: seal-cue guard.**
  - A comment that carries the Claude Code footer never seals. That footer marks a navigo writing under the owner's login.
  - Before matching, the gate removes `inline code`, code blocks and `>` quotes, so a quoted cue is ignored.
  - #356 was sealed at 202609270304 by my own reply, which quoted the cue; this fixes that.
  - I tested the gate script against eight comments, including the exact reply that sealed #356. It no longer triggers. Real owner cues still seal, including one split over two lines.
- **`review-packet.yml`: whole-word placeholder matching.**
  - "replaced", "placeholders" and "TODOs" no longer count; REPLACE, placeholder and TODO still do.
  - The comment notes that `tools/scan_lexeme.sh` still matches substrings.
- **`latin-cue-record.yml` (new, no model call).** It runs when an owner comments a call from `docs/latin-workflow-glossary.md`: Recensio, Probatio, Lustratio, Judicium, Novissimum or Cursus, with or without a modifier before or after. It keeps one comment on the PR, updated in place, holding:
  - a **cue log**: prima-clock, call, who, head commit and a link to the comment;
  - commits since the previous cue, with a compare link;
  - checks on the head (passed, failed with links, running, skipped), unresolved review threads with links, merge state, draft, labels, witness seal and a link to the review packet;
  - a single "Ready to verify for merge" line.
  It never reviews, seals or merges. Footer comments and quoted cues are ignored, as in the finalize gate.
- **Docs.** The glossary's "Where custos uses these" section and the CLAUDE.md CI list now describe all of this.

## Resonance

*guarded*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202609270350 | @Eaprime1 |
| Finalized | 202609270405 | @Eaprime1 |

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
- ✅ `bash tools/scan_lexeme.sh` run: no new hits
- ✅ No unintended harm surface. The new workflow only reads PR state and writes one comment; it runs no PR code.
- ✅ YAML parses. Each script passes a Node syntax check, and the cue record ran against a mocked GitHub API.

## What Door Does This Open?

The cue record gives the project's final review one place to look for each PR. A later step could list every open PR's latest cue record in a single index.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01HJY7Lmt3cJbNiKWa4jm4M6

## Witnesses

- @Eaprime1 · 202609270405 · sealed at finalize

---
**prima-clock:** 202609270405  
**witnessed:** true — 1 witness, sealed 202609270405 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*