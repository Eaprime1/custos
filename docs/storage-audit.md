# Storage audit: all active devices
Started 202610231421 (Claude, on mandelbrot, the Ubuntu laptop). Branch: `claude/storage-audit-202610231421`.
Focus now: **mandelbrot (Ubuntu laptop)**. mulberry (Windows) and the others follow the same steps.

## How to find this work again
- **This branch** in custos (`git switch claude/storage-audit-202610231421`).
- **The conversation:** Claude Code session `59e3b2f2-8dd6-459a-9d7e-a7f0974bd77b`, started in `/home/sauron`.
  Resume it with `cd ~ && claude --resume 59e3b2f2-8dd6-459a-9d7e-a7f0974bd77b`. Sessions are stored per directory, so it is listed only from `~`.
- **Handoff:** `~/.eric/continuum/shadow/2026-10-23-handoff-unexusiam.md`
- **Raw reports** (local only, not committed): `~/unexusiam/fond/local/manifests/`

## Two kinds of excess, treated differently
| Kind | What it is | Treatment |
|---|---|---|
| **Runaway** | a process that keeps writing (sync client, cache, vhdx, loop) | find it, stop it, clean up after it |
| **Duplicates** | the same content kept in several places by past work | **carbonization process** (Eric's; to be linked here). Not deleted outright. |

## mandelbrot (Ubuntu) findings, 202610230034–202610231421
- Disk: 411 GB, **52 % used**. No sync client, cron job or background scan running. **No runaway found.**
- `~/mandelbrot` = 118 GB, 115 GB of it in `domos/`:
  - `domos/spaces/maw` 79 GB, which includes `large_files/gdrive_today` **45 GB** (a Google Drive download dated 2026-01, static)
  - `domos/primal/pryme` 35 GB: `vetting` 18 GB, which contains `.cache` / `.local` / `.var` (looks like a copied home directory), `Q` 8.6 GB, `gravity` 6.3 GB
- Duplicate files >1 MB: **1,046 groups, ~10.8 GB in extra copies**, mostly in `mandelbrot/domos/spaces` and `domos/primal`. These are candidates for carbonization.
- Takeout check: no `locate` database here; a full-disk scan for `takeout*`, `gdrive*`, `My Drive`, `*.tgz` and split `*-0*.zip` is running → `takeout_scan_<ts>.tsv`.

## mulberry (Windows) findings
- Disk nearly full. Eric found Google sync folders and **Takeout files**.
- Read-only check: `~/unexusiam/usus/powershell/disk-check.ps1` (DriveFS cache, mirror folder, WSL/Docker vhdx, update cache, files >1 GB written in the last 14 days).

## Plan
1. mandelbrot: read the takeout scan; list the Takeout archives and Drive downloads with size and date.
2. For each Takeout/Drive copy, decide: is the content still in Drive? If yes, the local copy is a duplicate, so it goes to carbonization; if no, it is the only copy, so keep it and record it.
3. Run the duplicate list through carbonization (define the steps here once Eric links the process).
4. Repeat 1–3 on mulberry, then the Pixel 8 and any other active devices.
5. Prevent it from recurring: one documented sync mode per device (stream, not mirror); Takeout downloads land in one known folder and are processed, not left behind.

## Open
- [ ] Link / describe the carbonization process
- [ ] Which devices count as active (mandelbrot, mulberry, Pixel 8, …)?
