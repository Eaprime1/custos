# Commission: build the mulberry repo (first pass)

**Prima-clock:** 202611010547 UTC · **Suit:** ♣️ Club, working copy · **Plank:** 1/3 (germ) · **Status:** OPEN
**For:** GitHub Copilot (a possible navigo for this). **Jira:** KAN-12 (<https://primalshadow.atlassian.net/browse/KAN-12>).
**Drafted by:** navigo_claude with Eric, from two sources, named below. Proposal until the Shepherd rules.

This page is written to be pasted whole into a Copilot task. The part between the two rules is the commission.

---

## Mission

Make the first commit set of a new repository, `Eaprime1/mulberry`, for the Shepherd's Windows laptop. Keep it small.
It holds a README, a device identity file, a `.gitignore` and an empty `queue/artesian/` folder. Nothing else.

**Before you start (the Shepherd does these, not you):**

1. Creates the empty repo `Eaprime1/mulberry` with `main` as the default branch.
2. Chooses private or public. The source plan recommends **private** while device facts are being sorted. Build the same either way.
3. Pastes this commission into the task.

**Build exactly this, on a branch, as one draft pull request:**

1. `README.md`: what Mulberry is, in plain words, using only the facts in the identity block below. Say it is the
   Shepherd's Windows laptop and the source of the artesian queue. Say that custos (<https://github.com/Eaprime1/custos>)
   is the origin repo and where the shared working vocabulary lives. Do not describe hardware or network details.
2. `device/identity.md`: the block below, unchanged, inside a fenced code block, with a one-line heading.
3. `.gitignore`: Windows and editor noise only (for example `Thumbs.db`, `Desktop.ini`, `.vscode/`, `*.log`).
4. `queue/artesian/.gitkeep`: an empty file, so the folder exists.

Identity block (copied from the `mulberry` entry in custos `device/podiums.md`; do not add fields):

```text
podium_id:       mulberry
name:            "Mulberry (Windows laptop)"
type:            device
platform:        windows
parent:          ""
role:            "Shepherd's Windows laptop — source of the artesian queue (queue/artesian/)"
status:          active
```

**Hard limits.** Never write a serial number, an IP address, a MAC address or a username into any file or the PR text.
The Shepherd keeps device addresses out of git on purpose. Do not copy anything from the old folder
`C:\Users\...\mulberry`; existing content arrives later, through the repo, by the Shepherd's direction.
Do not add workflows, `.claude/` or `.github/`. Do not merge, seal or label your own PR.

## Files to read first

In custos (public, <https://github.com/Eaprime1/custos>), on `main`:

- `prima.yaml`
- `CLAUDE.md`
- `device/podiums.md` (the `mulberry` and `mulberry-vscode-navigo` entries) and `device/PODIUM_SCHEMA.md`
- `device/CONVERSATION_LAUNCH_TEMPLATE.md`
- `.shepherd/seats.md` (the mulberry and mulberrytree rows)
- `.copilot/missions.md` (how Copilot's missions are tracked here)

If you cannot open custos from where you work, say so in the PR and ask the Shepherd to paste the file.

## Completion check

Run from the root of the mulberry repo. It must print `COMPLETE`.

```bash
test -f README.md && test -f .gitignore && test -f device/identity.md && test -f queue/artesian/.gitkeep \
  && grep -q '^podium_id:       mulberry$' device/identity.md \
  && ! grep -rEn '([0-9]{1,3}\.){3}[0-9]{1,3}|([0-9A-Fa-f]{2}[:-]){5}[0-9A-Fa-f]{2}' README.md device queue .gitignore \
  && echo COMPLETE || echo "NOT YET"
```

The check proves the files exist and that no address-like text is in them. It cannot prove there is no serial
number or username, so say in the PR that you looked for both and found none.

## PR format

Open one **draft** pull request into `main`. Use these sections, in this order:

```markdown
## Intent
<one sentence: what this turn set out to do>

## What Arrived
<one sentence: what actually happened>

## Resonance
<one word or phrase>

---

## Ethics Check
- [ ] Entity agency respected (human, AI, concept — all contributors credited)
- [ ] Free to fork, remix, echo — no hidden ownership
- [ ] No unintended harm surface in tools or scripts
- [ ] No serial number, IP address, MAC address or username in any file
```

End the PR with a line saying which AI wrote it. Do not request payment of any kind.

---

## Sources (where this came from)

1. NEXUS-1 comment by `mulberrytree-claude-code`, 2026-10-29, section 3, "Proposed setup plan for a new `mulberry` repo"
   (<https://primalshadow.atlassian.net/browse/NEXUS-1>). Its seven steps are used here.
2. `.shepherd/seats.md` (custos `main`): mulberry becomes the repo; `mulberrytree` is a non-repo pinnacle folder
   that holds a clean clone of it.

## Held for the Shepherd (not part of this commission)

- **Private or public.** Recommended private; his call.
- **Governance port.** The source plan would later port custos's `.claude` config and `.github` pipeline, "after custos
  confirms which parts apply." Not decided, so not built here.
- **Existing content** in the old laptop folder, and how it reaches the repo.
- **Device address.** Written in an older number system and kept out of git. Its own mission (NEXUS-5 item 5).
- **Podium registry.** The `mulberry` entry stays in custos `device/podiums.md`; a change there is a separate reviewed PR.
- **Who builds it.** Copilot is "a possible navigo for it" (KAN-12). The Shepherd decides.
