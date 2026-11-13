#!/usr/bin/env bash
# Tests for tools/fix_blank_lines.sh. Needs Node (npx); skips cleanly without it.
#   bash tools/test_fix_blank_lines.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOL="${SCRIPT_DIR}/fix_blank_lines.sh"

if ! command -v npx >/dev/null 2>&1; then
  echo "SKIP: npx not found"
  exit 0
fi

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
export CUSTOS_LEDGER="$WORK/ledger.tsv"

PASS=0
FAIL=0
ok()   { PASS=$((PASS + 1)); echo "  ok   $1"; }
fail() { FAIL=$((FAIL + 1)); echo "  FAIL $1"; }

# A file with both violations, a fenced block that must stay untouched, and front matter.
cat > "$WORK/bad.md" <<'EOF'
---
title: sample
---
# Heading one
Text right under the heading.
## Heading two
- item a
- item b
Closing text right after a list.

```text
# not a heading, inside a fence
- not a list either
```
EOF
cp "$WORK/bad.md" "$WORK/bad.orig"

printf '# Clean\n\nAll good.\n' > "$WORK/clean.md"

echo "fix_blank_lines.sh"

# 1. check reports, changes nothing, writes no ledger
out="$(bash "$TOOL" "$WORK/bad.md" 2>&1)"
echo "$out" | grep -q "with findings" && ! echo "$out" | grep -q ", 0 finding" && ok "check reports findings" || fail "check reports findings"
cmp -s "$WORK/bad.md" "$WORK/bad.orig" && ok "check leaves the file alone" || fail "check leaves the file alone"
[[ ! -e "$CUSTOS_LEDGER" ]] && ok "check writes no ledger" || fail "check writes no ledger"

# 2. strict exits 1 on findings, 0 on a clean file
bash "$TOOL" --strict "$WORK/bad.md" >/dev/null 2>&1 && fail "strict exits 1 on findings" || ok "strict exits 1 on findings"
bash "$TOOL" --strict "$WORK/clean.md" >/dev/null 2>&1 && ok "strict exits 0 when clean" || fail "strict exits 0 when clean"

# 3. fix: no findings left, only blank lines added, fence intact, one ledger line
bash "$TOOL" --fix "$WORK/bad.md" >/dev/null 2>&1 || fail "fix runs"
after="$(bash "$TOOL" "$WORK/bad.md" 2>&1)"
echo "$after" | grep -q ", 0 finding" && ok "fix leaves no findings" || fail "fix leaves no findings"
diff -q <(grep -v '^[[:space:]]*$' "$WORK/bad.orig") <(grep -v '^[[:space:]]*$' "$WORK/bad.md") >/dev/null \
  && ok "only blank lines were added" || fail "only blank lines were added"
grep -qx '# not a heading, inside a fence' "$WORK/bad.md" && ok "fenced code untouched" || fail "fenced code untouched"
[[ "$(wc -l < "$CUSTOS_LEDGER" | tr -d ' ')" == "1" ]] && ok "one ledger line after one fix" || fail "one ledger line after one fix"

# 4. a second fix finds nothing but is still counted as a run
bash "$TOOL" --fix "$WORK/bad.md" >/dev/null 2>&1
[[ "$(wc -l < "$CUSTOS_LEDGER" | tr -d ' ')" == "2" ]] && ok "second run is counted" || fail "second run is counted"
stats="$(bash "$TOOL" --stats)"
echo "$stats" | grep -q "2 runs, 1 changed something" && ok "stats totals" || { fail "stats totals"; echo "    got: $stats"; }

echo ""
echo "${PASS} passed, ${FAIL} failed"
[[ "$FAIL" -eq 0 ]]
