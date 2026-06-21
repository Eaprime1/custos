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
query="repo:${repo}+is:pr+is:merged+${mission}"
url="https://api.github.com/search/issues?q=${query}"

auth_header=()
if [ -n "${GITHUB_TOKEN:-}" ]; then
  auth_header=(-H "Authorization: Bearer ${GITHUB_TOKEN}")
fi

response="$(curl -s "${auth_header[@]}" "$url")"

if echo "$response" | jq -e '.message' >/dev/null 2>&1; then
  echo "error: GitHub API returned an error: $(echo "$response" | jq -r '.message')" >&2
  exit 1
fi

matching_prs="$(echo "$response" | jq -r '.items[]? | select((.body // "") + (.title // "") | test("Claude|ChatGPT|Gemini|Copilot"; "i")) | .html_url')"

if [ -n "$matching_prs" ]; then
  echo "complete: mission '${mission}' has a merged PR mentioning an AI faction member:"
  echo "$matching_prs"
  exit 0
fi

echo "incomplete: no merged PR found for mission '${mission}' mentioning an AI faction member" >&2
exit 1
