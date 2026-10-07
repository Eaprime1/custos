# PR Journey: #416 — tools: prima_clock.sh prints the stamp, UTC by default

**Repository:** Eaprime1/custos  
**prima-clock:** 202610061154  
**Branch:** `claude/prima-clock-script-t2203p` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED  

## Intent

Build the shared stamp script from peer review Run 0 (idea I-3), as the Shepherd approved, now that the cue record and the seal both stamp in UTC.

## What Arrived

`tools/prima_clock.sh`: prints a prima-clock stamp, `YYYYMMDDHHMM`.

- no argument or `--utc`: UTC, for official records (seal, cue record, custody logs, MOAV carriers, registry entries)
- `--local`: the machine's local time, for the Shepherd's own stamps
- anything else exits 2 with a usage line; `--help` prints it

Checked: the default stays UTC even when `TZ` is set to Pacific, and `--local` follows `TZ`; the output matches 12 digits; ShellCheck is clean. A matching PR adds the same file to pixelator.

It changes no existing text. `CLAUDE.md` and the docs still say `date '+%Y%m%d%H%M'`; pointing them at the script is the open question below.

## Resonance

*shared*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610061052 | @Eaprime1 |
| Finalized | 202610061154 | @Eaprime1 |

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
| Scope | 5/5 | 1 file(s) changed |
| Verification | 5/5 | 18 check run(s) completed |
| **Valuation** | **High** | 20/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable

## What Door Does This Open?

Should `CLAUDE.md` and the closing checklist tell contributors to use this script instead of a bare `date`?

## Witnesses

- @Eaprime1 · 202610061154 · sealed at finalize

---
**prima-clock:** 202610061154  
**witnessed:** true — 1 witness, sealed 202610061154 by @Eaprime1  
*🌿 Custos — the shepherd closes the fold · ∰🌿*