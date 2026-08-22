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
| `mulberry` | Laptop | HQ — primary dev, full Claude Code | `main` |
| `pixel8` | Pixel 8 / Termux | Field — mobile device work | `pixel8` (per `CLAUDE.md`'s existing convention) |
| `codespaces` | GitHub Codespaces | Cloud — ephemeral, CI-adjacent | `main` |

## How It Works

1. `source seeds/env_setup.sh` detects the current location.
2. Location-specific config loads from `.locations/<name>/config.sh`.
3. Scripts read `$LOCATION_NAME`, `$LOCATION_ROLE`, `$ACTIVE_BRANCH`, `$DEVICE_FOLDER_REACHABLE`, and `$CLAUDE_CODE_NATIVE` to adapt behavior — in particular, `$DEVICE_FOLDER_REACHABLE` indicates whether `device/` is checked out in the working tree (only true on the `pixel8` branch), and `$CLAUDE_CODE_NATIVE` whether the full Claude Code CLI is available without workarounds.
4. If the host isn't recognized, `env_setup.sh` exports safe defaults (`LOCATION_ROLE=unknown`, `CUSTOS_PATH` set to the repo root) and reports `unknown` in the output — no matching `.locations/<name>/config.sh` is required for this case.

## Paths

`mulberry`'s path is confirmed from this session
(`/home/sauron/unexusi/custos`). `pixel8` and `codespaces` paths are
best-guess defaults (`$HOME/custos`, `/workspaces/custos`) — correct in
`.locations/<name>/config.sh` if eaprime1's actual setup differs.

If mulberry's clone path changes, update both `.locations/mulberry/config.sh`
**and** the detection check in `seeds/env_setup.sh`
(`elif [[ -d "$HOME/unexusi/custos" ]]`) — the config file alone won't fix
detection, since that's what decides `ENV_NAME` before any config is loaded.
