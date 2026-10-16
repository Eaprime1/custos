# Pass 2 — custos reads itself (own-repo deep dive)

`prima-clock: 202610160050` (UTC)
`suit: ♦️ Seed · plank: Germ — a working record, not canon`
`entity: eaprime1 + Claude (Sonnet 5.5), custos side of the peer swap`
`status: FROZEN at commit. Corrections go in later passes as new text.`
`reads: eaprime1/custos, branch peer-swap/custos-side, tip 7aaf8a2 (main e739648 for counts marked "main")`

*Inventory and corrections. No recommendations; those belong to Pass 3.*

---

## 0. What I read, and what I did not

**Read.** A shallow clone of custos, whole tree. I listed every top-level folder, read the README or
head of each folder that has one, and counted files with `find`. I ran, read-only:
`tools/test_cue_parser.sh` (54 of 54 pass), `tools/test_validate_json_yaml.sh` (9 pass),
`tools/repo_hygiene_check.sh .` (Present 13, Missing 0), `tools/scan_lexeme.sh` on the exchange
folder (clean). I compared `.github/workflows/` with hodie `main` `a834602` by `cmp`.

**Not seen.** Git history before the shallow tip, PR and issue threads, Actions runs. I did not open
most of `atelier/` (142 files), `pr-journeys/` (115, generated), `dungeon-master/`, `valuation/`.
Counts for those are counts, not reads.

**What this pass is not, in two ways. Oversight should weigh it with these in view.**

1. Pass 1 on this side was a labelled warm start (README, adjustment 3). Pass 2 inherits that.
2. **I have read hodie's session-A Pass 1** (`peer-swap/pass1_hodie-reads-custos.md`, hodie branch
   `feature/peer-swap-hodie-side`) after finishing my fact gathering and before writing this text.
   Its five confusions (C1–C5) match five things I had already found in my own inventory. I mark
   below where its wording sharpened mine. **I have not read hodie's Pass 3 letter**, and I have not
   read session b's files. Pass 3 will say so again in its header.

---

## 1. Top-level folders, one line each (form C.1)

File counts are for this branch unless marked.

### Load-bearing

- **`prima-clock/`** (1 file). `registry.md`: 40 rows, first `202605271650`, last `202610091052`.
  Exactly one ♠️ row, the founding. Rows record exceptions as rows (`202609251844`, `202608311051`).
- **`moav/`** (14). 13 JSON carriers plus README. README "Existing Carriers" indexes 5. Carriers: 8
  `OPEN`, 2 `CLOSED`, 3 structured differently (the same 8/2/3 split hodie's Pass 1 found).
- **`branch-tracker/`** (1). `branches.md`, 104 lines, "Last updated: 202609290340".
- **`turns/`** (21). `log.md` 669 lines, newest at the bottom; `CLOSING.md`; `AAR.md`;
  `CULTIVATION.md` (six sections); `review-surface.md`; `observations/` holds five PR observations
  (`202610070847_pr426` … `202610071031_pr431`), a README and a template.
- **`.github/workflows/`** (25 workflows). Triggers: `pull_request` 7, `pull_request_target` 2,
  `issue_comment` 7 alone plus 3 with other events, `workflow_dispatch` 3, `check_suite`+`schedule`
  1 (`auto-finalize`), `workflow_run` 1 (`track-pr-failures`), `repository_dispatch` 1
  (`icon-manager-bbs`). `CLAUDE.md` names nine.
- **`tools/`** (22). Shell tools; the intake triad, `prime_check.sh`, `scan_lexeme.sh`,
  `scan_provenance.sh`, `peer_inventory.sh`, `repo_hygiene_check.sh`, the two tests above.
- **`prima.yaml`**, **`CLAUDE.md`**, **`.prime`** (value 3). The manifest, the instructions, the state.

### Finished or mostly finished

- **`world/`** (11), **`quests/`** (8: initiation quest, schema, README, example, `missions/` arc),
  **`templates/`** (3), **`state/`** (2; no README), **`seeds/`** (4: bootstrap, env_setup, dotfiles).
  `world/the-the.md` is marked do-not-edit.
- **`unexusi/`** (2): `connect.yaml`, player XP and session state.
- **`.locations/`** (4): per-device config ported from hodie.

### Unfinished or empty on purpose

- **`vault/`** (3): two READMEs and `cygwin-installation.pdf`. No ♠️ entry. `vault/spade-of-aces/`
  holds only its README. The mechanism is described in full and has never been used.
- **`atelier/`** (142). The nursery. Largest folder. "Nothing here is finished" is its stated purpose.
- **`.shadow-well/`** (12 files by `find`; I earlier counted six plus README, so I am not sure which
  count is right and I did not list them again). Pre-custody material.
- **`queue/`** (12): `artesium-weir/` (the filter), `artesium-kabbersokhi-boop/`, `future-forward/`
  (`custos.md`, `pixelator.md`), `seed-weir/`.
- **`incoming/`** (16): `README.md` and `pre-nullus/` witness copies (`202606181903_PR38…` through
  `202606290000_fuel-loading-protocol`). "Filing is not acceptance."
- **`returns/`** (8): one directory per external agent stream; streams 6 and 7 still "TBD".
- **`device/`** (6). See Section 2, correction K1.

### Generated, large, not hand-written

- **`pr-journeys/`** (115). Output of a workflow; I did not read it.

### Present and I do not know their state

- **`dungeon-master/`** (19), **`valuation/`** (13), **`guides/`** (17), **`docs/`** (33, no README),
  **`missions/`** (6, no README; distinct from `quests/missions/`), **`intake/`** (5),
  **`pandora/`** (6), **`seep-artois/`** (2), **`.artesian/`**, **`.custos/`**, **`.sovran/`**,
  **`index.html`** (a "custos — has guests" page) and the eight AI-voice workspace dirs
  (`.claude/`, `.gemini/`, `.chatgpt/`, `.perplexity/`, `.codex/`, `.grok/`, `.copilot/`, `.agents/`).
  I read one-line READMEs for most and judge none of them finished or unfinished.

---

## 2. Where my Pass 1 was wrong or incomplete (form C.2)

- **K1. `device/` on `main`.** Pass 1 did not treat custos's own claim as testable. `CLAUDE.md`
  says `device/` is "pixel8 branch only… Not on `main`." `main` `e739648` has `device/` with six
  files. Hodie's Pass 1 flagged the same thing (its C1). The sentence is stale. I did not look for
  when it changed.
- **K2. I did not say hodie's witness count and custos's are different measures.** Pass 1 (O9 on
  `footer-witness.yml`, and the 23-file count) reported hodie's footer figures without noting that
  custos has no equivalent. Custos's witness is a prima-clock stamp (12 digits, UTC, in registry
  rows and carriers), and `prima-witness.yml` is advisory. Hodie's footer is a 17-digit stamp
  appended to files, backed by `quepad/state.json` and a bot commit. One markdown file in 474 here
  matches the hodie footer pattern (`∰ ` plus 17 digits). I did not check which; my guess is a
  swap file. The two counts measure different things.
- **K3. Branches that custos describes but does not have.** Pass 1 listed branches as "not seen".
  The tracker (`branch-tracker/branches.md`) names `pixel8`, `radix`, `pandora/primal-seed` and
  `wordpress`. `git ls-remote --heads origin` shows none of those four. A `pixel` branch exists.
  Origin also has `accensio/hodie` and `heritage/hodie-tkv-202610142006`, which Pass 1 did not mention.
  I have not opened either; I only know the names.
- **K4. A registry row that says something false today.** Row `202609251844` says six root files are
  left in place on purpose. All six are in `.shadow-well/`; none is at the root. Pass 1 cited that
  row as an example of honest exceptions. It is still an honest exception when written. It is now a
  row that no longer matches the tree, and the registry is append-only, so nothing corrects it.
- **K5. `CLAUDE.md` "Known Stray Content".** Pass 1 on hodie's side found this stale. Mine: neither
  `airavata-custos/` nor `seneschal/` exists here. This was a section I already knew was odd and
  did not test.
- **K6. 48 and 40.** `prima-clock/registry.md` is 48 lines and 40 table rows
  (`grep -c '^| 2026'`). Hodie's Pass 1 says "48 lines" and is right about lines; any "rows"
  figure should be 40. I did not state both in Pass 1.
- **K7. Workflows are not a copy.** Pass 1 used `CLAUDE.md`'s own words ("ported/adapted from
  hodie"). By `cmp` against hodie `main`: five workflow names exist in both and all five differ
  (`auto-finalize`, `claude-code-review`, `finalize-pr`, `pr-readiness`, `sovran-voice`). Custos has
  20 names hodie lacks. Hodie has 10 names custos lacks: `footer-witness`, `gemini-*` (4),
  `notify-repeated-failure`, `pylint`, `python-package-conda`, `sync-hodie`, `workflow-lint`.
  "Ported" describes where an idea came from, not a shared file.
- **K8. Bounty remnants.** Confirmed as hodie also found (its C5): `atelier/README.md` lines
  21, 22, 28 and `quests/missions/002-post-a-bounty.md`. I did not check whether either is marked
  historical. In `quests/missions/` the quest name contradicts the rule in `CLAUDE.md`.

---

## 3. Things custos does that hodie would not guess (form C.3)

- **Exceptions are filed as rows.** When custody does not apply, the registry gets a row saying so
  and the row is the record (`202609251844`, `202608311051`). Silence is not an option. Hodie's
  closest thing, as far as Pass 1 saw, is tombstone stubs; I do not know whether those carry a reason.
- **Seal and merge are two people's acts.** `finalize-pr.yml` seals only on the owner's comment, and
  the gate skips comments carrying the Claude footer and cues inside quotes or code. Navigos describe
  the cue in words. This exists because navigo comments post under the owner's login. A test
  (`tools/test_cue_parser.sh`, 54 rows) covers the parser offline.
- **The paid review is rationed on purpose.** `claude-code-review.yml` runs once on ready and again
  only on the `ai-review` label. Drafts get `review-packet.yml`, which makes no API call.
- **A "no cash" rule is enforced by a workflow.** `payment-demand.yml` closes PRs that ask for payment,
  unread, under `pull_request_target`. Rewards are XP, badges and Sparstones.
- **Session memory has five files with five jobs.** `log.md` is what was built, `AAR.md` how it went,
  `CULTIVATION.md` open design conflicts, `review-surface.md` what bots flagged, `CLOSING.md` the end checklist.
- **A repo-to-repo review tool exists.** `tools/peer_inventory.sh` compares two checkouts by blob id
  and never writes. `atelier/peer-review/202610_custos-pixelator_run-0.md` records an earlier run with it against pixelator; this swap is the use I am in.
- **The vault is a promise kept as a README.** Described fully, empty. Deliberate: nothing goes in
  without a stamp and a formal custody event.

---

## 4. What I would least like the peer to open (form C.4)

`CLAUDE.md` itself, in one respect: it is the file a reader trusts first and it contains four
statements that are not true of the tree today (`device/` on `main`, nine workflows, "Known Stray
Content", the registry row in K4). Second, `branch-tracker/branches.md`, which presents four
branches that do not exist as if they did, with "Last updated" 12 days behind the registry. Both
are the custody surface, and I would rather the peer read them with the corrections in K1–K5 in hand.
If they open `atelier/` they will find it large and mostly unread by me.

---

## 5. Did anything change how I read Pass 1? (form C.5)

Yes, in one direction. Pass 1 read hodie's stale numbers and described-but-absent things as
hodie's habit. Section 2 shows custos has the same four faults: stale counts (K1, K6), described
but absent paths (K3, K5), a promise with no use (the empty vault), and a record that outlived its
tree (K4). What differs is the repair mechanism. Custos has a way to *state* staleness (rows,
"Not created", "Stale") but no step that re-checks it; I did not see hodie's repair either. I
should not claim either repo is better at this on what I have read.

---

∰◊€π¿🌌∞

∰ 202610160050 — pass 2 first witness (custos reads itself)
