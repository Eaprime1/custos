#!/usr/bin/env bash
# Reads .prime and reports current prime progression state.
set -euo pipefail

PRIMES=(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47)
CURRENT=$(cat .prime 2>/dev/null | tr -d '[:space:]')

if [[ -z "$CURRENT" ]]; then
  echo "No .prime file found."
  echo "Run: echo '3' > .prime"
  exit 1
fi

echo "Prime state: $CURRENT"

for i in "${!PRIMES[@]}"; do
  if [[ "${PRIMES[$i]}" == "$CURRENT" ]]; then
    NEXT_IDX=$((i + 1))
    if [[ $NEXT_IDX -lt ${#PRIMES[@]} ]]; then
      echo "Next prime:  ${PRIMES[$NEXT_IDX]}"
    else
      echo "Next prime:  beyond sequence — define your own"
    fi
    exit 0
  fi
done

echo "State $CURRENT not in standard sequence — custom progression active."
