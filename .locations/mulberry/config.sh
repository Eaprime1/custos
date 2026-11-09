#!/usr/bin/env bash
# mulberry — Windows laptop HQ configuration
# Source this after seeds/env_setup.sh, or let env_setup.sh source it automatically.

export LOCATION_NAME="mulberry"
export LOCATION_ROLE="hq"
export LOCATION_DEVICE="laptop"

# Detected by a Windows bash shell (Cygwin or MSYS/Git Bash), not by path.
# No custos clone on mulberry has been confirmed yet -- device/podiums.md
# records the path convention C:\Users\eapri\mulberry\ and names Cygwin as
# a candidate podium. Until a clone path is confirmed, report whichever
# clone sourced env_setup.sh (REPO_ROOT is set there before this loads).
export CUSTOS_PATH="$REPO_ROOT"

# ACTIVE_BRANCH and DEVICE_FOLDER_REACHABLE are checkout state, not location
# constants, so they're derived live in seeds/env_setup.sh instead of
# hardcoded here.

# Claude Code ships a native Windows build; not yet verified on mulberry.
export CLAUDE_CODE_NATIVE=true
