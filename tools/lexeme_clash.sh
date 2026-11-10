#!/usr/bin/env bash
# Clash check for a candidate Latin workflow word (and, optionally, its three-letter code).
# Read-only. Needs python3. No network.
#
#   bash tools/lexeme_clash.sh <word> [CODE]     check one candidate
#   bash tools/lexeme_clash.sh --list            print every word and code the check knows
#
# Exit 0: no hard clash (warnings may print). Exit 1: a hard clash. Exit 2: bad usage.
#
# What counts as a hard clash:
#   - the word is already an action, modifier, check-in cue, custos verb or addressee name
#     in .github/scripts/cue-parser.js
#   - the code is already in a table of .claude/skills/latin-workflow/SKILL.md (the code table or
#     the Proposed lexemes table, so a proposed code counts as taken), unless that row is for this
#     same word, or the code is the first three letters of a word the parser knows
# What only warns:
#   - the word starts with a conversation-ID prefix (exp, set, con, oth)
#   - the word is within two edits of a known word (a typo of one could be read as the other)
#   - the word already appears in the Latin docs (a mention is not a clash; check the sense)
#
# This tool does not judge Latin. Form, gender and meaning are for the owner and a Latin source;
# see docs/latin-lexeme-guide.md section 5.
set -euo pipefail
cd "$(dirname "$0")/.."

usage() {
  echo "usage: lexeme_clash.sh <word> [CODE] | --list" >&2
}

command -v python3 >/dev/null 2>&1 || { echo "python3 is not installed" >&2; exit 2; }

PARSER=".github/scripts/cue-parser.js"
SKILL=".claude/skills/latin-workflow/SKILL.md"
DOCS="docs/latin-workflow-v2.md docs/latin-workflow-glossary.md docs/latin-workflow-conversation-seed.md docs/latin-lexemes.txt $SKILL"

[ -f "$PARSER" ] || { echo "missing $PARSER (run from the custos repo)" >&2; exit 2; }
[ -f "$SKILL" ] || { echo "missing $SKILL (run from the custos repo)" >&2; exit 2; }

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  usage
  exit 2
fi

ARG1="$1"
ARG2="${2:-}"

python3 -I - "$PARSER" "$SKILL" "$ARG1" "$ARG2" $DOCS <<'PY'
import re
import sys

parser_path, skill_path, arg1, arg2 = sys.argv[1:5]
doc_paths = sys.argv[5:]

src = open(parser_path, encoding="utf-8").read()


def array(name):
    m = re.search(r"const\s+" + name + r"\s*=\s*\[(.*?)\];", src, re.S)
    if not m:
        sys.exit("cue-parser.js: cannot find " + name)
    return re.findall(r"'([^']+)'", m.group(1))


names = array("DEFAULT_NAMES")
actions = array("ACTIONS")
modifiers = array("MODIFIERS")
verbs = array("VERBS")
idm = re.search(r"ID_RE\s*=\s*/\^\(([a-z|]+)\)", src)
prefixes = idm.group(1).split("|") if idm else ["exp", "set", "con", "oth"]

known = {}
for kind, words in (("name", names), ("action", actions), ("modifier", modifiers), ("verb", verbs)):
    for w in words:
        known[w] = kind

skill = open(skill_path, encoding="utf-8").read()
# Codes sit in table cells of the skill: | REC | or | `REC` |, with an optional (provisional) note.
CELL_RE = re.compile(r"\|\s*`?([A-Z]{3})`?(?:\s*\([^)]*\))?\s*(?=\|)")
cell_codes = set()
code_lines = {}  # code -> table lines that hold it, so a word can recognise its own reserved code
for line in skill.splitlines():
    for c in CELL_RE.findall(line):
        cell_codes.add(c)
        code_lines.setdefault(c, []).append(line)
first3 = {w[:3].upper() for w, k in known.items() if k in ("action", "modifier")}
codes = cell_codes | first3

if arg1 == "--list":
    for kind in ("name", "action", "modifier", "verb"):
        print(kind + ":", " ".join(w for w, k in known.items() if k == kind))
    print("id prefixes:", " ".join(prefixes))
    print("codes:", " ".join(sorted(codes)))
    sys.exit(0)

word = arg1.lower()
code = arg2.upper()

if not re.fullmatch(r"[a-z][a-z-]{2,}", word):
    print("BAD  word must be letters (and hyphens), at least 3 long: " + repr(arg1))
    sys.exit(2)
if code and not re.fullmatch(r"[A-Z]{3}", code):
    print("BAD  code must be exactly three letters: " + repr(arg2))
    sys.exit(2)

hard = 0

if word in known:
    print("CLASH  '%s' is already a %s in %s" % (word, known[word], parser_path))
    hard = 1
else:
    print("ok     '%s' is not in the parser lists" % word)

if code:
    if code in cell_codes:
        if any(("`" + word + "`") in line for line in code_lines[code]):
            print("ok     code %s is already reserved for '%s' in %s" % (code, word, skill_path))
        else:
            print("CLASH  code %s is already in the code table of %s" % (code, skill_path))
            hard = 1
    elif code in first3:
        owner = [w for w, k in known.items() if k in ("action", "modifier") and w[:3].upper() == code]
        print("CLASH  code %s is the first three letters of %s" % (code, ", ".join(owner)))
        hard = 1
    else:
        print("ok     code %s is free" % code)
    if code.lower() in prefixes:
        print("WARN   code %s matches a conversation-ID prefix (%s)" % (code, ", ".join(prefixes)))

for p in prefixes:
    if word.startswith(p):
        print("WARN   '%s' starts with the conversation-ID prefix '%s'; its natural code would clash" % (word, p))


def lev(a, b):
    prev = list(range(len(b) + 1))
    for i, ca in enumerate(a, 1):
        cur = [i]
        for j, cb in enumerate(b, 1):
            cur.append(min(prev[j] + 1, cur[j - 1] + 1, prev[j - 1] + (ca != cb)))
        prev = cur
    return prev[-1]


near = sorted((lev(word, w), w) for w in known if w != word and lev(word, w) <= 2)
for d, w in near:
    print("WARN   '%s' is %d edit(s) from %s '%s'; a typo of one could be read as the other" % (word, d, known[w], w))

seen = []
pat = re.compile(r"\b" + re.escape(word) + r"\b", re.I)
for p in doc_paths:
    try:
        text = open(p, encoding="utf-8").read()
    except OSError:
        continue
    n = len(pat.findall(text))
    if n:
        seen.append("%s (%d)" % (p, n))
if seen:
    print("seen   '%s' already appears in: %s" % (word, "; ".join(seen)))
    print("       A mention is not a clash. Check that the sense is the one you mean.")

sys.exit(hard)
PY
