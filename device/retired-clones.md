# Retired Clones

Prima-clock: 202610180031

<!-- append only — never edit past entries except status -->

Clones that have completed their mission. A device collects copies of the
same repo over time: practice runs, old iterations, a second checkout for
one experiment. Once everything a copy holds is on GitHub, the copy has done
its work and can leave the device. This file records each one, so it can be
removed without anyone later wondering where it went or what it held.

## The test for "mission complete"

A clone retires only when every commit, stash and file in it exists on
GitHub, checked by content (blob hash) against all of the remote's history,
not just the tip of `main`. Content that exists only on the device is first
packed into a git bundle (exact commits, restorable with `git fetch
<bundle>`) or a tar of loose files, stored in the archive path below with a
`SHA256SUMS` file, and listed in the entry.

Before removal, also check that nothing on the device points at the path:
shell aliases, cron, systemd timers, tool configs.

## Schema

```
---
date:      YYYY-MM-DD
podium:    [podium_id from device/podiums.md]
path:      [clone path on that podium]
repo:      [owner/name, branch checked out, HEAD]
canonical: [the clone that stays, or "GitHub only"]
local-only: [what existed only here, and where it was archived — or "none"]
status:    [verified — awaiting removal | removed YYYY-MM-DD]
---
```

## Log

Archive for this pass: `~/.eric/archive/retired-clones/202610180031/` on
primehaven. No cron, systemd timer, alias or tool config points at any path
below (checked 2026-10-18; Fleet Commander's sync roots are `~/unexusi/`
and `~/Q/runexusiam/`).

---
date:      2026-10-18
podium:    primehaven
path:      ~/repo/custos
repo:      eaprime1/custos, claude/shepherd-framework-20260603, db8fa86
canonical: ~/unexusi/custos
local-only: The shepherd framework iteration of 2026-06-03 (3 commits). Every
           file is on GitHub except the first README.md of that iteration,
           which was later rewritten on main. All 3 commits are in
           repo-custos.bundle.
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/hodie
repo:      eaprime1/hodie, main, 003d9f8
canonical: ~/unexusi/hodie
local-only: Branch feature/migration-unexusi-hodie, commit 1411aa1 ("Auto-sync
           via Fleet Commander"). Its one file not on GitHub is
           mission/Installed GitHub App - ECC Tools.pdf. The commit is in
           hodie.bundle.
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/mandelbrot/workshop/hodie
repo:      eaprime1/hodie, main, 824dba9
canonical: ~/unexusi/hodie
local-only: Commit 824dba9 (removes a plexus submodule pointer; no file content),
           an uncommitted CLAUDE.md edit and .vscode/settings.json. The commit
           is in workshop-hodie.bundle, the CLAUDE.md edit in
           workshop-hodie.CLAUDE.md.diff and .vscode/ in
           workshop-hodie.untracked.tgz.
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/mandelbrot/repo/hodie
repo:      eaprime1/hodie, radix, 003d9f8
canonical: ~/unexusi/hodie
local-only: none
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/repo/fleet-commander
repo:      eaprime1/fleet-commander, main, 74fcdbd
canonical: ~/fleet-commander (the `fleet` and `fleet-classic` aliases run from it)
local-only: none
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/repo/MANDELBROT
repo:      eaprime1/MANDELBROT, main, 8ba5441
canonical: ~/unexusi/mandelbrot (and the working tree ~/mandelbrot)
local-only: none
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/mandelbrot/repo/unexusi
repo:      eaprime1/unexusi, radix, fce9f40
canonical: ~/repo/UNEXUSI
local-only: none
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/mandelbrot/repo/spectorium
repo:      eaprime1/spectorium, radix, 5b1b8c1
canonical: ~/repo/Spectorium
local-only: none
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/mandelbrot/repo/tiezerk
repo:      eaprime1/tiezerk, main, 2aec6c6
canonical: ~/unexusi/tiezerk
local-only: none
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/radix
repo:      eaprime1/radix, main, 9ee55da (78 commits behind GitHub)
canonical: ~/primehaven/repo/radix
local-only: ORIGIN - NotebookLM.html, a Gemini image, a Gemini JSON, and a
           second image saved over README.md by mistake. All four went to
           ~/primehaven/vetting/radix/ and then to eaprime1/maw as arrival
           origin-shadow-seed (they need upgrading before radix).
status:    verified — awaiting removal
---

---
date:      2026-10-18
podium:    primehaven
path:      ~/mandelbrot/repo/radix
repo:      eaprime1/radix, main, f5cfbf0 (59 commits behind GitHub)
canonical: ~/primehaven/repo/radix
local-only: txt_Building Radix Repo Seed Document.txt, Platform Podium Radix
           Guide v0.1.docx, €_Germ_Bank_Factor_Log.xlsx. All three went to
           ~/primehaven/vetting/radix/ and then to eaprime1/maw with the arrival
           above.
status:    verified — awaiting removal
---

Removal on primehaven is done by `~/primehaven/vetting/remove-retired-clones.sh`,
which re-checks each clone and skips any that changed since this audit.
`~/repo/custos` was moved to `~/repo/_old/custos` before removal.

## Not yet retired

Checked in the same pass. These still hold work that exists only on
primehaven, so their mission is not complete:

- `~/fleet-commander` — the canonical clone. It has unpushed commit 08d7718
  (`fleet_modern.py`, which the `fleet` alias runs, plus README-MODERN.md,
  README-RESTORED.md, COMPLETION_SUMMARY.md and a workflow) and an untracked
  RESTORATION_PLAN.md. Five files are now in draft PR eaprime1/fleet-commander
  #1; the workflow is held until it works.
- `~/repo/_old/fleet-commander` and `~/repo/_old/MANDELBROT` — clean, but
  `~/Q/runexusiam/` symlinks (used by `fleet`) still point at them.
- `~/mandelbrot/domos/runexusiam` — not a clone: a local repo, never on GitHub
  (5 Redundancy Ranger commits, `journey/`, `🧁🌊Sargasso Sea©6®`). Copied with
  a history bundle to `~/primehaven/vetting/runexusiam-domos/` to find homes.
- `~/mandelbrot/repo/pandora` — the only clone of eaprime1/pandora; an
  untracked `.queue/`.
- `~/mandelbrot` — active working tree for eaprime1/MANDELBROT, branch
  feature/surf-browser-entity, with 15 unpushed commits and uncommitted work.
