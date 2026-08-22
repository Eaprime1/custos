#!/usr/bin/env bash
# pixel8 — Pixel 8 / Termux field configuration
# Source this after seeds/env_setup.sh, or let env_setup.sh source it automatically.

export LOCATION_NAME="pixel8"
export LOCATION_ROLE="field"
export LOCATION_DEVICE="mobile"

# Best-guess default (standard Termux $HOME clone location) — confirm/correct
# against eaprime1's actual setup; unlike mulberry's path this isn't verified.
export CUSTOS_PATH="$HOME/custos"

# The one location where device/ (live device state) is actually reachable —
# per CLAUDE.md, that folder only exists on the pixel8 branch.
export ACTIVE_BRANCH="pixel8"
export DEVICE_FOLDER_REACHABLE=true

# See CLAUDE.md "Claude Code on Termux (Android)" — no native linux-arm64-android
# binary. Use the web session, the Anthropic API directly, or SSH to a remote box.
export CLAUDE_CODE_NATIVE=false
