# PR Journey: #310 — .locations/, review-fix round

**Repository:** Eaprime1/custos
**prima-clock:** 202608220607
**Branch:** `claude/port-locations-config` → `main`
**Author:** @Eaprime1 (nav1 — Claude + eaprime1)
**State:** OPEN — review round complete, awaiting eaprime1 merge decision

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
| `Copilot` | `ACTIVE_BRANCH`/`DEVICE_FOLDER_REACHABLE` were hardcoded per location in each `.locations/*/config.sh`, but both are actually checkout state — checking out `main` while physically on the Pixel 8 (or `pixel8` on mulberry) would export wrong values that don't match reality | **Fixed independently.** Derived both live in `seeds/env_setup.sh` from `git branch --show-current` and whether `device/` actually exists in the working tree, after sourcing the location config — overriding any static value. Removed the now-dead hardcoded exports from all three config files. |
| `Copilot` | The catch-all `else` branch in the detection logic labeled *every* unrecognized host as `mulberry` — a contributor's machine or a CI runner would silently load mulberry's machine-specific path instead of reporting unknown | **Fixed independently.** Added a positive mulberry check (`$HOME/unexusi/custos` exists) and reserved the final `else` for `ENV_NAME="unknown"`, which already had a safe generic fallback. |
| `deepsource-io[bot]` | `==` inside `[[ ]]` isn't POSIX-defined (major, bug-risk category) | **Fixed.** Changed to `=` — safe here since the script uses bash's `[[ ]]` throughout, where `=` and `==` are equivalent for glob pattern matching. (Switching to POSIX `[ ]` instead, as a literal reading of the finding might suggest, would have silently broken the `*com.termux*` glob match entirely — checked before applying.) |

## Verification

Re-ran all detection paths locally after the fix: real environment,
simulated Termux, simulated Codespaces, and a new case — simulated
unrecognized host, now correctly reporting `unknown` instead of the old
bug's `mulberry`. Confirmed `ACTIVE_BRANCH` reflects the actual current git
branch (`claude/port-locations-config` at test time) in every location,
not a hardcoded per-location guess.

## Resonance

*a second small practice run* — same eaprime1-directed approach as PR
#309's review round (`pr-journeys/202608_PR309_prima-witness-review-fixes.md`):
apply a reviewer's fix verbatim with credit when one's given, fix
independently and document when it isn't, keep Copilot's own repair-commit
flow out of the loop either way.

---
**prima-clock:** 202608220607
**witnessed:** true
*nav1 · review-fix round · nothing here formally closed yet, awaiting eaprime1*
