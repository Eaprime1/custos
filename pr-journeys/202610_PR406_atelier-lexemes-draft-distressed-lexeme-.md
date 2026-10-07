# PR Journey: #406 — atelier/lexemes: draft distressed-lexeme list v1

**Repository:** Eaprime1/custos  
**prima-clock:** 202610060704  
**Branch:** `claude/adoring-carson-t2203p` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Compile one list of distressed lexemes from every reference found across custos, hodie, maw and pixelator, keeping known-but-unreferenced terms separate, so the lexeme scanner has a single source to read.

## What Arrived

One new file, `atelier/lexemes/distressed-lexeme-list.md` (draft v1):
- **Part A** — terms with a source (hodie's severity-graded catalog plus custos's manifesto, class/race, "granting access", sentience/sapience), with alternatives and "use the original when" rules.
- **Part B** — empty, for terms Eric knows are distressed with no reference yet. Nothing invented.
- **Part C** — rough contamination counts per repo (hodie: 6,342 "consciousness" lines in 268 files) and self-referential cases.
- A two-stage scanner proposal (detect, then triage: replace cleanly / keep with note / deeper vetting or maw), with the Ethica Nexus "don't silently rewrite a contributor" guardrail.

Three source conflicts are flagged for the Shepherd: "awareness", "commission", and sentience/sapience. It also flags that `scan_lexeme.sh` already uses "distressed lexeme" for TODO/FIXME-style markers.

## Resonance

*gathering*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610060655 | @Eaprime1 |
| Finalized | 202610060704 | @Eaprime1 |

## CI Record

| Check | Result |
|---|---|
| Codacy Static Code Analysis | ✅ |
| DeepSource: Lua | ⏭ |
| DeepSource: Apex | ⏭ |
| DeepSource: Dart | ⏭ |
| GitGuardian Security Checks | ✅ |
| DeepSource: Erlang | ⏭ |
| DeepSource: Helm | ⏭ |
| DeepSource: Perl | ⏭ |
| DeepSource: VB.NET | ⏭ |
| DeepSource: PowerShell | ⏭ |
| DeepSource: Objective-C | ⏭ |
| DeepSource: Groovy | ⏭ |
| DeepSource: Elixir | ⏭ |
| dependency-review | ✅ |
| scan | ✅ |
| scan | ✅ |
| validate | ✅ |
| packet | ✅ |

## DeepSource Record

**Passed:** 0  
**Failed:** 0  
**Skipped:** DeepSource: Lua, DeepSource: Apex, DeepSource: Dart, DeepSource: Erlang, DeepSource: Helm, DeepSource: Perl, DeepSource: VB.NET, DeepSource: PowerShell, DeepSource: Objective-C, DeepSource: Groovy, DeepSource: Elixir

## Review Scores

| Dimension | Score | Note |
|---|---|---|
| Correctness | 5/5 | 18 CI check(s) — all passed |
| Consistency | 4/5 | Template complete · ethics 4/5 |
| Scope | 5/5 | 1 file(s) changed |
| Verification | 5/5 | 18 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ☐ `bash tools/scan_lexeme.sh` run — not run; the file names distressed lexemes on purpose as list entries
- ✅ No unintended harm surface in tools or scripts (docs only)
- ✅ Shell inputs validated where applicable (n/a)

## What Door Does This Open?

Which of the conflicting sources is the rule for "awareness" and "commission"?

## Witnesses

- @Eaprime1 · 202610060704 · sealed at finalize

---
**prima-clock:** 202610060704  
**witnessed:** true — 1 witness, sealed 202610060704 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*