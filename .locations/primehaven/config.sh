#!/usr/bin/env bash
# primehaven — Ubuntu laptop configuration
# Source this after seeds/env_setup.sh, or let env_setup.sh source it automatically.

export LOCATION_NAME="primehaven"
export LOCATION_ROLE="dev"
export LOCATION_DEVICE="laptop"

# Detected by hostname (`sauron`), not by path: this laptop holds more than
# one custos clone (~/unexusi/custos is the working clone on main; older
# iterations and practice copies live elsewhere). CUSTOS_PATH is whichever
# clone sourced env_setup.sh -- REPO_ROOT is set there before this loads.
export CUSTOS_PATH="$REPO_ROOT"

# ACTIVE_BRANCH and DEVICE_FOLDER_REACHABLE are checkout state, not location
# constants, so they're derived live in seeds/env_setup.sh instead of
# hardcoded here.

# Full Claude Code CLI works natively here — no Termux ARM64 workaround needed.
export CLAUDE_CODE_NATIVE=true
