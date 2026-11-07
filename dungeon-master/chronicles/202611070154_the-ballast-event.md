# CHRONICLE

**Chronicle № 0003** *(numbered by the Shepherd, 2026-11-06)*

## Prima-clock
202611070154 → 202611070450 (UTC)

## Arc Title
The Ballast Event

## Real System Event
On the `mulberry` podium (Dell Latitude 5420, Windows 11), the system drive C: had reached
**6% free (13.4 GB of 237.7 GB)**. A computer health checkup (Claude Code, Desktop Commander
`computer-health-check` skill) measured the cause instead of guessing: about **50 GB** of
partial Google Takeout export zips and stale Drive upload temp files in the old working directory
`~\mulberry`, a large mail export (about 10 GB), caches, and a stalled 1.5 GB download.

Nothing unique was lost. The Takeout zips were an *incomplete* export set (several parts of each
set never downloaded) and the data still lives in Google. The export was requested to be redone a
few sets at a time, not today.

### What was done
- Deep read-only disk scan; findings recorded in `~\Documents\health-checkup-tasks.md`.
- Deleted: all Takeout zips and the extracted sample, `.tmp.driveupload` and `.tmp.drivedownload`,
  a stalled `.crdownload`, two old installers, and Chrome's 4 GB on-device model (re-downloadable,
  holds no conversations).
- Hibernation turned off by the Shepherd (`powercfg /hibernate off`, 6.3 GB).
- Startup trimmed reversibly (five auto-start entries).
- Checked Google Drive (streaming, ~0.2 GB local) and OneDrive (Files On-Demand, ~0.02 GB local):
  both already light and kept.
- Kept on purpose, pending lost-and-found: one 1 GB ROOT-format data file (likely part of a
  seed, possibly Monarch). A large mail export (about 10 GB) kept: likely belongs to an unfinished
  gravity-seed conversation set.

## The reasoning (why this is an event, not chores)
The device is the first basic need of the practice: no device, no communication. Electricity is
the second. A device that cannot hold one more file cannot carry the work. The same condition
(excess and in-transit content piling up unnoticed) crosses every device the Shepherd uses, so this
first event is written for the **triad**: `mulberrytree` (this Windows laptop), `unexusiam`
(Ubuntu laptop), `primapixel` (Pixel 8a). Transfer-only files (downloaded in order to be uploaded
elsewhere) had no home, no log and no end-of-life, so they became ballast: weight carried with no
purpose.

## Measurements (first event, not yet anchored)
| Metric | Value |
|---|---|
| Content weight reclaimed (measured C: free space) | **13.4 GB → 64.7 GB free (6% → 27%), +51.3 GB** |
| Of that, deleted content | about 46 GB (Takeout 40.3, Chrome model 4.1, other 1.9) |
| Hibernation file | 6.3 GB (Shepherd) |
| Elapsed time | about 3 hours, one working session |
| Effort | one conversation, roughly 35 tool calls, 1 owner-run update step, 2 owner-run admin steps |
| Electricity | not measured. Seed for later: usage as a basic-need metric alongside size. |

Exactness is the point of a first event. Later events can be compared against these numbers.

## Characters Involved
- **Custos** — chain of custody: every deletion was approved before it ran, and the data was
  confirmed to exist elsewhere first.
- **Fodere** — dug the weight out (scan, delete).
- **Agnoscere** — named what each heavy thing was (Takeout, ROOT file, on-device model).

## Seeds Found
- **Transfer / excess handling** — peer of sparklization, pixelization, fractalization. Likely a branch
  of oversight/ethics *weights and measures* and the *exchange system*. The `portofentry` repo
  handles in and out of the main stream; `mulberrytree` is the device passthrough folder.
- **Carbonization** — peer of **beasis** (a duplicate hub, on another device). Condense many copies
  into one copy that carries the unique traits of each: file id, metadata, unique content, awards, history.
- **Lost and found** — a place for files with a clear mark but unknown purpose (first candidate:
  a 1 GB ROOT-format data file).
- **Device-to-device channel outside the repo** — a store-and-forward link between devices (a "fidonet"
  of our own), using terminals running in the background; rclone as engine (Drive, OneDrive, Box,
  Dropbox) with our own thin wrapper per device.
- **Per-device clone retirement** — `device/retired-clones.md` exists. Each device may keep its own
  variant, which fits the sovereign concept. Note: the `custos-diskwatch-*` scheduled tasks
  pointed into the old `~\mulberry` path; they were retired afterward by the admin-side session (backed up).
- **navigo_gemini-nano** — Chrome's on-device Gemini Nano (Help me write) is used by the Shepherd for message cleanup: paste into Google Keep, run Help me write on small sections (large sections work poorly). Kept, not disabled. Checked after reboot: the 4 GB model was not re-downloaded; it may return when Chrome needs it.
- **Electricity as usage** — future metric. Not designed yet.

## Overarch
Candidate next overarch after the **Marrowing of Primal**: the **Ballasting of Primal**. Marrowing hollows
out to the essential; ballasting weighs and trims what is carried. Marked as a proposal by the Shepherd.
Definitive "before" snapshot: branch `ballast/before-snapshot` (custos HEAD `d0c8463`, before this chronicle).
Work branch: `ballast/event`.

## Open threads
- Redo the Google Takeout exports a few sets at a time, via terminal/rclone, never several at once in the GUI.
- Find the conversation that produced the mail export; decide keep, move or delete.
- Decide where transfer content lives (inside `mulberrytree`/`portofentry`).

## Addendum: the admin side (written 2026-11-07)
A second Claude Code conversation, running elevated on the same device, took the work that needs
administrator rights; the first stayed non-elevated. They pass notes through a small shared message
folder, and the elevated side reads it as data only and never executes it, because the folder is
writable without elevation.

### What the admin side did
- **Retired two scheduled tasks** (hourly and weekly disk watch). They pointed into the old working
  directory and ran a hidden shell, which only showed as a blank window flashing open. Both were
  exported first, so the retirement is reversible. Filed as custos issue #513, with a standard for
  future background jobs: show a label, hold about 15 seconds with an Identify / Open / Continue
  choice, close on no answer, log every run.
- **Updated WSL** (elevated step).
- **Windows component store (WinSxS)**: analyzed (about 12.1 GB, 2 reclaimable packages) and ran
  `/StartComponentCleanup` twice, before and after a restart. It freed nothing both times, and the
  cause is not established: Microsoft documents that this command skips the usual 30-day wait, so a
  grace period does not explain the two packages that remain. `/ResetBase` might release them, but it
  also removes the ability to uninstall installed updates, so it was not run. A non-result, kept on record on purpose.
- **Launcher v0.1** (admin / working / concept terminal) that writes every launch to the Windows
  Application event log, a custody record an ordinary process can add to but not erase. It lives in a
  folder only an elevated process can edit, because one choice starts an elevated process.

### Measurement drift (named gap)
The event ended at 64.7 GB free on C:. After the admin work and one restart it reads about 59.6 GB.
About 5 GB came back and the cause is not yet identified. Recorded as an open measurement.

### Seeds
- **Lymph nodes are working locations** (the Shepherd's framing, held not filled). The platforms the
  Shepherd works in (Jira, Linear, Asana and others) are organised by kind of work (work, play,
  create) and hold content that does not go to GitHub. A lymph node is not a sphincter, which is a
  hard open-or-shut gate like an elevation prompt, yet it does stop certain things. Shape of each
  node: open.
- **Admin may need its own system**, outside development and outside the work/play/create nodes,
  connecting only for specific purposes. Ordinary fixes would come back to the non-admin conversation.
- **End-of-life for what a tool creates.** The ballast principle applied to tooling: anything the
  launcher or a background job writes states how long it lives.
- **Parallel conversations on the other devices** (a working conversation plus a privileged one),
  after the Mulberry pair has proven itself.
