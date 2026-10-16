#!/usr/bin/env bash
# Offline checks for tools/check_workflow_injection.py. Needs python3; no network.
# Run from the repo root: bash tools/test_check_workflow_injection.sh
set -u
tool="tools/check_workflow_injection.py"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
pass=0
fail=0

# check <name> <expected exit> <expected issue count> <workflow text>
check() {
  local name="$1" want_rc="$2" want_n="$3" text="$4" out rc n
  printf '%s\n' "$text" > "$tmp/w.yml"
  out=$(python3 "$tool" "$tmp/w.yml"); rc=$?
  n=$(printf '%s\n' "$out" | grep -c '^   Line ')
  if [ "$rc" = "$want_rc" ] && [ "$n" = "$want_n" ]; then
    pass=$((pass + 1))
  else
    fail=$((fail + 1)); echo "FAIL: $name (exit $rc want $want_rc, issues $n want $want_n)"
  fi
}

check "clean workflow" 0 0 $'jobs:\n  a:\n    steps:\n      - run: echo hello'
check "inline run" 1 1 $'jobs:\n  a:\n    steps:\n      - name: x\n        run: echo ${{ github.event.comment.body }}'
check "dash inline run" 1 1 $'jobs:\n  a:\n    steps:\n      - run: echo ${{ github.head_ref }}'
check "block run" 1 1 $'jobs:\n  a:\n    steps:\n      - name: x\n        run: |\n          echo ${{ github.head_ref }}'
check "folded run" 1 1 $'jobs:\n  a:\n    steps:\n      - name: x\n        run: >-\n          echo ${{ inputs.v }}'
check "dash block run" 1 1 $'jobs:\n  a:\n    steps:\n      - run: |\n          echo ${{ github.head_ref }}'
check "env value after a block is not a run line" 0 0 $'jobs:\n  a:\n    steps:\n      - name: x\n        run: |\n          echo "$X"\n        env:\n          X: ${{ github.sha }}'
check "env value beside a dash block is not a run line" 0 0 $'jobs:\n  a:\n    steps:\n      - run: |\n          echo "$X"\n        env:\n          X: ${{ github.sha }}'
check "if: and with: expressions are not run lines" 0 0 $'jobs:\n  a:\n    if: ${{ github.event_name == 1 }}\n    steps:\n      - uses: x@v1\n        with:\n          a: ${{ github.sha }}'
check "two issues, two blocks" 1 2 $'jobs:\n  a:\n    steps:\n      - run: |\n          echo ${{ github.a }}\n      - run: |\n          echo ${{ github.b }}'

# the repo's own workflows must be clean
if python3 "$tool" --check .github/workflows > /dev/null; then pass=$((pass + 1)); else fail=$((fail + 1)); echo "FAIL: the repo's workflows are not clean"; fi

echo "$pass passed, $fail failed"
[ "$fail" = 0 ]
