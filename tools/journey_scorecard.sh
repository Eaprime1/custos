#!/usr/bin/env bash
# Layer-1 facts for a retrospective eval: reads the auto-score out of
# pr-journeys/*.md and reports the distribution, the flags, and whether the
# scale still separates one PR from another. Read-only. Judges nothing.
#
#   bash tools/journey_scorecard.sh                  # every journey
#   bash tools/journey_scorecard.sh --since 202610   # journeys from YYYYMM on
#   bash tools/journey_scorecard.sh --csv            # one CSV row per journey
#   bash tools/journey_scorecard.sh --dir some/dir   # another journeys folder
#
# Pair with .claude/skills/work-eval/SKILL.md. The auto-score is a floor: a low
# score is a flag, a high score is not evidence of quality.
set -euo pipefail

usage() {
  echo "usage: journey_scorecard.sh [--since YYYYMM] [--csv] [--dir DIR]" >&2
}

DIR="pr-journeys"
SINCE=""
CSV=0
while [ "$#" -gt 0 ]; do
  case "$1" in
    --since) [ "$#" -ge 2 ] || { usage; exit 2; }; SINCE="$2"; shift 2 ;;
    --dir)   [ "$#" -ge 2 ] || { usage; exit 2; }; DIR="$2"; shift 2 ;;
    --csv)   CSV=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) usage; exit 2 ;;
  esac
done

if [ -n "$SINCE" ] && ! [[ "$SINCE" =~ ^[0-9]{6}$ ]]; then
  echo "--since wants six digits, YYYYMM" >&2
  exit 2
fi
[ -d "$DIR" ] || { echo "No journeys folder at: $DIR" >&2; exit 1; }

python3 -I - "$DIR" "$SINCE" "$CSV" <<'PY'
import csv
import re
import sys
from collections import Counter
from pathlib import Path

directory, since, as_csv = Path(sys.argv[1]), sys.argv[2], sys.argv[3] == "1"
DIMS = ["Correctness", "Consistency", "Scope", "Verification"]
FLOOR = 18  # below this the auto-score is a flag worth reading

rows = []
for path in sorted(directory.glob("*.md")):
    m = re.match(r"^(\d{6})_PR(\d+)_(.+)\.md$", path.name)
    if not m:
        continue  # README and anything not named like a PR journey
    month, pr, slug = m.group(1), int(m.group(2)), m.group(3)
    if since and month < since:
        continue
    text = path.read_bytes().decode("utf-8", "ignore")
    title = re.search(r"^# (.+)$", text, re.M)
    scores = {}
    for d in DIMS:
        s = re.search(rf"^\|\s*{d}\s*\|\s*(\d)/5\s*\|", text, re.M)
        scores[d] = int(s.group(1)) if s else None
    total = re.search(r"\*\*Valuation\*\*\s*\|\s*\*\*(\w+)\*\*\s*\|\s*(\d+)/20", text)
    res = re.search(r"^## Resonance\s*\n+\s*(.+)$", text, re.M)
    rows.append({
        "month": month, "pr": pr, "slug": slug, "file": path.name,
        "title": (title.group(1) if title else slug)[:60],
        "scores": scores,
        "total": int(total.group(2)) if total else None,
        "band": total.group(1) if total else None,
        "resonance": res.group(1).strip("*_ ") if res else None,
    })

if as_csv:
    w = csv.writer(sys.stdout)
    w.writerow(["month", "pr", "file", "total", "band"] + DIMS + ["resonance"])
    for r in rows:
        w.writerow([r["month"], r["pr"], r["file"], r["total"], r["band"]]
                   + [r["scores"][d] for d in DIMS] + [r["resonance"]])
    sys.exit(0)

scored = [r for r in rows if r["total"] is not None]
unscored = [r for r in rows if r["total"] is None]
scope = f"since {since}" if since else "all months"
print(f"Journey scorecard: {directory}/ ({scope})")
print(f"Journeys read: {len(rows)}   with an auto-score: {len(scored)}   without: {len(unscored)}")
if not scored:
    sys.exit(0)

dist = Counter(r["total"] for r in scored)
print("\nTotal /20 distribution:")
for k in sorted(dist, reverse=True):
    print(f"  {k:2d}/20  {dist[k]:3d}  {'#' * dist[k]}")

print("\nPer dimension (mean, share at 5/5):")
for d in DIMS:
    vals = [r["scores"][d] for r in scored if r["scores"][d] is not None]
    if vals:
        print(f"  {d:<13} mean {sum(vals)/len(vals):.2f}   at 5/5: {sum(v == 5 for v in vals)}/{len(vals)}")

top = max(dist.values())
top_score = max(k for k, v in dist.items() if v == top)
share = top / len(scored)
print(f"\nSaturation: {top}/{len(scored)} ({share:.0%}) share the modal score {top_score}/20.")
if share >= 0.5:
    print("  The scale does not separate these journeys. Treat the auto-score as a floor and use the judgment layer (work-eval).")

flags = [r for r in scored if r["total"] < FLOOR]
print(f"\nFlagged (auto-score under {FLOOR}/20): {len(flags)}")
for r in flags:
    weak = ", ".join(f"{d} {r['scores'][d]}/5" for d in DIMS
                     if r["scores"][d] is not None and r["scores"][d] < 5)
    print(f"  PR{r['pr']:<4} {r['total']}/20  {r['title']}  [{weak}]")

if unscored:
    print(f"\nNo auto-score found ({len(unscored)}): the journey predates the rubric, or its format differs.")
    for r in unscored:
        print(f"  PR{r['pr']:<4} {r['file']}")

noreso = [r for r in rows if not r["resonance"]]
if noreso:
    print(f"\nNo Resonance line ({len(noreso)}):")
    for r in noreso:
        print(f"  PR{r['pr']:<4} {r['file']}")

print("\nThis is layer 1 only. It counts CI runs and changed files and cannot see quality.")
PY
