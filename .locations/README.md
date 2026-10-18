# Location Configurations
Prima-clock: 202608220704

Static topology reference — not live device state. Each entry says where
custos lives on a given machine and what's true about working from there.
Any device can read this to understand the network without asking a human.

**This is deliberately separate from `device/`.** `device/` (pixel8 branch
only) tracks *live, mutable* state — active work, install log, in-flight
sessions — and stays off `main` on purpose because that kind of state
changes constantly and would just be merge noise there. `.locations/`
tracks the opposite: identity and paths that are true regardless of what's
currently being worked on, so it's safe — useful, even — to keep on `main`.
Adapted from hodie's `.locations/` convention (`eaprime1/hodie`), scoped to
what custos actually needs.

## Locations

| Name | Device | Role | Active branch |
|------|--------|------|----------------|
| `primehaven` | Ubuntu laptop (hostname `sauron`) | Dev — full Claude Code CLI | `main` |
| `mulberry` | Windows laptop | HQ — source of the artesian queue | `main` |
| `pixel8` | Pixel 8 / Termux | Field — mobile device work | `pixel8` (per `CLAUDE.md`'s existing convention) |
| `codespaces` | GitHub Codespaces | Cloud — ephemeral, CI-adjacent | `main` |

## How It Works

1. `source seeds/env_setup.sh` detects the current location.
2. Location-specific config loads from `.locations/<name>/config.sh`.
3. Scripts read `$LOCATION_NAME`, `$LOCATION_ROLE`, `$ACTIVE_BRANCH`, `$DEVICE_FOLDER_REACHABLE`, and `$CLAUDE_CODE_NATIVE` to adapt behavior — in particular, `$DEVICE_FOLDER_REACHABLE` indicates whether `device/` is checked out in the working tree (only true on the `pixel8` branch), and `$CLAUDE_CODE_NATIVE` whether the full Claude Code CLI is available without workarounds.
4. `$DEVICE_FOLDER_REACHABLE` and `$CLAUDE_CODE_NATIVE` hold the literal strings `"true"`/`"false"`, not shell booleans — test with `[[ $VAR == true ]]` or `if $VAR; then`, not bare `[[ $VAR ]]` (always truthy for a non-empty string either way).
5. If the host isn't recognized, `env_setup.sh` exports safe defaults (`LOCATION_ROLE=unknown`, `CUSTOS_PATH` set to the repo root) and reports `unknown` in the output — no matching `.locations/<name>/config.sh` is required for this case.

## Detection

`seeds/env_setup.sh` picks a location from something only that machine has,
checked in this order:

| Location | Detected by |
|----------|-------------|
| `pixel8` | `$PREFIX` contains `com.termux` |
| `codespaces` | `$CODESPACES` is set |
| `primehaven` | hostname `sauron` on Linux |
| `mulberry` | a Windows bash shell (`$OSTYPE` is `cygwin*` or `msys*`) |
| anything else | `unknown` |

Never detect by clone path. Until 2026-10-18 mulberry was detected by the
presence of `~/unexusi/custos`. That path is on primehaven, so the Ubuntu
laptop reported itself as the Windows laptop. The Pixel's Debian PRoot uses
the same path too (`device/podiums.md`).

## Paths

`primehaven` and `mulberry` set `CUSTOS_PATH` to whichever clone sourced
`env_setup.sh`. primehaven holds more than one custos clone
(`~/unexusi/custos` is the working clone on `main`; older iterations and
practice copies live elsewhere), and no clone on mulberry is confirmed yet
(its path convention is `C:\Users\eapri\mulberry\`). `pixel8` and
`codespaces` paths are best-guess defaults (`$HOME/custos`,
`/workspaces/custos`) — correct in `.locations/<name>/config.sh` if
eaprime1's actual setup differs.

If a machine's identifying trait changes (a new hostname, a different
Windows shell), update the detection check in `seeds/env_setup.sh` — the
config file alone won't fix detection, since that check decides `ENV_NAME`
before any config is loaded.
