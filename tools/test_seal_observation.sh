#!/usr/bin/env bash
# Offline test of the observation rule in the seal. Needs node, python3 and PyYAML.
set -euo pipefail
cd "$(dirname "$0")/.."
command -v node >/dev/null 2>&1 || { echo "node is not installed" >&2; exit 2; }
script="$(mktemp)"
trap 'rm -f "$script"' EXIT
python3 - "$script" <<'PY'
import sys
import yaml

workflow = yaml.safe_load(open(".github/workflows/finalize-pr.yml"))
steps = next(iter(workflow["jobs"].values()))["steps"]
step = next(s for s in steps if s.get("name") == "Finalize PR")
open(sys.argv[1], "w").write(step["with"]["script"])
PY
node tools/test_seal_observation.js "$script"
