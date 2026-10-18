# Hand-offs: where other conversations can pick up

`suit: ♦️ Diamond — working note`
`prima-clock: 202610172355`
`status: written at the Shepherd's word (chat, after 202610172338 UTC) so the open threads from custos PR #463 can be carried into other conversations.`

Each item below says what is decided, what to read first, the first step, and a check that
passes or fails (a bash command, run from the repo root). Every item starts from
`prima.yaml` and `CLAUDE.md`. The PR template for any resulting PR has these sections:
Intent, What Arrived, Resonance, Ethics Check (and Sense Check, What Door).

Nothing here is ordered. The Shepherd decides what goes first, and whether anything goes at all.

---

## A. Send the Armarium pack (this conversation's focus)

- **Decided:** the mechanism is a commission pack (`COMMISSION-PACK.md`). The first pack is built; the shadow record is in `atelier/commissions/packs/`.
- **Not done:** the send. It is the Shepherd's word. The send is a copy of the pack folder into the Armarium repo under `commissions/<id>/`, then `bash tools/verify.sh` there.
- **Read first:** `COMMISSION-PACK.md`, then the manifest in `atelier/commissions/packs/`.
- **Check:** `bash tools/test_commission_pack.sh` (17 cases) and `bash tools/commission_pack.sh check <pack-id>` (no drift).

## B. Autographum (a section for handwritten origins)

- **Decided:** a seed, `atelier/autographum-seed.md`. Not started, by the Shepherd's choice. A few handwritten origins are needed for the Primal launch.
- **Not decided:** where the scans are, how many, whether any needs privacy review first, what extra fields a scan needs.
- **First step (when the Shepherd says start):** find and list the scans (path, count, size). No copying yet.
- **Check:** `test -f atelier/autographum-seed.md && bash tools/scan_lexeme.sh atelier/autographum-seed.md`

## C. Exemplar (a rare character and high-value lexeme)

- **Decided:** a seed, `atelier/exemplar-seed.md`, in the Shepherd's words. Cautions: rarity, no absolutes.
- **Not decided:** one lexeme, a character, or both; any trigger or scoring link.
- **First step:** read `world/` for any figure it overlaps with, and `.github/ISSUE_TEMPLATE/lexeme.yml` if it is to become a lexeme. File nothing without the Shepherd.
- **Check:** `test -f atelier/exemplar-seed.md && bash tools/scan_lexeme.sh atelier/exemplar-seed.md`

## D. Matenadaran and Valthraman

- **Decided:** a seed, `atelier/matenadaran-seed.md`. The Gemini export that defines "Valthraman" is in the Weir (`queue/artesium-weir/valthraman-gemini-export.md`, origin kept beside it).
- **Careful:** the export is a summary, second-hand. The source it names is a Drive file, "Valthraman Synergy Json.pdf", not yet seen in the repo.
- **First step:** the Shepherd decides whether that Drive file comes here. Then read it and decide what "peer" means with the real text.
- **Check:** `sha256sum queue/artesium-weir/valthraman-gemini-export-202610172338.original.md` should print `2d9580943292c7dfe173f587fb7b5330cdb79f02037c9e65617e7611ac55b9fa`.

## E. The scanner review (DeepSource and Codacy)

- **Decided (the Shepherd, 202610172244 UTC):** both need review and improvement; Codacy already has its own conversation. They are contributors that push Unexusi toward the best level it can manage.
- **What was checked, 202610172355 UTC (all from the repo and PR output; the dashboards were not visible):**
  - `.deepsource.toml` holds only `[[analyzers]] name = "secrets" enabled = false`. DeepSource ran a Secrets analyzer on PR #463 anyway (it reported passed). This was already noted at `docs/plans/202610070939-cue-sigil-and-living-observation-plan.md` lines 179 to 180 as a question for DeepSource's own settings. So the repo file is not what decides it. Someone with the DeepSource dashboard open can say what does.
  - `.codacy.yml` excludes many folders from analysis, among them `atelier/`, `docs/`, `moav/`, `queue/`, `turns/`, `prima-clock/` and `.shadow-well/`. So prose and records, which are most of what custos changes, are not scanned by Codacy. Whether to bring some back is a question for the Codacy conversation (the `rehearsal-room` Codacy skill is built for trying that safely).
  - DeepSource's Shell analyzer is the one that reads `tools/*.sh`. It passed on the final heads of PR #463, which graded A.
- **Not decided:** which analyzers the private Armarium should have at all. A secrets scan matters there most, because origins can hold a pasted key (`ARMARIUM.md` section 3).
- **First step:** list, for each tool, what it scans today and what it skips, then propose the smallest change that adds coverage without noise.
- **Check:** `python3 -c "import tomllib;print(tomllib.load(open('.deepsource.toml','rb')))"` and `grep -c '\*\*' .codacy.yml` give the current starting facts.

## F. Armarium: detection and the Genizah

- **Decided:** protection cannot be enforced on a private repo without a plan upgrade; the Armarium declares the policy in `RULES.md` (armarium `40e744a`). The Genizah is a proposal (`ARMARIUM.md` section 6).
- **Not built:** a check that runs `tools/verify.sh` on every push (a GitHub Actions workflow in the Armarium repo), and a `genizah/` folder with one example retirement note.
- **First step:** the workflow, since it turns "declared" into "noticed". Keep it report-only like `final-oversight.yml`; it must not need a secret.
- **Check:** `bash tools/verify.sh` in the Armarium repo exits 0 when nothing is wrong and 1 when a hash or a pack has been changed.

## G. The time form

- **Decided:** observation files carry `Started:` beside the finish stamp, a marked guess when needed, never a made-up exact stamp (`turns/observations/observation-template.md`).
- **Not decided:** whether the Shepherd's own comments should carry a start–finish form such as `shepherd 1510–1524`. Their stamps are Pacific local time unless marked, so a converted time must say so.
- **Check:** `grep -n "Started:" turns/observations/observation-template.md`
