# Install Log

<!-- append only — never edit past entries -->
<!-- add entries with: bash tools/log_install.sh <item> <location> <method> [by] [notes] -->

The record of what got installed, where, and how. `device/pixel8.yaml`'s
`packages.installed` list (and any future device manifest) is the
*current-state snapshot* — this log is the *history* behind it. When in
doubt about whether something is installed somewhere, check here first.

## Schema

```
---
date:     YYYY-MM-DD
item:     [package, tool, or binary name]
location: [device + path, e.g. "pixel8 (Termux) ~/pixel8/custos"]
method:   [pkg / apt-get / npm / pip / curl+manual / etc.]
by:       [who ran it — handle, Claude, ChatGPT, ...]
notes:    [why it was needed, version pinned, gotchas]
---
```

## Log

---
date:     2026-06-13
item:     device/install-log.md + tools/log_install.sh
location: custos repo (this branch)
method:   manual
by:       Claude
notes:    Established the install record itself, per request to track what
          gets installed where. Also fixed a corrupted device/pixel8.yaml
          (duplicate `sessions:` key with stray line-number artifacts from
          commit 217408c) found during this audit.
---
