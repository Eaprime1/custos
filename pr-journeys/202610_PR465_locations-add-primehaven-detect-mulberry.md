# PR Journey: #465 — .locations: add primehaven, detect mulberry as Windows, never by path

**Repository:** Eaprime1/custos  
**prima-clock:** 202610180353  
**Branch:** `claude/primehaven-location-202610180011` → `main`  
**Author:** @Eaprime1  
**State:** FINALIZED (auto)  

## Intent

Stop the Ubuntu laptop from identifying itself as mulberry, and give it its own location: `primehaven`.

## What Arrived

`seeds/env_setup.sh` now recognizes each machine by a trait only that machine has (Termux prefix, Codespaces, hostname `sauron` on Linux, a Cygwin/MSYS shell on Windows), never by a clone path. There is a new `.locations/primehaven/` entry, mulberry is corrected to the Windows laptop, and primehaven is appended to `device/podiums.md`.

**Why:** mulberry was detected by the presence of `~/unexusi/custos`. That path is on the Ubuntu laptop, and the Pixel's Debian PRoot uses it too (`device/podiums.md`), so both reported themselves as the Windows laptop. `device/podiums.md` already recorded mulberry correctly as Windows. The `.locations/` work in #310 guessed from the path.

**Several clones:** primehaven holds more than one custos clone, so its config sets `CUSTOS_PATH` to whichever clone sourced `env_setup.sh` (`$REPO_ROOT`) rather than a fixed path. mulberry does the same until a clone path there is confirmed.

| Simulated host | Result |
|---|---|
| this laptop | `primehaven / dev` |
| second clone on this laptop | `primehaven / dev`, its own path |
| Termux | `pixel8 / field` |
| Codespaces | `codespaces / cloud` |
| Cygwin, Git Bash | `mulberry / hq` |
| Pixel Debian PRoot | `unknown` (was wrongly `mulberry`) |
| CI runner / contributor | `unknown` |

## Resonance

*naming true

---*

## The Arc

| Event | prima-clock | Actor |
|---|---|---|
| Opened | 202610180027 | @Eaprime1 |
| Auto-Finalized | 202610180353 | github-actions[bot] |

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
| final-oversight | ⏭ |
| label | ✅ |
| validate | ✅ |
| scan | ✅ |
| custos-speaks | ✅ |
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
| Correctness | 5/5 | 21 CI check(s) — all passed |
| Consistency | 5/5 | Description complete · ethics 5/5 |
| Scope | 4/5 | 6 file(s) changed |
| Verification | 5/5 | 21 check run(s) completed |
| **Valuation** | **High** | 19/20 |

## Ethics Check

- ✅ Entity agency respected (human, AI, concept — all contributors credited)
- ✅ Free to fork, remix, echo — no hidden ownership
- ✅ `bash tools/scan_lexeme.sh` run — distressed lexemes addressed or intentional (clean on `seeds/`, `.locations/`, `device/podiums.md`)
- ✅ No unintended harm surface in tools or scripts
- ✅ Shell inputs validated where applicable (detection reads `$PREFIX`, `$CODESPACES`, `$OSTYPE`, `uname -n`; no user input)

## What Door Does This Open?

hodie's `.locations/mulberry` has the same lineage, and hodie has moved on since. Does hodie need the same correction, adapted to its current shape?

---

**prime state:** 3  
**witnessed:** false
- [ ] **observed:** observation document filed in `turns/observations/` (ticked by the cue record once it is there)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

---
**prima-clock:** 202610180353  
**witnessed:** true  
*🌿 Custos — the shepherd closes the fold · ∰🌿*