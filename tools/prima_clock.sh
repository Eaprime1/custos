#!/usr/bin/env bash
# Prints a prima-clock stamp: YYYYMMDDHHMM.
#
#   bash tools/prima_clock.sh           # UTC (the default)
#   bash tools/prima_clock.sh --utc     # UTC, spelled out
#   bash tools/prima_clock.sh --local   # this machine's local time
#
# UTC is for official records: the seal, the cue record, custody logs, MOAV
# carriers and registry entries, so they do not depend on where the Shepherd
# is. The Shepherd's own stamps use local time; pass --local for those.
set -euo pipefail

usage() {
  echo "usage: prima_clock.sh [--utc | --local]" >&2
}

case "${1:-}" in
  "" | --utc) date -u '+%Y%m%d%H%M' ;;
  --local) date '+%Y%m%d%H%M' ;;
  -h | --help) usage ;;
  *)
    usage
    exit 2
    ;;
esac
