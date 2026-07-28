#!/bin/bash
# seneschal_audit.sh
# The Seneschal's daily walk across the Custos estate.

# High-Contrast Terminal Colors for dark mode readability
C_HEAD='\033[1;37m'   # Bright White
C_TAG='\033[1;36m'    # Cyan
C_WARN='\033[1;33m'   # Yellow
C_PATH='\033[0;32m'   # Green
C_NONE='\033[0m'      # Reset

echo -e "${C_HEAD}========================================${C_NONE}"
echo -e "${C_HEAD}  THE SENESCHAL : ESTATE AUDIT LEDGER   ${C_NONE}"
echo -e "${C_HEAD}========================================${C_NONE}"
echo ""

# 1. THE PERCEIVE PHASE: Scan the Pool (seep-artois)
echo -e "${C_TAG}[ THE POOL ] - Checking seep-artois/ for drawn fragments...${C_NONE}"
ARTESIAN_COUNT=$(find seep-artois/ -maxdepth 1 -mindepth 1 ! -name 'README.md' 2>/dev/null | wc -l)
if [ "$ARTESIAN_COUNT" -gt 0 ]; then
    echo -e "  ${C_WARN}Found $ARTESIAN_COUNT raw fragment(s) waiting for the Artesian.${C_NONE}"
    for file in seep-artois/*; do
        if [[ "$file" != *"README.md"* ]]; then
            echo -e "  - ${C_PATH}$file${C_NONE}"
        fi
    done
else
    echo -e "  The pool is quiet. No new fragments."
fi
echo ""

# 2. THE WEIGH PHASE: Scan the Workshop (atelier)
echo -e "${C_TAG}[ THE WORKSHOP ] - Checking atelier/ for unnamed concepts...${C_NONE}"
ATELIER_COUNT=$(find atelier/ -maxdepth 1 -mindepth 1 ! -name 'README.md' ! -name 'concordance.md' 2>/dev/null | wc -l)
if [ "$ATELIER_COUNT" -gt 0 ]; then
    echo -e "  ${C_WARN}Found $ATELIER_COUNT untended seed(s) on the benches.${C_NONE}"
    for file in atelier/*; do
        if [[ "$file" != *"README.md"* ]] && [[ "$file" != *"concordance.md"* ]]; then
            echo -e "  - ${C_PATH}$file${C_NONE}"
        fi
    done
else
    echo -e "  The workshop benches are clear."
fi
echo ""

# 3. THE PRESENT PHASE: Global Tag Search
echo -e "${C_TAG}[ THE FIELD ] - Scanning for active operational tags...${C_NONE}"

# Look for specific markers across the repo
echo -e "  ${C_HEAD}Draft Commissions [COMMISSION-DRAFT]:${C_NONE}"
grep -rn --exclude-dir={.git,.claude,.gemini} '.' -e '\[COMMISSION-DRAFT\]' | while read -r line ; do
    printf "  - %b%s%b\n" "${C_PATH}" "$line" "${C_NONE}"
done

echo -e "  ${C_HEAD}Items Needing Tending [NEEDS-TENDING]:${C_NONE}"
grep -rn --exclude-dir={.git,.claude,.gemini} '.' -e '\[NEEDS-TENDING\]' | while read -r line ; do
    printf "  - %b%s%b\n" "${C_PATH}" "$line" "${C_NONE}"
done
echo ""

echo -e "${C_HEAD}========================================${C_NONE}"
echo -e "  Audit complete. Awaiting Shepherd's mark."
echo -e "${C_HEAD}========================================${C_NONE}"
