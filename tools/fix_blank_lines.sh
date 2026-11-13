#!/usr/bin/env bash
# Blank-line check and fixer for Markdown: one job, done the same way every time.
#
# Codacy's most common Markdown findings are two markdownlint rules:
#   MD022  a blank line above and below every heading
#   MD032  a blank line before and after every list
# This tool checks those two rules and, when asked, fixes them. It touches
# nothing else: after a fix it confirms the only lines added were blank lines,
# and it stops with an error if anything else changed.
#
#   bash tools/fix_blank_lines.sh                 # check .md files changed since origin/main (report only)
#   bash tools/fix_blank_lines.sh --fix           # fix them, then write one line to the ledger
#   bash tools/fix_blank_lines.sh --fix docs/a.md # fix named files instead
#   bash tools/fix_blank_lines.sh --strict        # check, and exit 1 if anything is found
#   bash tools/fix_blank_lines.sh --stats         # totals from the ledger
#   bash tools/fix_blank_lines.sh --base REF      # compare against REF instead of origin/main
#
# Needs Node (npx). The markdownlint version is pinned; override with MDL_VERSION.
#
# The ledger is a local file that is never committed, in keeping with this
# repo's habit of no state files and no bot commits (see scan_provenance.sh).
# Default: ~/.custos-ledger/blank-lines.tsv. Override with CUSTOS_LEDGER.
# One tab-separated line per --fix run: prima-clock (UTC), files checked, files
# with findings, findings before, findings after, markdownlint version.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MDL_VERSION="${MDL_VERSION:-0.41.0}"
LEDGER="${CUSTOS_LEDGER:-$HOME/.custos-ledger/blank-lines.tsv}"
RULES='{"default":false,"MD022":true,"MD032":true}'

MODE=check
STRICT=0
BASE="origin/main"
PATHS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)  MODE=check ;;
    --fix)    MODE=fix ;;
    --stats)  MODE=stats ;;
    --strict) STRICT=1 ;;
    --base)   BASE="${2:?--base needs a ref}"; shift ;;
    -h|--help) sed -n '2,24p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 0 ;;
    -*) echo "Unknown option: $1" >&2; exit 2 ;;
    *)  PATHS+=("$1") ;;
  esac
  shift
done

if [[ "$MODE" == stats ]]; then
  if [[ ! -s "$LEDGER" ]]; then
    echo "No ledger yet at $LEDGER (it is written by --fix runs)."
    exit 0
  fi
  awk -F'\t' '
    { runs++; fixed += ($4 - $5); if ($4 > $5) changed++; last = $1 }
    END {
      printf "Blank-line fixer ledger: %d runs, %d changed something, %d findings fixed, last run %s\n",
             runs, changed, fixed, last
    }' "$LEDGER"
  exit 0
fi

if ! command -v npx >/dev/null 2>&1; then
  echo "Error: npx not found. This tool needs Node (https://nodejs.org)." >&2
  exit 2
fi

# Which files: named paths, else every .md changed since BASE (including
# uncommitted and new files).
FILES=()
if [[ ${#PATHS[@]} -gt 0 ]]; then
  FILES=("${PATHS[@]}")
else
  if ! git rev-parse --verify --quiet "$BASE" >/dev/null; then
    BASE="HEAD~1"
  fi
  while IFS= read -r f; do
    [[ -n "$f" && -f "$f" ]] && FILES+=("$f")
  done < <({ git diff --name-only --diff-filter=AMR "$BASE" -- '*.md'
             git ls-files --others --exclude-standard -- '*.md'; } | sort -u)
fi

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "Blank-line check: no Markdown files to look at."
  exit 0
fi

CONF="$(mktemp)"
trap 'rm -f "$CONF"' EXIT
printf '%s\n' "$RULES" > "$CONF"

mdl() { npx --yes "markdownlint-cli@${MDL_VERSION}" --config "$CONF" "$@" 2>&1 || true; }

# markdownlint prints "path:line RULE ..." per finding.
findings() { mdl -- "${FILES[@]}" | grep -E ':[0-9]+(:[0-9]+)? MD0(22|32)/' || true; }
count_lines() { if [[ -z "$1" ]]; then echo 0; else printf '%s\n' "$1" | wc -l | tr -d ' '; fi; }
snapname() { printf '%s' "$1" | tr -c 'A-Za-z0-9._-' '_'; }
files_in() { if [[ -z "$1" ]]; then return; fi; printf '%s\n' "$1" | sed -E 's/:[0-9]+(:[0-9]+)? MD.*//' | sort -u; }

BEFORE_TXT="$(findings)"
BEFORE="$(count_lines "$BEFORE_TXT")"
FILES_WITH="$(files_in "$BEFORE_TXT" | grep -c . || true)"

echo "Blank-line check (MD022/MD032): ${#FILES[@]} file(s) looked at, ${FILES_WITH} with findings, ${BEFORE} finding(s)."

if [[ "$MODE" == check ]]; then
  if [[ "$BEFORE" -gt 0 ]]; then
    printf '%s\n' "$BEFORE_TXT" | sed 's/^/  /'
    echo ""
    echo "  Fix with: bash tools/fix_blank_lines.sh --fix"
    echo "  Advisory only unless --strict is given."
    [[ "$STRICT" -eq 1 ]] && exit 1
  fi
  exit 0
fi

# --fix
if [[ "$BEFORE" -gt 0 ]]; then
  # Snapshot the non-blank lines of every file with findings, so we can prove
  # afterwards that only blank lines were added.
  SNAP="$(mktemp -d)"
  trap 'rm -f "$CONF"; rm -rf "$SNAP"' EXIT
  while IFS= read -r f; do
    [[ -z "$f" ]] && continue
    grep -v '^[[:space:]]*$' -- "$f" > "$SNAP/$(snapname "$f")" || true
  done < <(files_in "$BEFORE_TXT")

  mdl --fix -- "${FILES[@]}" >/dev/null

  CHANGED=""
  while IFS= read -r f; do
    [[ -z "$f" ]] && continue
    if ! diff -q "$SNAP/$(snapname "$f")" <(grep -v '^[[:space:]]*$' -- "$f") >/dev/null; then
      CHANGED="${CHANGED}${f}"$'
'
    fi
  done < <(files_in "$BEFORE_TXT")
  if [[ -n "$CHANGED" ]]; then
    echo "Error: the fix changed more than blank lines in:" >&2
    printf '%s' "$CHANGED" | sed 's/^/  /' >&2
    echo "  Nothing was recorded. Review with git diff and restore those files." >&2
    exit 1
  fi
fi

AFTER_TXT="$(findings)"
AFTER="$(count_lines "$AFTER_TXT")"
FIXED=$(( BEFORE - AFTER ))

echo "  fixed ${FIXED} of ${BEFORE}; ${AFTER} left."
[[ "$AFTER" -gt 0 ]] && printf '%s\n' "$AFTER_TXT" | sed 's/^/  left: /'

mkdir -p "$(dirname "$LEDGER")"
STAMP="$(bash "${SCRIPT_DIR}/prima_clock.sh" 2>/dev/null || date -u '+%Y%m%d%H%M')"
printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$STAMP" "${#FILES[@]}" "$FILES_WITH" "$BEFORE" "$AFTER" "$MDL_VERSION" >> "$LEDGER"
echo "  ledger: $LEDGER (bash tools/fix_blank_lines.sh --stats for totals)"
