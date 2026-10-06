# PR Journey: #310 — .locations/, review-fix round

**Repository:** Eaprime1/custos
**prima-clock:** 202608220607
**Branch:** `claude/port-locations-config` → `main`
**Author:** @Eaprime1 (nav1 — Claude + eaprime1)
**State:** MERGED — `d368a62` (2026-08-22T09:08:32Z)

## Intent

Port hodie's `.locations/` multi-device topology config into custos (see PR
body for full adaptation rationale). This journey covers the second commit:
fixing what reviewers found on the first one.

## What Arrived — Reviewer Findings and Disposition

Three findings, none with a committable suggestion this round — all fixed
independently and credited here rather than left unaddressed or handed to
a bot's own repair flow.

| Reviewer | Finding | Disposition |
|---|---|---|
| `Copilot` | `ACTIVE_BRANCH`/`DEVICE_FOLDER_REACHABLE` were hardcoded per location in each `.locations/*/config.sh`, but both are actually checkout state — checking out `main` while physically on the Pixel 8 (or `pixel8` on mulberry) would export wrong values that don't match reality | **Fixed independently.** Derived both live in `seeds/env_setup.sh` from `git symbolic-ref --short HEAD` (updated from an initial `git branch --show-current` — see the `claude[bot]` row below) and whether `device/` actually exists in the working tree, after sourcing the location config — overriding any static value. Removed the now-dead hardcoded exports from all three config files. |
| `claude[bot]` | `git branch --show-current` exits `0` with empty stdout in detached HEAD (CI merge refs, `pull/*/merge`) — the `\|\| echo unknown` fallback only fires on nonzero exit, so `ACTIVE_BRANCH` came out empty instead of `"unknown"` in exactly the CI context this mattered most for | **Applied verbatim** (commit `be7170f`) — `git symbolic-ref --short HEAD`, which correctly exits nonzero on detached HEAD (verified locally via a detached worktree: exit 128). Co-authored on the commit. |
| `claude[bot]` | `.locations/README.md` had no Prima-clock stamp, so PR #309's newly-merged `prima-witness.yml` would flag this PR's own new file | **Fixed** (commit `be7170f`) — added a stamp. |
| `Copilot` | The catch-all `else` branch in the detection logic labeled *every* unrecognized host as `mulberry` — a contributor's machine or a CI runner would silently load mulberry's machine-specific path instead of reporting unknown | **Fixed independently.** Added a positive mulberry check (`$HOME/unexusi/custos` exists) and reserved the final `else` for `ENV_NAME="unknown"`, which already had a safe generic fallback. |
| `deepsource-io[bot]` | `==` inside `[[ ]]` isn't POSIX-defined (major, bug-risk category) | **Fixed.** Changed to `=` — safe here since the script uses bash's `[[ ]]` throughout, where `=` and `==` are equivalent for glob pattern matching. (Switching to POSIX `[ ]` instead, as a literal reading of the finding might suggest, would have silently broken the `*com.termux*` glob match entirely — checked before applying.) |

### Round 3 (commit `1b9d51e`) — doc completeness, `LOCATION_DEVICE` consistency

| Reviewer | Finding | Disposition |
|---|---|---|
| `claude[bot]` | README step 3 didn't list `$DEVICE_FOLDER_REACHABLE`/`$CLAUDE_CODE_NATIVE`, the two most behaviorally significant exports | **Applied verbatim** (suggested rewrite of the step). |
| `claude[bot]` | The unknown-host fallback in `env_setup.sh` didn't export `LOCATION_DEVICE`, unlike all three real `config.sh` files — inconsistent, and reported by two separate review comments on the same block | **Applied verbatim** (suggested `export LOCATION_DEVICE="unknown"`) — covers both comments. |
| `claude[bot]` | README's "correct in `config.sh`" guidance was incomplete — mulberry detection is a hardcoded path check in `env_setup.sh` itself, not something `config.sh` alone controls; reported by two separate comments on the same gap | **Fixed independently** — added a note pointing at both places that need updating together. |

### Round 4 (commit `43c4784`) — detection ordering hazard

| Reviewer | Finding | Disposition |
|---|---|---|
| `claude[bot]` | The `[[ -d "/workspaces" ]]` fallback ran *before* the mulberry check, so any machine with a coincidental `/workspaces` directory (including mulberry itself) would be misidentified as codespaces — `$CODESPACES` is the reliable signal, the directory check added fragility with no benefit | **Applied verbatim.** Re-verified locally both directions: `CODESPACES=true` still detects correctly; a machine with `/workspaces` present but no `$CODESPACES` no longer false-positives. |

### Round 5 (commit `17818fc`) — final round, applied then intentionally stopped

| Reviewer | Finding | Disposition |
|---|---|---|
| `claude[bot]` | ShellCheck SC2155 — combining `export` with a command substitution masks the subshell's exit status (functionally harmless here, the `\|\| echo unknown` fallback already handles it, but worth keeping ShellCheck clean) | **Applied verbatim** (split assign-then-export). |
| `claude[bot]` | `$DEVICE_FOLDER_REACHABLE`/`$CLAUDE_CODE_NATIVE` export literal `"true"`/`"false"` strings, not shell booleans — bare `[[ $VAR ]]` is always truthy | **Fixed** — added a doc note on the correct comparison pattern (`[[ $VAR == true ]]` or `if $VAR; then`). |

Five review rounds total. Per eaprime1's explicit direction after round 5 ("this has us looping") — round 5's two findings were applied since they were quick and already queued, then the loop was deliberately stopped rather than re-triggering `@claude finalize` again; PR merged directly via `gh pr merge` instead of the finalize/seal flow. See `202608_PR309_prima-witness-review-fixes.md` for the sibling PR's parallel review round, and the session handoff at `~/.eric/continuum/shadow/2026-08-22-handoff-unexusi-cleanup-comparison.md` for the wider context both PRs came out of.

## Verification

Re-ran all detection paths locally after the fix: real environment,
simulated Termux, simulated Codespaces, and a new case — simulated
unrecognized host, now correctly reporting `unknown` instead of the old
bug's `mulberry`. Confirmed `ACTIVE_BRANCH` reflects the actual current git
branch (`claude/port-locations-config` at test time) in every location,
not a hardcoded per-location guess.

## Resonance

*a second small practice run, and the one that found its own edge* — same
eaprime1-directed approach as PR #309's review round: apply a reviewer's
fix verbatim with credit when one's given, fix independently and document
when it isn't, keep Copilot's own repair-commit flow out of the loop
either way. Five rounds in, eaprime1 named the pattern directly — real
finding after real finding, but diminishing returns — and called it. That
observation is itself seeded forward as a "future seed" (a deliberate,
opt-in deep-dive mode, distinct from this default pacing) in the session's
final-review plan.

---
**prima-clock:** 202608220931
**witnessed:** true
*nav1 · review-fix round, 5 iterations · merged `d368a62` 2026-08-22T09:08:32Z*
