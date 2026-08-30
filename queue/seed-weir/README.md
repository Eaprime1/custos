# Seed Weir

*The filter. One side: loose ideas surfacing mid-work. The other: seeds
someone can actually pick up.*

Modeled directly on [`queue/artesium-weir/`](../artesium-weir/README.md) —
same shape of problem, different raw material. Artesium filters PDFs into
chain of custody. This filters **process and skill ideas** — the kind that
turn up in an AAR's `seeds:` field, a conversation, or a review pass —
into something trackable instead of a line buried in a paragraph.

## What Crosses Here

Ideas that aren't the work itself, but were noticed *while* doing the
work: a reusable pattern, a gap in tooling, a process that should exist
but doesn't yet. Small enough that they don't warrant a full atelier
concept or a bounty/issue on their own — yet real enough to lose if they
aren't written down.

Not every seed needs to sprout. `OPEN` is a valid permanent state, same as
the Conversation Arc protocol's `OPEN-reason`.

## The Routine

1. **Notice** — while working, name the idea instead of just doing it and
   moving on. A seed is: *"here's a pattern/gap worth fixing, later or by
   someone else."*
2. **Log** — add one row to the table below. Keep it to one line; if it
   needs more, link out to the fuller writeup (an AAR entry, a Legatum, a
   Conversation Arc) rather than expanding the table.
3. **Status** —
   - `OPEN` — logged, not yet acted on
   - `CLAIMED` — someone's actively working it
   - `PLANTED` — became real work; link the result (issue, PR, doc)
   - `COMPOSTED` — decided against; one-line reason kept for the record,
     not deleted
4. **Update, don't rewrite** — same append-only discipline as
   `device/podiums.md`: change `Status` and add a result link in place;
   never delete a row.

No scan tool exists for this yet (unlike `tools/artesian_scan.sh` for
PDFs) — seeds don't scatter across the filesystem the way raw PDF prints
do; they get named directly by whoever has them. If that stops being true,
building one is itself a seed.

## Log

| Seed | Origin | Status | Notes |
|---|---|---|---|
| Branch-triage-before-closing pattern: check commits-ahead-of-main and whether content is already superseded before deleting or merging a stale branch | `atelier/legatum/202608220000_pixelator-legacy-infusion.md` | OPEN | Separated 6 dead branches from 5 resurrectable ones across 11 candidates on pixelator; worth writing up as a reusable procedure, possibly extending `docs/stale-branch-closure.md` |
| Automated JSON/YAML-validity check as a governance-pipeline CI step | `atelier/legatum/202608220000_pixelator-legacy-infusion.md` | PLANTED | Built `tools/validate_json_yaml.sh` + `.github/workflows/validate-json-yaml.yml` (blocking, unlike advisory `scan_lexeme.sh`) in custos, added to `tools/repo_hygiene_manifest.txt`, and ported directly to pixelator and prima (Prima-voiced workflow name). Testing it against custos surfaced a real design gap it had to learn from immediately: `.claude/homunculus/instincts/inherited/*.yaml` is a deliberate hybrid frontmatter+Markdown format, not pure YAML — excluded explicitly rather than left as a false positive. |
| `docs/stale-branch-closure.md` (merge-based branch closure procedure) exists in custos but was never ported to pixelator, and wasn't followed there this session (branches were hard-deleted instead) | `atelier/legatum/202608220000_pixelator-legacy-infusion.md` | PLANTED | Ported to `pixelator/docs/stale-branch-closure.md` (`40ecc93`), via the new Repo Hygiene Routine (`tools/repo_hygiene_check.sh`, `docs/repo-hygiene-routine.md`) — item #20 of the Marrowing of Hope brainstorm intake, navigo15 turn 1. The broader "port custos's `docs/` wholesale" question stays with the Shepherd — this routine surfaces gaps one at a time rather than forcing a bulk decision. |
