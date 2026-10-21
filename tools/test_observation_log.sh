#!/usr/bin/env bash
# Run the offline tests for the observation log. Needs node, python3 and PyYAML; no network.
#   1. the rules in .github/scripts/observation-log.js
#   2. the real github-script step in .github/workflows/observation-log.yml, run against a
#      stubbed GitHub (the step text is read from the workflow, so the test cannot drift)
set -euo pipefail
cd "$(dirname "$0")/.."
command -v node >/dev/null 2>&1 || { echo "node is not installed" >&2; exit 2; }
command -v python3 >/dev/null 2>&1 || { echo "python3 is not installed" >&2; exit 2; }

node tools/test_observation_log.js

step="$(mktemp)"
trap 'rm -f "$step"' EXIT
python3 - "$step" <<'PY'
import sys, yaml
d = yaml.safe_load(open('.github/workflows/observation-log.yml'))
steps = [s for j in d['jobs'].values() for s in j['steps'] if s.get('uses', '').startswith('actions/github-script')]
assert len(steps) == 1, f'expected one github-script step, found {len(steps)}'
open(sys.argv[1], 'w').write(steps[0]['with']['script'])
PY
node tools/test_observation_log_workflow.js < "$step"
