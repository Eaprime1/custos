#!/usr/bin/env python3
"""
Workflow Expression Injection Checker
∰◊€π¿🌌∞

Scans GitHub Actions workflow files for expression injection:
${{ github.* }} or similar expressions used directly inside run: shell steps.

This is the pattern Codacy/Semgrep flags as HIGH security (CWE-20).
Fix: move ${{ }} expressions to the step's env: block, then reference
as $ENV_VAR in the shell script.

Usage:
  python3 tools/check_workflow_injection.py [--check DIR] [FILE ...]

Exits 0 if clean, 1 if injection patterns found.

Adopted from hodie (scripts/check_workflow_injection.py) in the peer swap; split into small
functions so the lint tools stay quiet, and fixed so it reads run: | and run: >- blocks and "- run:"
steps (the original matched only a single-line run: command).
"""

import argparse
import re
import sys
from pathlib import Path
from typing import List, Optional, Tuple

# Matches any ${{ ... }} expression (GitHub Actions template syntax)
EXPRESSION_RE = re.compile(r"\$\{\{[^}]+\}\}")

# run: key variants. A step may start with "- " (a list item). The block form is a block scalar:
# run: | or run: >- (optional chomping sign or indentation digit). Test it before the inline form,
# because "run: |" also fits the inline pattern.
RUN_BLOCK_RE = re.compile(r"^\s*(?:-\s+)?(?P<key>run:)\s*[|>][-+]?\d?\s*$")
RUN_INLINE_RE = re.compile(r"^\s*(?:-\s+)?(?P<key>run:)\s+(?P<text>.+)$")


Issue = Tuple[int, str, str]
State = Tuple[bool, int]  # (inside a run: block, column of the run: key)


def _expression_issue(lineno: int, raw: str, context: str, text: str) -> Optional[Issue]:
    """An issue for this line if *text* holds a ${{ }} expression."""
    if EXPRESSION_RE.search(text):
        return (lineno, raw.rstrip(), context)
    return None


def _classify(raw: str) -> Tuple[str, int, str]:
    """('block' | 'inline' | 'other', column of the run: key, inline command text)."""
    block = RUN_BLOCK_RE.match(raw)
    if block:
        return "block", block.start("key"), ""
    inline = RUN_INLINE_RE.match(raw)
    if inline:
        return "inline", inline.start("key"), inline.group("text")
    return "other", 0, ""


def _inside(raw: str, run_col: int) -> bool:
    """A blank line, or one indented deeper than the run: key, belongs to the block."""
    return not raw.strip() or len(raw) - len(raw.lstrip()) > run_col


def _step(lineno: int, raw: str, state: State) -> Tuple[Optional[Issue], State]:
    """Read one line. Returns the issue found on it (if any) and the next state."""
    in_block, run_col = state
    kind, col, text = _classify(raw)
    if kind == "block":
        return None, (True, col)
    if kind == "inline":
        return _expression_issue(lineno, raw, "run: (inline)", text), (False, run_col)
    if in_block and _inside(raw, run_col):
        return _expression_issue(lineno, raw, "run: block", raw), state
    return None, (False, run_col)  # a line at or before the key's column ends the block


def scan_lines(lines: List[str]) -> List[Issue]:
    """Scan workflow text for expression injection in run: steps."""
    issues: List[Issue] = []
    state: State = (False, 0)
    for lineno, raw in enumerate(lines, 1):
        issue, state = _step(lineno, raw, state)
        if issue:
            issues.append(issue)
    return issues


def check_file(path: Path) -> List[Issue]:
    """
    Scan *path* for expression injection in run: steps.

    Returns a list of (line_number, line_text, context) tuples.
    """
    try:
        lines = path.read_text(encoding="utf-8").splitlines()
    except OSError as exc:
        print(f"  ⚠ Could not read {path}: {exc}", file=sys.stderr)
        return []
    return scan_lines(lines)


def build_parser() -> argparse.ArgumentParser:
    """The command line."""
    parser = argparse.ArgumentParser(
        description="Check GitHub Actions workflow files for expression injection.",
        epilog=(
            "Expression injection: using ${{ github.* }} directly inside run: steps.\n"
            "Fix: assign to env: block, reference as $ENV_VAR in shell.\n"
            "\n"
            "Example fix:\n"
            "  env:\n"
            "    GH_EVENT: ${{ github.event_name }}\n"
            "  run: |\n"
            "    echo $GH_EVENT\n"
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--check", metavar="DIR", default=None,
                        help="Directory to scan for *.yml files (e.g. .github/workflows/)")
    parser.add_argument("files", nargs="*", type=Path, help="Specific workflow files to check")
    return parser


def report(path: Path, issues: List[Issue]) -> None:
    """Print what was found in one file."""
    print(f"\n🚩 {path}  ({len(issues)} issue(s))")
    for lineno, line, context in issues:
        print(f"   Line {lineno} [{context}]: {line.strip()}")
    print()
    print(
        "   Fix: move each ${{ }} expression to the step's env: block,\n"
        "   then reference it as $ENV_VAR in the run: script."
    )


def scan_all(targets: List[Path]) -> int:
    """Check each file, print what is found, return the number of issues."""
    total_issues = 0
    for path in targets:
        issues = check_file(path)
        if issues:
            total_issues += len(issues)
            report(path, issues)
    return total_issues


def main() -> int:
    """Check the named files and the --check directory. Exit 1 if anything is found."""
    args = build_parser().parse_args()
    targets: List[Path] = list(args.files)
    if args.check:
        targets += sorted(Path(args.check).glob("*.yml"))
    if not targets:
        print("No files to check. Pass --check DIR or file paths.")
        return 0

    total_issues = scan_all(targets)
    if total_issues == 0:
        print(f"✅ {len(targets)} workflow file(s) checked — no expression injection found.")
        return 0
    print(f"\n⛔ {total_issues} expression injection issue(s) across {len(targets)} file(s).")
    return 1


if __name__ == "__main__":
    sys.exit(main())

# ∰⏱🃏 20260724120000000
