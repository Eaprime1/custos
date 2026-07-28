#!/usr/bin/env bash
# log_install.sh — append an entry to device/install-log.md
set -euo pipefail

LOG="device/install-log.md"

if [[ ! -f "$LOG" ]]; then
  echo "Error: $LOG not found. Run from repo root."
  exit 1
fi

ITEM="${1:-}"
LOCATION="${2:-}"
METHOD="${3:-}"
#BY="${4:-$(whoami 2>/dev/null || echo "${USER:-unknown}")}"
BY="${4:-${USER:-$(whoami 2>/dev/null || echo "unknown")}}"
NOTES="${5:-}"

if [[ -z "$ITEM" || -z "$LOCATION" || -z "$METHOD" ]]; then
  echo "Usage: $0 <item> <location> <method> [by] [notes]"
  echo "  e.g. $0 ripgrep 'pixel8 (Termux)' pkg eaprime1 'for faster scan_lexeme'"
  exit 1
fi

{
  echo ""
  echo "---"
  echo "date:     $(date +%Y-%m-%d)"
  echo "item:     $ITEM"
  echo "location: $LOCATION"
  echo "method:   $METHOD"
  echo "by:       $BY"
  echo "notes:    $NOTES"
  echo "---"
} >> "$LOG"

echo "Logged: $ITEM @ $LOCATION ($METHOD) by $BY"
echo "-> $LOG"
