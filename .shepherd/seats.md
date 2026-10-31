# The three seats

**Prima-clock:** 202610310146 UTC (the Shepherd's comment came at 202610301812 Pacific, about 01:12 UTC)
**Suit:** ♣️ Club, working copy
**Plank:** germ

*Moved here from the Jira liminal (`liminal-jira-202610310011.md`) at the Shepherd's word, so the liminal
holds only what belongs to the Jira journey. The first version of that text stays in the history of PR 471,
commit `7ff5910`. Everything below is the Shepherd's plan as I read it. Nothing has been created or
renamed yet.*

*This repo may be read by people other than the Shepherd, so it holds names and shapes, not personal data.*

## The three seats and their folders

| Seat | Machine | Folder plan |
|---|---|---|
| mulberry | Windows laptop | `~/mulberry` becomes the mulberry repo, once it is ready. A new `~/mulberrytree` holds a clean clone of mulberry. |
| unexusiam | Ubuntu laptop (the name changed) | A folder `~/unexusiam`, a peer of `~/mulberrytree`. It holds the repos `mandelbrot` and one more (see below). |
| primapixel | Pixel 8a phone | A new `~/primapixel`, the device domos. A clean clone of the repo `pixelator` goes into that structure. |

**mulberrytree.** It is not a repo itself. Its domos are anchored to, and act as, The Mulberry Tree at
the corner of Suxen and Nexus.
*My reading, please correct it:* "no repo" means the folder has no repo at its root, while the clean clone
of mulberry sits inside it as a subfolder. A clone is itself a repo, so the two statements only agree
that way.

**primapixel and a private repo.** The phone will also need a **private** repo, because biometrics will be
gathered from it. That waits for the phone upgrade. Nothing about it goes in this repo or any public one:
this page records only that a private repo is planned.

## What NEXUS-1 already settles (read 202610310211 UTC)

The device conversations have been recording their own setup in Jira (NEXUS-1, "Custos Oversight Space",
in the unexusi project). Read there, not copied here:

- **mulberrytree** is a non-repo pinnacle folder; only fresh clones go inside it. This confirms my reading above.
- **unexusiam** is the Ubuntu laptop's pinnacle folder, and `primehaven` lives inside it as one identity, not
  a split GUI and terminal one (the Shepherd's guidance of 2026-10-29).
- The unexusiam layout in use has four tiers: `fons/`, `culina/`, `fond/`, `usus/`. Fresh clones of mandelbrot
  (in `fons/`) and custos (in `culina/`) are in place. Where mandelbrot belongs is open, because it is treated as
  play from a first perspective and does not map cleanly onto those tiers.
- Pinnacle folders are domos. A device's `device.md` belongs in its own pinnacle folder.
- Raw addresses stay out of Jira and git.

## Does the unexusiam plan fit? (checked 202610310146 UTC, against the mandelbrot repo on GitHub)

The Shepherd's words: in unexusiam the repos are `mandelbrot` and, as a change, "the not gui side
terminals will start as part of primal."

- **Fits:** `terminals/` in mandelbrot holds shell scripts only: `hello.sh` and six `aspect_0N_*.sh` files. That
  is the non-GUI side. `domos/primal/` exists, with `prime/` and a file `pryme` in it. NEXUS-1 says the
  terminal side is `primehaven`, opened later.
- **Fits:** mandelbrot's README says it was formerly PrimeHaven, the name this repo gives the Ubuntu laptop.
- **Not found:** anything in `domos/primal/` or `terminals/` that starts the terminals. I do not know what
  "start as part of primal" is meant to run, so I cannot say it fits.
- **Small mismatch:** `terminals/CHEATSHEET.md` was written for Termux on the Pixel 8a. It lists
  `t1` to `t5`, with `t5` twice, and no `t6`, while `aspect_06_distribution.sh` exists.

## The repo still says the old names

`.locations/`, `seeds/env_setup.sh`, CLAUDE.md and the device docs call the seats `primehaven`, `mulberry`
and `pixel8`. Renaming them touches the Deck Master paths (`device/`), so it is a separate reviewed change.
Not started.

## Open

1. ~~Is the clone-inside-a-non-repo-folder reading of mulberrytree right?~~ Yes, per NEXUS-1.
2. What does "start as part of primal" run, and from where?
3. The second repo for unexusiam, if there is one.
4. When to rename `primehaven` and `pixel8` in the repo, now that NEXUS-1 shows the device conversations
   already use `mulberrytree`, `unexusiam` and `primapixel`.
