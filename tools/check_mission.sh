#!/usr/bin/env bash
# Verify a mission was completed by checking for a merged PR mentioning an AI faction member.
# Usage: tools/check_mission.sh <mission-name>
# Example: tools/check_mission.sh ai-commissioning

set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  echo "error: jq is required but not installed" >&2
  exit 1
fi

mission="${1:-}"
if [ -z "$mission" ]; then
  echo "usage: $0 <mission-name>" >&2
  echo "example: $0 ai-commissioning" >&2
  exit 1
fi

repo="eaprime1/custos"
query="repo:${repo}+is:pr+is:merged+Claude+OR+ChatGPT+OR+Gemini+OR+Copilot"
url="https://api.github.com/search/issues?q=${query}"

auth_header=()
if [ -n "${GITHUB_TOKEN:-}" ]; then
  auth_header=(-H "Authorization: Bearer ${GITHUB_TOKEN}")
fi

response="$(curl -s "${auth_header[@]}" "$url")"
total_count="$(echo "$response" | jq -r '.total_count // 0')"

if [ "$total_count" -gt 0 ]; then
  echo "complete: mission '${mission}' has a merged PR mentioning an AI faction member"
  exit 0
fi

echo "incomplete: no merged PR found for mission '${mission}' mentioning an AI faction member" >&2
exit 1
