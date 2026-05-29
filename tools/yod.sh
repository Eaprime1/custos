#!/usr/bin/env bash
# YOD — The Mark. The smallest first action.
set -euo pipefail

MARK="${1:-}"

if [[ -z "$MARK" ]]; then
  echo "Usage: bash tools/yod.sh \"smallest true action\""
  echo ""
  echo "YOD says: Begin here."
  exit 1
fi

TIMESTAMP=$(date '+%Y-%m-%d %H:%M')

echo ""
echo "YOD marks: \"$MARK\""
echo "~$TIMESTAMP~"
echo ""
echo "Begin here."
echo ""
echo "Next: bash tools/ember.sh \"$MARK\""
