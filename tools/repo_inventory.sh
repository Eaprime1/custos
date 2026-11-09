#!/usr/bin/env bash
# repo_inventory.sh — step 1 of a repo restructure plan (see guides/repo-restructure-plan.md).
# Read-only. Prints what a repo holds so a plan can be built from facts, not memory.
# Usage: bash tools/repo_inventory.sh <path-to-git-repo>

set -u

repo="${1:-}"
if [ -z "$repo" ] || [ ! -d "$repo/.git" ]; then
  echo "usage: bash tools/repo_inventory.sh <path-to-git-repo>" >&2
  exit 2
fi

g() { git -C "$repo" "$@"; }

echo "== repo"
echo "path:    $repo"
echo "remote:  $(g remote get-url origin 2>/dev/null || echo none)"
echo "branch:  $(g rev-parse --abbrev-ref HEAD 2>/dev/null)"
echo "commit:  $(g log -1 --format='%h %cs %s' 2>/dev/null)"
echo "history: $(g rev-parse --is-shallow-repository 2>/dev/null | sed 's/true/shallow clone/; s/false/full/')"
echo "tracked: $(g ls-files | wc -l | tr -d ' ') files"

echo
echo "== top level (files per entry)"
g ls-files | cut -d/ -f1 | sort | uniq -c | sort -rn | head -25

echo
echo "== file types (top 10 extensions)"
g ls-files | sed -n 's/.*\.\([A-Za-z0-9]\{1,8\}\)$/\1/p' | sort | uniq -c | sort -rn | head -10

echo
echo "== files over 1 MB"
g ls-tree -r -l HEAD | awk -F'\t' '{ split($1, a, " "); if (a[4] + 0 > 1000000) print a[4], $2 }' | sort -rn | head -10

echo
echo "== names that need attention"
echo "-- tracked names that look like secrets (names only, never values):"
g ls-files | grep -iE '(^|/)(\.env|id_rsa|[^/]*\.pem|[^/]*\.key|[^/]*credential[^/]*)$' || echo "none"
echo "-- names starting with a symbol, or containing spaces:"
g ls-files | grep -E '(^|/)[^A-Za-z0-9_.][^/]*$|[[:space:]]' | head -15 || true

echo
echo "== orientation files"
for f in README.md CLAUDE.md LICENSE LICENSE.md CONTRIBUTING.md .github; do
  if g ls-files --error-unmatch "$f" >/dev/null 2>&1 || [ -n "$(g ls-files "$f" | head -1)" ]; then
    echo "present: $f"
  else
    echo "missing: $f"
  fi
done
