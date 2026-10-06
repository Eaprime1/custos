#!/usr/bin/env bash
# Fixture tests for tools/validate_json_yaml.sh.
# Builds small JSON/YAML files in a scratch directory, runs the validator on
# each, and checks the exit code. Writes nothing outside the scratch directory.
#
#   bash tools/test_validate_json_yaml.sh
#
# Exit 0 when every case behaves as expected, 1 when any case does not.
# Needs python3 and PyYAML, like the validator itself.
set -uo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VALIDATOR="$HERE/validate_json_yaml.sh"
SCRATCH="$(mktemp -d)"
trap 'rm -rf "$SCRATCH"' EXIT

pass=0
fail=0

# case_dir <name> <file name> <content>: make a one-file directory and echo it.
case_dir() {
  local dir="$SCRATCH/$1"
  mkdir -p "$dir"
  printf '%s\n' "$3" > "$dir/$2"
  printf '%s' "$dir"
}

# check <label> <expected exit> <dir>
check() {
  local label="$1" want="$2" dir="$3" got
  bash "$VALIDATOR" "$dir" >/dev/null 2>&1
  got=$?
  if [ "$got" -eq "$want" ]; then
    pass=$((pass + 1))
    printf 'ok   %s\n' "$label"
  else
    fail=$((fail + 1))
    printf 'FAIL %s (expected exit %s, got %s)\n' "$label" "$want" "$got"
  fi
}

check "valid JSON passes" 0 \
  "$(case_dir json_ok a.json '{"a": 1, "b": [1, 2]}')"

check "unclosed JSON array fails" 1 \
  "$(case_dir json_bad a.json '{"a": [1, 2}')"

check "duplicate JSON key fails" 1 \
  "$(case_dir json_dup a.json '{"a": 1, "a": 2}')"

check "valid YAML passes" 0 \
  "$(case_dir yaml_ok a.yaml $'a: 1\nb:\n  - x\n  - y')"

check "duplicate YAML key fails" 1 \
  "$(case_dir yaml_dup a.yaml $'a: 1\na: 2')"

check "two merge keys in one mapping fail" 1 \
  "$(case_dir yaml_two_merge a.yaml $'base: &x {k: 1}\nitem:\n  <<: *x\n  <<: *x')"

check "one merge key with a list of anchors passes" 0 \
  "$(case_dir yaml_merge_list a.yaml $'a: &a {k: 1}\nb: &b {m: 2}\nitem:\n  <<: [*a, *b]')"

check "local key overriding a merged key passes" 0 \
  "$(case_dir yaml_override a.yaml $'base: &x {k: 1}\nitem:\n  <<: *x\n  k: 2')"

check "missing directory exits 2" 2 "$SCRATCH/does-not-exist"

printf '\n%s passed, %s failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ]
