# Repo Hygiene Routine

*Give Copilot (or any agent) a routine to check all repos for required
documents; create them if missing; route anything that isn't a simple fix
into a future-forward queue.*

Item #20 of the 20260828 Marrowing of Hope brainstorm intake — see
`the_marrowing_of_hope_dev_reference_202608281.md`, Cluster D.

## The Principle

Every repo that carries custos's `.github` governance pipeline (CODEOWNERS,
PR template, Sovran labels, the workflow set) implicitly promises the same
baseline of supporting documents. When a repo is missing one, it's not
usually a decision — it's just that nobody checked. This routine makes
checking cheap and repeatable instead of something only happens when a
human notices by accident (as it did on `pixelator`, see
`atelier/legatum/202608220000_pixelator-legacy-infusion.md`).

## The Manifest

`tools/repo_hygiene_manifest.txt` — one required path per line. This is
custos's own governance baseline, since custos is where the `.github`
pipeline and its supporting conventions originate. Edit the manifest as
the baseline evolves; the checker just reads whatever's there.

## The Routine

1. **Run the check** — `bash tools/repo_hygiene_check.sh <path-to-repo>`.
   Report-only, non-destructive. Never writes to the target repo.
2. **For each `[MISSING]` item, ask: is this a simple copy?**
   - **Yes** (a template or script with no repo-specific content —
     `docs/stale-branch-closure.md` is the model case: same process,
     any repo) → port it directly, commit, done.
   - **No** (needs real judgment — `CODEOWNERS` usernames, a `LICENSE`
     choice, a `CLAUDE.md` tailored to that repo's actual environment) →
     file it instead of guessing.
3. **Filing a non-simple finding** — one entry per repo at
   `queue/future-forward/<repo-name>.md` (create the file if it doesn't
   exist yet for that repo). List each item needing judgment, one line
   each, with enough context that whoever picks it up doesn't have to
   re-run the check to know what's being asked.
4. **Status** — same discipline as the Seed Weir and Artesium Weir:
   `OPEN` until judged, `RESOLVED` with a link once handled. Don't delete
   rows.

## Relationship to Other Systems

| System | Relationship |
|---|---|
| `docs/stale-branch-closure.md` | The first real finding this routine surfaced (missing from `pixelator`) — also the clearest example of a "simple copy" finding |
| `queue/seed-weir/` | Process/skill ideas in general; this routine is one now-built example of a Seed Weir idea becoming a real tool |
| `queue/future-forward/` | Where this routine's judgment-required findings land |
| `tools/scan_lexeme.sh`, `tools/scan_provenance.sh` | Sibling advisory scan tools — same "report, don't block" posture |

## What This Is Not

- Not a CI gate — nothing fails a build. It's a manual (or agent-run)
  check, same posture as `scan_lexeme.sh`.
- Not a document generator — it never invents content for a missing file.
  Simple copies get ported by a human or agent who read the source
  document; everything else gets filed for a real decision.
