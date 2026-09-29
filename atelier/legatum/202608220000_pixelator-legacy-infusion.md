# LEGATUM

## Prima-clock
202608220000

## Date Range
202608190000 → 202608220800

## Title
Porting Custos's Chain of Custody onto Pixelator, and Closing Ten Branches

## Entities
eaprime1 + Claude (Sonnet 5, Claude Code CLI — Termux/PRoot podium
`pixel8a-unexusi`)

## Repos Touched
`eaprime1/pixelator`, `eaprime1/custos`

## The Thread

The session opened with infrastructure: fixing a malformed `gh auth`
command, granting the `workflow` scope, installing the GitHub App. Then a
new pinnacle folder — `~/unexusi` — got two fresh clones: `pixelator`
("needs work") and `custos` ("most up to date, where we manage the
project"). A diff between them showed pixelator had real code
(`pixelator_agent.py`, automation scripts) but none of custos's governance
scaffold — no `.claude` config, no PR pipeline, no chain-of-custody system
at all.

Porting that scaffold became the spine of the session. The `.claude`
config came across clean. The `.github` pipeline — thirteen workflows,
CODEOWNERS, PR template, Sovran labels — came across too, with the
claude-code-review prompt rewritten to describe pixelator's actual
Python/Termux shape instead of custos's markdown-and-lore one. A test PR
proved the pipeline ran green end to end, including the archivist
auto-filing a PR journey — the first confirmation the transplant had taken.

Then a second, unrelated PR (#2, an auto-generated "ECC bundle") surfaced a
real bug: my own governance-pipeline push and that PR's pre-existing
changes both touched `identity.json` and `ecc-tools.json`, and GitHub's
merge produced silently invalid JSON — no conflict markers, just duplicate
keys and an unclosed array. Fixing it meant also noticing the ECC bundle's
generated skill file was internally wrong (claimed relative imports and
`__all__` exports that don't exist anywhere in the actual codebase, which
uses flat absolute imports). A bot then reapplied the *original* broken
suggestions over top of the fix, mid-review — caught and overridden with a
merge favoring the corrected version. Copilot's review comments across
both fixed and yet-unfixed lines needed a second, careful pass before the
PR was actually clean.

The last third of the session was branch triage: ten stale branches sat on
pixelator, mostly `copilot/*` dead ends. Rather than deleting on sight,
each got checked for commits-ahead-of-main and whether its content was
already superseded. Five were genuinely dead (already merged, or literal
duplicates of bugs already fixed) and got deleted. Five had real,
additive, standalone value — a D12 dice feature with an incidental real
terraform.yml bug fix, a labeler category addition, doc fixes, a new
lexeme-report workflow added *alongside* (not replacing) existing
automation, per explicit direction — and got rebased onto current `main`
as fresh PRs, reviewed, and merged clean. The session closed by asking
what "finishing a conversation" should even mean here — and finding that
custos already had an answer built (`guides/conversation-finalization-
protocol.md`), which this document follows, extended one step further into
a new named form.

## Motion

- GitHub CLI re-authenticated with `workflow` scope; GitHub App installed
- `~/unexusi` pinnacle folder confirmed; `pixelator` and `custos` cloned
- `.claude/` config and 13-workflow `.github` governance pipeline ported
  from custos to pixelator, with `claude-code-review.yml`'s prompt and
  `CODEOWNERS` rewritten for pixelator's actual shape
- Governance pipeline proven green via a disposable test PR (#5), merged,
  archivist confirmed working (auto-filed `pr-journeys/`)
- PR #2 (pixelator ECC bundle): merge-artifact JSON corruption diagnosed
  and fixed in `identity.json`/`ecc-tools.json`; fabricated relative-
  import/`__all__`-export conventions replaced with the codebase's actual
  absolute-import/no-export-list style; `gpt-5.4` invalid model IDs,
  `@latest` MCP pins, and a `web_search` default addressed; a bot
  regression (literal re-application of pre-fix suggestions) caught and
  overridden; merged clean
- 11 stale pixelator branches triaged: 6 deleted outright (`Eaprime1-
  patch-1`, `prep-to-move-to-spectorium`, `copilot/review-content-skills-
  development`, `copilot/improve-pull-request-content`, `copilot/update-
  commit-message-format`, `copilot/repair-improve-pixelator-code`) as
  fully merged or literal duplicates of already-fixed bugs
- 5 branches rebased onto current `main` as new PRs (#6-#10): README/doc
  fixes, `.codex/AGENTS.md` web-search-opt-in wording, D12 dice insight
  feature (plus a genuine terraform.yml branch-ref quoting bug fixed along
  the way), labeler `automation` category + `actions/labeler@v5` bump, and
  a new additive document-lexeme-report workflow — all merged after
  addressing two more real Copilot findings (terraform.yml step ordering,
  a labeler.yml indentation style question)
- `guides/conversation-finalization-protocol.md` read and used as the base
  method; extended with a new named form (Legatum) and a new tracking
  system (Seed Weir) per direction given this turn

## Seeds Extracted

- **Branch-triage-before-closing pattern** — filed to Seed Weir
- **Automated JSON-validity CI check** — filed to Seed Weir
- **`docs/stale-branch-closure.md` never ported to pixelator** — filed to
  Seed Weir (also see Unresolved Threads)
- **Legatum** (this document's own form) and **Seed Weir** — both filed as
  concepts in this session, not held open

## Artifacts

- pixelator: PRs #2, #5, #6, #7, #8, #9, #10 — all merged
- pixelator: `.claude/`, full `.github/` governance pipeline, `.prime`,
  `tools/{prime_check,scan_lexeme}.sh`
- pixelator: `pr-journeys/` entries for PRs #2, #5, #6, #7, #8, #9, #10
  (archivist-generated)
- custos: `device/podiums.md` — `pixel8a-unexusi` podium entry
- custos: `atelier/legatum/README.md` — new concept definition + template
- custos: `atelier/legatum/202608220000_pixelator-legacy-infusion.md` —
  this document
- custos: `queue/seed-weir/README.md` — new tracking system, 3 entries
- custos: `turns/log.md`, `device/active.md`, `turns/AAR.md`,
  `prima-clock/registry.md` — session entries

## Unresolved Threads

- `docs/stale-branch-closure.md`'s merge-based closure procedure exists in
  custos but was not followed on pixelator (branches were hard-deleted,
  not closed via reviewed merge) and is not yet ported to pixelator at
  all — whether to port it is the Shepherd's call, not decided here
  (Seed Weir entry filed)
- The 6 hard-deleted pixelator branches have no closure-note record;
  recreating them retroactively just to write one wasn't judged worth it
  — named here rather than silently dropped
- Whether pixelator should eventually carry its own copy of custos's
  `docs/` more broadly (not just stale-branch-closure), now that it
  carries the `.github` pipeline that assumes those conventions
- Seed Weir's own scaling question (a "seed harvest" batch-review pass) —
  named as a future idea in the approved plan, not built

## Filed To

- Governance pipeline → `pixelator/.claude/`, `pixelator/.github/`
- Bug fixes → pixelator PR #2 (merged), PR #8/#9 review-comment fixes
  (merged)
- Resurrected branches → pixelator PRs #6-#10 (merged)
- Podium → `device/podiums.md`
- This session's narrative → this document
- Concept definition → `atelier/legatum/README.md`
- Process/skill seeds → `queue/seed-weir/README.md`
- Turn record → `turns/log.md`, `device/active.md`, `turns/AAR.md`,
  `prima-clock/registry.md`

## Custody Receipt

- Prima-clock: 202608220800
- Suit: ♦️ Diamond — seeds produced (Legatum, Seed Weir, 3 process seeds),
  structure forming
- Entities: eaprime1 + Claude (Sonnet 5)
- Chain of custody: CLOSED — all pixelator PRs merged, nothing left
  mid-flight; three seeds intentionally left OPEN in the Seed Weir, which
  is the correct terminal state for a seed, not an incomplete closing
