#!/usr/bin/env bash
# EMBER — The Warmth. Keeps the fragment alive until it has a next turn.
set -euo pipefail

FRAGMENT="${1:-}"

if [[ -z "$FRAGMENT" ]]; then
  echo "Usage: bash tools/ember.sh \"fragment to warm\""
  exit 1
fi

TIMESTAMP=$(date '+%Y-%m-%d %H:%M')

echo ""
echo "EMBER warms: \"$FRAGMENT\""
echo "~$TIMESTAMP~"
echo ""
echo "This fragment is alive. It has warmth."
echo "Give it a next turn when you are ready."
echo ""
echo "  bash tools/thee.sh \"[what grew from this]\""
