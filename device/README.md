# device/

This directory tracks the physical device(s) running custos.

Live device state should be maintained on device-specific branches (e.g. `pixel8`) rather than on `main` to keep the concept foundation branch portable.

Each device has its own subdirectory or manifest file. The device layer answers: what is installed here, what is active, what has passed through.

## Files

| File | Purpose |
|---|---|
| `pixel8.yaml` | Pixel 8 device manifest — installed packages, key paths, active sessions |
| `active.md` | Current work-in-flight on this device — projects, repos, open tasks |
| `install-log.md` | Append-only history of what was installed, where, and how |

## Usage

```bash
# Check what's active on this device
cat device/active.md

# Check the device manifest
cat device/pixel8.yaml

# Record something that was just installed
bash tools/log_install.sh <item> <location> <method> [by] [notes]
```

## Install Record

`install-log.md` is the history; each device manifest's `packages.installed`
list is the current-state snapshot. When Claude (or anyone) installs
something for custos, log it with `tools/log_install.sh` and, if it changes
the steady state for a device, add it to that device's manifest too.

## Migration from pixel8a

Content from `~/pixel8a` on the Pixel 8 should be organized and moved to `~/pixel8` on the device. As content is migrated, update `device/active.md` to reflect what landed.

See `turns/log.md` to record migration sessions.
