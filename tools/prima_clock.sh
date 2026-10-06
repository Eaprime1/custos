#!/usr/bin/env bash
# Prints a prima-clock stamp: YYYYMMDDHHMM.
#
#   bash tools/prima_clock.sh           # UTC (the default)
#   bash tools/prima_clock.sh --utc     # UTC, spelled out
#   bash tools/prima_clock.sh --local   # this machine's local time
#
# UTC is for official records: the seal, the cue record, custody logs, MOAV
# carriers and registry entries, so they do not depend on where the Shepherd
# is. The Shepherd's own stamps use local time; pass --local for those. So does
# any log whose own schema asks for local time (custos's turns/log.md does, see
# turns/TURN_SCHEMA.md).
set -euo pipefail

usage() {
  echo "usage: prima_clock.sh [--utc | --local]" >&2
}

if [ "$#" -gt 1 ]; then
  usage
  exit 2
fi

case "${1:-}" in
  "" | --utc) date -u '+%Y%m%d%H%M' ;;
  --local) date '+%Y%m%d%H%M' ;;
  -h | --help) usage ;;
  *)
    usage
    exit 2
    ;;
esac
