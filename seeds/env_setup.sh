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

# Positive check for mulberry (this session's confirmed clone path) rather
# than treating it as the default fallback -- an unrecognized host (a
# contributor's machine, a CI runner) must land in the unknown branch below,
# not silently load mulberry's machine-specific config.
if [[ "${PREFIX:-}" = *com.termux* ]]; then
    ENV_NAME="pixel8"
elif [[ -n "${CODESPACES:-}" ]] || [[ -d "/workspaces" ]]; then
    ENV_NAME="codespaces"
elif [[ -d "$HOME/unexusi/custos" ]]; then
    ENV_NAME="mulberry"
else
    ENV_NAME="unknown"
fi

LOCATION_CONFIG="$REPO_ROOT/.locations/$ENV_NAME/config.sh"
if [[ -f "$LOCATION_CONFIG" ]]; then
    # shellcheck source=/dev/null
    source "$LOCATION_CONFIG"
else
    export LOCATION_NAME="$ENV_NAME"
    export LOCATION_ROLE="unknown"
    export CUSTOS_PATH="$REPO_ROOT"
    export CLAUDE_CODE_NATIVE=true
fi

# ACTIVE_BRANCH and DEVICE_FOLDER_REACHABLE are checkout state, not location
# constants -- checking out `main` on the pixel8 device (or `pixel8` on
# mulberry) would make a location-derived value wrong. Derive both from the
# actual git checkout and filesystem instead of trusting per-location
# defaults; this overrides whatever (if anything) the sourced config set.
export ACTIVE_BRANCH="$(git -C "$REPO_ROOT" branch --show-current 2>/dev/null || echo unknown)"
if [[ -d "$REPO_ROOT/device" ]]; then
    export DEVICE_FOLDER_REACHABLE=true
else
    export DEVICE_FOLDER_REACHABLE=false
fi

echo "--- Location: $LOCATION_NAME ($LOCATION_ROLE) ---"
echo "  custos:        $CUSTOS_PATH"
echo "  Active branch: $ACTIVE_BRANCH"
echo "  device/ reachable: $DEVICE_FOLDER_REACHABLE"
echo "  Claude Code native: $CLAUDE_CODE_NATIVE"
echo "  Ready."
