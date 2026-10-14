#!/usr/bin/env python3
"""Tests for Atrium discords 21, 22, 29 and 31 against a text export.

Usage: python3 -I test_sanctum_export.py PATH_TO_EXPORT

The export is read as received and never modified. The script prints facts
(tab layout, word counts, hash, seed fields and fragment hits) and decides
nothing: every ruling stays with the human.

Assumptions, each visible in the output:
  - Tabs are marked by lines of the form "# Tab N".
  - Seed tabs hold a JSON array, possibly with markdown backslash escapes.
"""
import hashlib
import json
import re
import sys
from collections import Counter

SEED_TABS = (2, 10)


def collapse(text):
    """Remove markdown escapes, then collapse every whitespace run to one space."""
    return re.sub(r"\s+", " ", text.replace("\\_", "_").replace("\\", "")).strip()


def load_seed_tab(body):
    cleaned = body.replace("\\_", "_").replace("\\[", "[").replace("\\]", "]")
    return json.loads(cleaned)


def main(path):
    raw = open(path, "rb").read()
    text = raw.decode("utf-8")
    lines = text.split("\n")

    print("file:", path)
    print("bytes:", len(raw), "lines:", len(lines), "crlf:", raw.count(b"\r\n"))
    print("sha256:", hashlib.sha256(raw).hexdigest())

    # Discord 29: word counts depend on the method
    ws_split = len(text.split())
    ascii_split = len(re.split(r"[ \t\n\r\f\v]+", text.strip()))
    symbols_only = [t for t in text.split()
                    if not t.isascii() and not re.search(r"[A-Za-z0-9]", t)]
    print("words, whitespace split:", ws_split, "| ascii whitespace split:", ascii_split)
    print("non-ASCII tokens with no letters or digits (plain wc -w in a byte locale skips these):",
          len(symbols_only), Counter(symbols_only).most_common(4))
    for m in re.finditer(r"(\d+)[- ]page", text):
        print("page mention:", m.group(0), "at line", text.count("\n", 0, m.start()) + 1)

    # Discord 21: tab layout and speakers
    heads = [(i + 1, int(m.group(1))) for i, l in enumerate(lines)
             for m in [re.match(r"^# Tab (\d+)\s*$", l)] if m]
    bounds = [h[0] for h in heads] + [len(lines) + 1]
    tabs = {}
    print("tab headers at lines:", [h[0] for h in heads])
    for k, (line_no, n) in enumerate(heads):
        body = "\n".join(lines[line_no:bounds[k + 1] - 1])
        tabs[n] = body
        print("  Tab %d: line %d, %d lines, %d words" % (n, line_no, bounds[k + 1] - line_no - 1, len(body.split())))
    if 1 in tabs:
        # the body starts on the line after the tab header
        quoted = [(heads[0][0] + 1 + tabs[1].count("\n", 0, m.start()), m.group(0).strip()[:70])
                  for m in re.finditer(r"^[ \t]*\\?>.*$", tabs[1], re.M)]
        print("Tab 1 quoted lines (check each by eye for speaker):", quoted)

    # Discord 22: seed fields across the two seed tabs
    seeds = {}
    for n in SEED_TABS:
        if n in tabs:
            try:
                seeds[n] = load_seed_tab(tabs[n])
            except ValueError as err:
                print("Tab %d: seed JSON did not parse: %s" % (n, err))
    if len(seeds) == 2:
        a, b = (set(seeds[n][0]) for n in SEED_TABS)
        print("fields only in Tab %d: %s | only in Tab %d: %s" %
              (SEED_TABS[0], sorted(a - b), SEED_TABS[1], sorted(b - a)))

    # Discord 31: a verbatim test must skip the seed tabs, or it matches itself
    outside = " ".join(collapse(b) for n, b in tabs.items() if n not in SEED_TABS)
    whole = collapse(text)
    for n, items in seeds.items():
        for s in items:
            frag = collapse(s["source_fragment"])
            print("Tab %d %-22s whole file: %d | outside seed tabs exact case: %d | ignoring case: %d" %
                  (n, s["seed_name"], whole.count(frag), outside.count(frag),
                   outside.lower().count(frag.lower())))


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    main(sys.argv[1])
