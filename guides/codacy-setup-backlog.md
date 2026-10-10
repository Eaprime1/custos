# Codacy Setup Backlog

Open items from the first Codacy tuning pass (October 2026). Pick these up later.

## Local analysis does not work on this Windows machine (option 2)

The Codacy Analysis CLI baseline ran 10m35s and found 0 issues, because most tools never executed:

- **Semgrep/Opengrep** (2143 patterns, largest tool): no Windows binary. Needs WSL (installed) or Docker.
- **Ruff, Trivy, shellcheck**: downloads failed because Git Bash `tar` reads `C:\...` as a remote host. Windows `tar.exe` (bsdtar) works. Retry through PowerShell.
- **PMD, PMD7**: need Java (not installed).
- **remark-lint, Oxlint**: Cloud-only, no local analyzer.
- Local runs also see few files while `.codacy.yml` plus Cloud-ignored files exclude most of the repo.

Fix path: run `codacy-analysis analyze` from PowerShell, add Java, run Semgrep under WSL.

## Other open items

- remark-lint patterns cannot be listed or enabled through the CLI or API (returns zero). Enable them in the Codacy UI.
- 496 files are ignored in the Codacy Cloud UI (not in `.codacy.yml`). Many are `.md`. Clear them in the UI for Markdown linting to reach them.
- Codacy's org name is case-sensitive (`Eaprime1`); the git remote is lowercase, so CLI auto-detect 404s.
- Enable the 1000+ pattern tools in stages, reading each tool's issues before enabling the next.
