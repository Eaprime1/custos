#!/usr/bin/env bash
# commission_pack.sh — build a commission pack from files in this repo, or check its shadow.
#
#   bash tools/commission_pack.sh build <slug> <to-repo> <out-dir> <path>...
#   bash tools/commission_pack.sh check <pack-id>
#
# build  copies each file (a directory is walked) byte for byte into <out-dir>/<id>/files/<path>,
#        writes files.sha256 (sha256sum -c format, paths relative to the pack folder) and
#        manifest.json, then keeps a shadow record (manifest.json and files.sha256, not the files)
#        in atelier/commissions/packs/<id>/. The sources are not touched, moved or deleted.
# check  compares the files still in this repo with the hashes recorded when the pack was built.
#        A mismatch means the shadow has drifted from what was sent. Exit 0 = no drift.
#
# <id> is <YYYYMMDDHHMM>-<slug>, stamped in UTC (PACK_STAMP overrides it, for tests).
# COMMISSION_ROOT overrides the repo root, for tests. Needs sha256sum and python3.
set -uo pipefail

root="${COMMISSION_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
cd "$root" || { echo "cannot enter $root" >&2; exit 2; }
packs="atelier/commissions/packs"

usage() { sed -n '2,15p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 2; }

cmd="${1:-}"
[ -n "$cmd" ] || usage
shift

case "$cmd" in
  build)
    slug="${1:-}"; to="${2:-}"; out="${3:-}"
    [ -n "$slug" ] && [ -n "$to" ] && [ -n "$out" ] && [ "$#" -ge 4 ] || usage
    shift 3
    case "$slug" in *[!a-z0-9-]*|"") echo "slug must be lowercase letters, digits and hyphens" >&2; exit 2;; esac
    stamp="${PACK_STAMP:-$(date -u '+%Y%m%d%H%M')}"
    id="${stamp}-${slug}"
    pack="$out/$id"
    [ ! -e "$pack" ] || { echo "$pack already exists; a pack is never overwritten" >&2; exit 1; }
    [ ! -e "$packs/$id" ] || { echo "$packs/$id already exists; a pack is never overwritten" >&2; exit 1; }

    list="$(mktemp)"; trap 'rm -f "$list"' EXIT
    for p in "$@"; do
      if [ -d "$p" ]; then find "$p" -type f | LC_ALL=C sort >> "$list"
      elif [ -f "$p" ]; then echo "$p" >> "$list"
      else echo "not a file or directory: $p" >&2; exit 1; fi
    done
    sed -i 's#^\./##' "$list"
    mkdir -p "$pack/files" || exit 1
    : > "$pack/files.sha256"
    while IFS= read -r f; do
      mkdir -p "$pack/files/$(dirname "$f")"
      cp -p "$f" "$pack/files/$f"
      (cd "$pack" && sha256sum "files/$f" >> files.sha256)
    done < "$list"

    dirty="no"
    if git rev-parse --git-dir >/dev/null 2>&1; then
      src_commit="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
      mapfile -t src_paths < "$list"
      if [ -n "$(git status --porcelain -- "${src_paths[@]}" 2>/dev/null)" ]; then dirty="yes"; fi
    else
      src_commit="not a git checkout"
    fi
    python3 - "$pack" "$id" "$stamp" "$to" "$src_commit" "$dirty" "$list" <<'PY'
import hashlib, json, os, sys
pack, pid, stamp, to, commit, dirty, listfile = sys.argv[1:8]
files = []
for line in open(listfile):
    f = line.rstrip("\n")
    if not f:
        continue
    b = open(os.path.join(pack, "files", f), "rb").read()
    files.append({"path": f, "bytes": len(b), "sha256": hashlib.sha256(b).hexdigest()})
m = {
    "id": pid,
    "kind": "commission-pack",
    "prima_clock": stamp,
    "from": {"repo": "Eaprime1/custos", "source_commit": commit,
             "uncommitted_changes_in_sources": dirty == "yes"},
    "to": {"repo": to},
    "files": files,
    "shadow": {"kept_in": "the same paths in the sending repo",
               "record": "atelier/commissions/packs/" + pid + "/ (manifest.json, files.sha256)",
               "check": "bash tools/commission_pack.sh check " + pid},
    "chain_of_custody": "OPEN",
    "receipt": None,
    "notes": "A commission pack is the carriage, not an origin. It is not a carbonite (a working copy) and not an aethereal (a living copy). The sender keeps a shadow: the originals stay in place, frozen at send time by the hashes here."
}
json.dump(m, open(os.path.join(pack, "manifest.json"), "w"), indent=2, ensure_ascii=False)
open(os.path.join(pack, "manifest.json"), "a").write("\n")
PY
    [ $? -eq 0 ] || exit 1
    (cd "$pack" && sha256sum -c --quiet files.sha256) || { echo "pack failed its own check" >&2; exit 1; }
    mkdir -p "$packs/$id"
    cp "$pack/manifest.json" "$pack/files.sha256" "$packs/$id/"
    echo "built  $pack ($(wc -l < "$pack/files.sha256" | tr -d ' ') file(s))"
    echo "shadow $packs/$id/"
    [ "$dirty" = "yes" ] && echo "note   some source files had uncommitted changes when the pack was built"
    exit 0
    ;;
  check)
    id="${1:-}"
    [ -n "$id" ] || usage
    rec="$packs/$id/files.sha256"
    [ -f "$rec" ] || { echo "no shadow record at $rec" >&2; exit 2; }
    if sed 's#  files/#  #' "$rec" | sha256sum -c --quiet; then
      echo "shadow matches the pack $id ($(wc -l < "$rec" | tr -d ' ') file(s))"
      exit 0
    fi
    echo "DRIFT: the files above no longer match what pack $id sent" >&2
    exit 1
    ;;
  *) usage ;;
esac
