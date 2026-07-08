---
carrier_id: cygwin-installation
prima_clock: 202606132358
source_path: "C:\Users\eapri\mulberry\queue\artesian\Cygwin Installation.pdf"
found: 2026-06-13
chain_of_custody: CLOSED
vault_copy: "vault/cygwin-installation.pdf"
status: seep-artois
drawn_by: ""
drawn_date: ""
---

# Cygwin Installation

## Source

A 3-page print of the Cygwin "Installing and Updating Cygwin Packages" FAQ
(https://www.cygwin.com/install.html, printed 6/13/26). It landed in an
`artesian/` queue folder on the Shepherd's Windows machine — set aside before
it had a name, per the usual artesian pattern.

## Why It Matters

Cygwin is how a Windows machine becomes a usable Podium for custos-style bash
work: `setup-x86_64.exe` installs a POSIX environment (bash, git, etc.) on
Windows, mirroring what Termux provides on the Pixel 8. As the project moves
toward tracking *which* podium and *which* team did a piece of work (per the
Shepherd's note: "multiple podiums... multiple teams... labeled everything
prima"), this document is the setup reference for adding a Windows box as a
podium — relevant if/when `device/` grows a manifest for a Windows machine
alongside `device/pixel8.yaml`.

## Development Notes

Key points extracted from the FAQ:

- Run `setup-x86_64.exe` any time to install or update packages on 64-bit
  Windows. Only minimal base packages (~100MB) install by default; pick more
  via the category/package screen.
- The setup program tracks installed component versions itself — the Cygwin
  DLL version is not a meaningful "release number."
- Re-running setup remembers prior selections and updates them.
- Runs elevated by default; use `--no-admin` for a per-user, unprivileged
  install.
- **Command-line / automated install**: `-q` (quiet) plus
  `-P package1,package2,...` selects packages non-interactively — useful for
  scripted podium bootstraps (parallel to `seeds/bootstrap.sh`'s
  pkg/apt-get flow for Termux).
- No full `apt`/`yum`-style package manager is provided, because Windows
  won't let a running package manager overwrite the Cygwin DLL it depends on.
- Signature verification: `gpg --recv-key <fingerprint>` then
  `gpg --verify setup-x86_64.exe.sig setup-x86_64.exe` to confirm the
  installer is genuine before running it.
- Offline install: either mirror the package repo locally and point setup at
  it ("Choose A Download Site"), or do a two-pass "download without
  installing" then "install from local directory."
- Legacy/unsupported Windows versions can pull older Cygwin releases via
  `--allow-unsupported-windows --site <circa_URL>` (with `--no-verify` for
  older signed snapshots).
- 32-bit Cygwin (`setup-x86.exe`) is discouraged — `fork(2)` failures are more
  likely under 32-bit Windows address-space limits; use 64-bit unless there's
  no alternative.

## Plan

1. If/when a Windows machine is added as a custos podium, use this carrier as
   the bootstrap reference: run `setup-x86_64.exe -q -P git,curl,bash,...` to
   match the package set tracked in `device/pixel8.yaml`'s
   `packages.installed`.
2. Verify the installer signature first (see Development Notes) before
   running it, especially on a shared/managed machine.
3. Once a Windows podium exists, give it its own `device/<name>.yaml`
   manifest (mirroring `device/pixel8.yaml`) and log the Cygwin install via
   `bash tools/log_install.sh cygwin "<podium> (Cygwin)" curl+manual ...`.
4. Fold this into the broader podiums/teams tracking the Shepherd asked
   about — this carrier is one input to that design, not a blocker for it.

## Status

- [x] Reviewed at the Weir
- [x] Origin mold copied to vault/
- [x] Carrier page moved to seep-artois/
- [ ] Drawn for development
