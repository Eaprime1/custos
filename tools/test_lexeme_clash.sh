#!/usr/bin/env bash
# Offline test table for tools/lexeme_clash.sh. Needs python3; no network.
# Each row: arguments, expected exit code, and text that must appear in the output ("-" for none).
set -uo pipefail
cd "$(dirname "$0")/.."

pass=0
fail=0

row() {
  local args="$1" want_exit="$2" want_text="$3" out got
  # shellcheck disable=SC2086
  out="$(bash tools/lexeme_clash.sh $args 2>&1)"
  got=$?
  if [ "$got" -eq "$want_exit" ] && { [ "$want_text" = "-" ] || printf '%s' "$out" | grep -q -- "$want_text"; }; then
    pass=$((pass + 1))
  else
    fail=$((fail + 1))
    echo "FAIL: [$args] exit $got (wanted $want_exit), text '$want_text'"
    printf '%s\n' "$out" | sed 's/^/      /'
  fi
}

# A live action is a hard clash.
row "recensio" 1 "already a action"
# A live modifier is a hard clash.
row "ultima" 1 "already a modifier"
# A check-in cue and an addressee name are hard clashes too.
row "placet" 1 "already a verb"
row "claude" 1 "already a name"
# A free word is fine.
row "mitte" 0 "not in the parser lists"
# A proposed word may use the code reserved for it in the skill's Proposed table.
row "mitte MIT" 0 "reserved for 'mitte'"
# A different word may not take a code another proposal already holds.
row "accipe MIT" 1 "already in the code table"
# A free word with a free code.
row "vorare VOR" 0 "code VOR is free"
# A code in the skill's table is a hard clash.
row "mitte REC" 1 "code table"
# A code that is the first three letters of a live word is a hard clash.
row "mitte EXP" 1 "first three letters"
# A conversation-ID prefix only warns.
row "expedio" 0 "conversation-ID prefix"
# A near-word only warns.
row "recensios" 0 "edit(s) from action 'recensio'"
# Case does not matter for the word or the code.
row "MITTE mit" 0 "reserved for 'mitte'"
# Bad shapes are usage errors.
row "Mitte!" 2 "BAD"
row "mitte MI" 2 "BAD"
# --list prints the tables.
row "--list" 0 "id prefixes: exp set con oth"

echo "lexeme_clash tests: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
