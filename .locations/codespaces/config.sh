#!/usr/bin/env bash
# codespaces — GitHub Codespaces cloud configuration
# Source this after seeds/env_setup.sh, or let env_setup.sh source it automatically.

export LOCATION_NAME="codespaces"
export LOCATION_ROLE="cloud"
export LOCATION_DEVICE="codespaces"

# Best-guess default (Codespaces' standard workspace root) — confirm/correct
# against eaprime1's actual setup; unlike mulberry's path this isn't verified.
export CUSTOS_PATH="/workspaces/custos"

export ACTIVE_BRANCH="main"
export DEVICE_FOLDER_REACHABLE=false

# Full Claude Code CLI works natively here — no Termux ARM64 workaround needed.
export CLAUDE_CODE_NATIVE=true
