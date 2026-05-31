# device/

This directory tracks the physical device(s) running custos.

Live device state should be maintained on device-specific branches (e.g. `pixel8`) rather than on `main` to keep the concept foundation branch portable.

Each device has its own subdirectory or manifest file. The device layer answers: what is installed here, what is active, what has passed through.

## Files

| File | Purpose |
|---|---|
| `pixel8.yaml` | Pixel 8 device manifest — installed packages, key paths, active sessions |
| `active.md` | Current work-in-flight on this device — projects, repos, open tasks |

## Usage

```bash
# Check what's active on this device
cat device/active.md

# Check the device manifest
cat device/pixel8.yaml
```

## Migration from pixel8a

Content from `~/pixel8a` on the Pixel 8 should be organized and moved to `~/pixel8` on the device. As content is migrated, update `device/active.md` to reflect what landed.

See `turns/log.md` to record migration sessions.
