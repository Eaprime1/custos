#!/usr/bin/env bash
# verify.sh — check every origin in this vault.
# Rule: an origin's bytes on disk must match the SHA-256 recorded beside it.
# Authoritative check: `sha256sum -c` (GNU coreutils). This script only loops over the folders.
# Usage: bash tools/verify.sh [vault-root]

set -u

root="${1:-.}"
fail=0
count=0

for dir in "$root"/origins/*/; do
  [ -d "$dir" ] || continue
  count=$((count + 1))
  if [ ! -f "${dir}origin.sha256" ]; then
    echo "MISSING hash file: ${dir}"
    fail=1
    continue
  fi
  if (cd "$dir" && sha256sum -c --status origin.sha256); then
    echo "ok    ${dir}"
  else
    echo "FAIL  ${dir}"
    fail=1
  fi
done

echo "checked ${count} origin(s)"
if [ "$count" -eq 0 ]; then
  echo "no origins found"
fi
exit "$fail"
