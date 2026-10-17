#!/usr/bin/env bash
# Fixture tests for tools/commission_pack.sh.
# Builds a small fake repo in a scratch directory, builds a pack from it, and checks the pack,
# the shadow record and drift detection. Writes nothing outside the scratch directory.
#
#   bash tools/test_commission_pack.sh
#
# Exit 0 when every case behaves as expected, 1 when any case does not. Needs sha256sum and python3.
set -uo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOL="$HERE/commission_pack.sh"
SCRATCH="$(mktemp -d)" || { echo "cannot create a scratch directory" >&2; exit 1; }
[ -n "$SCRATCH" ] && [ -d "$SCRATCH" ] || { echo "scratch directory missing" >&2; exit 1; }
trap 'rm -rf "$SCRATCH"' EXIT

pass=0
fail=0
ok()  { pass=$((pass + 1)); echo "ok    $1"; }
bad() { fail=$((fail + 1)); echo "FAIL  $1"; }
expect() {  # expect <label> <wanted exit> <command...>
  local label="$1" want="$2"; shift 2
  "$@" >"$SCRATCH/last.out" 2>&1; local got=$?
  if [ "$got" -eq "$want" ]; then ok "$label"; else bad "$label (exit $got, wanted $want)"; cat "$SCRATCH/last.out"; fi
}

repo="$SCRATCH/repo"; out="$SCRATCH/out"
mkdir -p "$repo/docs/sub" "$out"
printf 'alpha\n' > "$repo/docs/a.md"
printf 'beta\r\nwith CRLF\r\n' > "$repo/docs/sub/b.md"   # CRLF must survive byte for byte
printf 'gamma' > "$repo/docs/sub/c.txt"                  # no trailing newline
export COMMISSION_ROOT="$repo" PACK_STAMP=202601010000

expect "build succeeds"                 0 bash "$TOOL" build demo Eaprime1/target "$out" docs
pack="$out/202601010000-demo"
expect "pack has manifest, hashes, files" 0 test -f "$pack/manifest.json" -a -f "$pack/files.sha256" -a -d "$pack/files/docs"
expect "pack verifies with sha256sum -c" 0 bash -c "cd '$pack' && sha256sum -c --quiet files.sha256"
expect "copies are byte-exact (CRLF kept)" 0 cmp "$repo/docs/sub/b.md" "$pack/files/docs/sub/b.md"
expect "no-final-newline file is byte-exact" 0 cmp "$repo/docs/sub/c.txt" "$pack/files/docs/sub/c.txt"
expect "manifest is valid JSON with 3 files" 0 python3 -c "import json,sys; m=json.load(open('$pack/manifest.json')); sys.exit(0 if len(m['files'])==3 and m['kind']=='commission-pack' and m['to']['repo']=='Eaprime1/target' else 1)"
expect "shadow record kept in the sending repo" 0 test -f "$repo/atelier/commissions/packs/202601010000-demo/files.sha256" -a -f "$repo/atelier/commissions/packs/202601010000-demo/manifest.json"
expect "shadow record holds no copies of the files" 1 test -d "$repo/atelier/commissions/packs/202601010000-demo/files"
expect "sources untouched and still in place" 0 test -f "$repo/docs/a.md" -a -f "$repo/docs/sub/b.md" -a -f "$repo/docs/sub/c.txt"
expect "check: no drift right after build"  0 bash "$TOOL" check 202601010000-demo
expect "a pack is never overwritten"        1 bash "$TOOL" build demo Eaprime1/target "$out" docs
printf 'alpha edited\n' > "$repo/docs/a.md"
expect "check: drift is caught after a source edit" 1 bash "$TOOL" check 202601010000-demo
expect "the sent pack itself is unchanged by that edit" 0 bash -c "cd '$pack' && sha256sum -c --quiet files.sha256"
printf 'tamper\n' >> "$pack/files/docs/sub/c.txt"
expect "a tampered pack fails sha256sum -c" 1 bash -c "cd '$pack' && sha256sum -c --quiet files.sha256"
expect "bad slug is refused"                2 bash "$TOOL" build "Bad Slug" Eaprime1/target "$out" docs
expect "missing source is refused"          1 env PACK_STAMP=202601010001 bash "$TOOL" build other Eaprime1/target "$out" docs/nope.md
expect "check of an unknown pack is refused" 2 bash "$TOOL" check 999-none

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
