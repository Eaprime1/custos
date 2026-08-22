#!/usr/bin/env bash
# env_setup.sh — Location detection and config loading
# Usage: source seeds/env_setup.sh
#
# Detects which .locations/ entry (mulberry, pixel8, codespaces) matches the
# current machine and sources its config.sh. Adapted from hodie's
# .scripts/env_setup.sh, using the Termux-detection method already proven
# elsewhere in this ecosystem (hodie's fleet_ops.py checks $PREFIX for
# "com.termux" rather than a project-specific storage path, which is more
# portable across setups).

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

if [[ "${PREFIX:-}" == *com.termux* ]]; then
    ENV_NAME="pixel8"
elif [[ -n "${CODESPACES:-}" ]] || [[ -d "/workspaces" ]]; then
    ENV_NAME="codespaces"
else
    ENV_NAME="mulberry"
fi

LOCATION_CONFIG="$REPO_ROOT/.locations/$ENV_NAME/config.sh"
if [[ -f "$LOCATION_CONFIG" ]]; then
    # shellcheck source=/dev/null
    source "$LOCATION_CONFIG"
else
    export LOCATION_NAME="$ENV_NAME"
    export LOCATION_ROLE="unknown"
    export CUSTOS_PATH="$REPO_ROOT"
    export ACTIVE_BRANCH="unknown"
    export DEVICE_FOLDER_REACHABLE=false
    export CLAUDE_CODE_NATIVE=true
fi

echo "--- Location: $LOCATION_NAME ($LOCATION_ROLE) ---"
echo "  custos:        $CUSTOS_PATH"
echo "  Active branch: $ACTIVE_BRANCH"
echo "  device/ reachable: $DEVICE_FOLDER_REACHABLE"
echo "  Claude Code native: $CLAUDE_CODE_NATIVE"
echo "  Ready."
