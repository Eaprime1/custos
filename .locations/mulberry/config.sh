#!/usr/bin/env bash
# mulberry — Laptop HQ configuration
# Source this after seeds/env_setup.sh, or let env_setup.sh source it automatically.

export LOCATION_NAME="mulberry"
export LOCATION_ROLE="hq"
export LOCATION_DEVICE="laptop"

# Confirmed this session — adjust if eaprime1's actual clone path differs.
export CUSTOS_PATH="$HOME/unexusi/custos"

# custos's own convention: device/ (live state) only exists on the pixel8
# branch, not main. Expected to be on main here -- but ACTIVE_BRANCH and
# DEVICE_FOLDER_REACHABLE are checkout state, not location constants, so
# they're derived live in seeds/env_setup.sh instead of hardcoded here.

# Full Claude Code CLI works natively here — no Termux ARM64 workaround needed.
export CLAUDE_CODE_NATIVE=true
