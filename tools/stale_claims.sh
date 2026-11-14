#!/usr/bin/env bash
# Stale Claims — lists backticked paths in instruction files that the tree does not have.
#
# Advisory and report-only: prints candidates, never writes, always exits 0.
# Many hits are legitimate (paths in another repo, names relative to a folder,
# files created by a script). A person reads the list; the script does not judge.
# Counts ("25 workflows") are not checked here; give the command that makes the
# number, or drop the number.
#
# Usage: bash tools/stale_claims.sh [file ...]     (default: CLAUDE.md README.md)
#        STALE_ROOT=/path/to/other/repo bash tools/stale_claims.sh   (check a peer checkout)
set -uo pipefail
cd "${STALE_ROOT:-$(dirname "$0")/..}" || exit 1
bt=$'\x60'   # a backtick, kept out of single quotes so the shell lint stays quiet
files=("$@"); [ ${#files[@]} -eq 0 ] && files=(CLAUDE.md README.md)
# A name written without its folder ("scan-lexeme.yml") counts as present when a
# file or folder with that name exists anywhere in the tree.
names=$(git ls-files | awk -F/ '{print $NF; for(i=1;i<NF;i++){print $i}}' | sort -u)
for f in "${files[@]}"; do
  [ -f "$f" ] || { echo "skip: $f not found"; continue; }
  total=0; missing=0
  while IFS= read -r tok; do
    case "$tok" in *' '*|*'<'*|*'>'*|*'*'*|*'{'*|*'$'*|*'|'*|*'='*|*'~'*|*'['*|http*|-*|'#'*) continue;; esac
    case "$tok" in .*) case "${tok#.}" in */*) ;; *) continue;; esac;; esac
    case "$tok" in */*|*.md|*.sh|*.yml|*.yaml|*.json|*.js) ;; *) continue;; esac
    total=$((total+1))
    p="${tok%%#*}"; p="${p%/}"
    [ -e "$p" ] || printf '%s\n' "$names" | grep -qxF -- "${p##*/}" || { missing=$((missing+1)); echo "  not in tree: $tok"; }
  done < <(grep -o "${bt}[^${bt}]*${bt}" "$f" | tr -d "$bt" | sort -u)
  echo "$f: $missing of $total backticked path-like names not in the tree"
done
exit 0
