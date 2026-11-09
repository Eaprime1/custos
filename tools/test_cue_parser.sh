#!/usr/bin/env bash
# Run the offline test table for the cue parser. Needs node; no network.
set -euo pipefail
cd "$(dirname "$0")/.."
command -v node >/dev/null 2>&1 || { echo "node is not installed" >&2; exit 2; }
REGISTRY_TEXT="$(cat docs/navigo-registry.md)" node tools/test_cue_parser.js
