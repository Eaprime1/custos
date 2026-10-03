#!/usr/bin/env bash
# session_id.sh — give one conversation its own ID, before its first step.
#
#   bash tools/session_id.sh                         menu: pick a type, generate or type your own
#   bash tools/session_id.sh --auto <type> [note]    automatic: print a new ID and stop
#   bash tools/session_id.sh --set <id> [note]       use an ID you made up (checked, never reused)
#   add --log to any of the above to append the ID to .claude/session-ids.md
#
# Types: explore, setup, consider, other.
# An ID is a three-letter type code, a dash and a short random tail, e.g. exp-7k3q9f.
# It carries no time stamp on purpose: it exists before the process, and so before
# the prima-clock does. The ledger (opt-in) records when it was minted, separately.
#
# Not the same as a navigo key (docs/navigo-registry.md): a key names a seat that
# lasts; an ID names one conversation.

set -eu

LEDGER=".claude/session-ids.md"

usage() {
  sed -n '2,13p' "$0" | sed 's/^# \{0,1\}//'
  exit "${1:-2}"
}

code_for() {
  case "$1" in
    explore)  echo exp ;;
    setup)    echo set ;;
    consider) echo con ;;
    other)    echo oth ;;
    *) return 1 ;;
  esac
}

type_for() {
  case "$1" in
    exp) echo explore ;;
    set) echo setup ;;
    con) echo consider ;;
    oth) echo other ;;
  esac
}

taken() {
  [ -f "$LEDGER" ] && grep -q "^| $1 |" "$LEDGER"
}

random_tail() {
  # no 0, 1, i, l or o: easy to read aloud and to type from a phone
  LC_ALL=C tr -dc 'a-hjkmnp-z2-9' < /dev/urandom | head -c 6
}

mint() {
  # mint <code>: print a new unused ID
  local code="$1" id tries=0
  while [ "$tries" -lt 20 ]; do
    id="$code-$(random_tail)"
    if ! taken "$id"; then echo "$id"; return 0; fi
    tries=$((tries + 1))
  done
  echo "could not find an unused ID" >&2
  return 3
}

check_own() {
  # check_own <id>: refuse a malformed or taken ID
  case "$1" in
    exp-*|set-*|con-*|oth-*) ;;
    *) echo "an ID starts with exp-, set-, con- or oth-" >&2; return 3 ;;
  esac
  case "${1#*-}" in
    *[!a-z0-9]*|"") echo "after the dash use only a-z and 0-9" >&2; return 3 ;;
  esac
  tail_len=$(printf '%s' "${1#*-}" | wc -c)
  if [ "$tail_len" -lt 3 ] || [ "$tail_len" -gt 12 ]; then
    echo "the part after the dash is 3 to 12 characters" >&2
    return 3
  fi
  if taken "$1"; then
    echo "$1 is already in $LEDGER" >&2
    return 3
  fi
}

log_id() {
  # log_id <id> <how> <note>
  local id="$1" how="$2" note="$3" kind
  kind="$(type_for "${id%%-*}")"
  if [ ! -f "$LEDGER" ]; then
    mkdir -p "$(dirname "$LEDGER")"
    {
      echo "# Session IDs"
      echo
      echo "Append only. One row per conversation. The ID carries no time stamp; the"
      echo "minted column records it separately. See tools/session_id.sh."
      echo
      echo "| id | type | how | note | minted |"
      echo "|---|---|---|---|---|"
    } > "$LEDGER"
  fi
  printf '| %s | %s | %s | %s | %s |\n' "$id" "$kind" "$how" "$note" "$(date '+%Y%m%d%H%M')" >> "$LEDGER"
}

show() {
  local id="$1" kind
  kind="$(type_for "${id%%-*}")"
  echo
  echo "Session ID : $id"
  echo "Type       : $kind"
  echo
  echo "Paste this as the first line of the conversation:"
  echo "  Session: $id · type: $kind"
}

LOG=no
ARGS=()
for a in "$@"; do
  if [ "$a" = "--log" ]; then LOG=yes; else ARGS+=("$a"); fi
done
set -- ${ARGS[@]+"${ARGS[@]}"}

mode="${1:-menu}"

case "$mode" in
  -h|--help) usage 0 ;;
  --auto)
    [ $# -ge 2 ] || usage
    code="$(code_for "$2")" || { echo "type is explore, setup, consider or other" >&2; exit 2; }
    id="$(mint "$code")"
    [ "$LOG" = yes ] && log_id "$id" auto "${3:-}"
    if [ "$LOG" = yes ]; then show "$id"; else echo "$id"; fi
    ;;
  --set)
    [ $# -ge 2 ] || usage
    check_own "$2"
    [ "$LOG" = yes ] && log_id "$2" manual "${3:-}"
    show "$2"
    ;;
  menu)
    echo "What kind of conversation is this?"
    echo "  1) explore   2) setup   3) consider   4) other"
    printf "> "; read -r pick
    case "$pick" in
      1) kind=explore ;; 2) kind=setup ;; 3) kind=consider ;; 4) kind=other ;;
      *) echo "pick 1 to 4" >&2; exit 2 ;;
    esac
    code="$(code_for "$kind")"
    echo "  1) generate one for me   2) I will type my own"
    printf "> "; read -r how
    case "$how" in
      1) id="$(mint "$code")"; how=auto ;;
      2) printf "ID (%s-...): " "$code"; read -r id; check_own "$id"; how=manual ;;
      *) echo "pick 1 or 2" >&2; exit 2 ;;
    esac
    printf "One-line note (optional): "; read -r note || note=""
    if [ "$LOG" = no ]; then
      printf "Append to %s? [y/N] " "$LEDGER"; read -r yn || yn=n
      case "$yn" in y|Y) LOG=yes ;; esac
    fi
    [ "$LOG" = yes ] && log_id "$id" "$how" "$note"
    show "$id"
    ;;
  *) usage ;;
esac
