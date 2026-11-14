# Codacy Setup Backlog

Prima-clock: 202610100807

Open items and findings from the first Codacy tuning pass (October 2026). Pick these up later.

## Current state (after PR #438)

- Markdown linting is on. Cloud analysis of `81bea46`: 216 issues, 213 Markdown, 207 Info.
- markdownlint MD043 (required heading structure) was disabled on Cloud: 216 to 185 issues.
- Top patterns now: MD022 (93), MD032 (50), MD036 (9), Agentlinter undefined-term (7), MD034 (6).
- remark-lint is set to "Configuration file" and reads `.remarkrc.json`. A reanalysis showed 0 remark-lint findings, but it finished in 14 seconds and may not have run the tool. Recheck after a full analysis.

## Answers from Codacy

- The remark-lint runner bundles `remark-preset-lint-recommended` and `remark-preset-lint-consistent`, plus about 90 `remark-lint-*` rule plugins. Nothing needs installing.
- The UI pattern list is empty for remark-lint. Codacy's explanation is an inference: in config-file mode the file sets the rules.
- Org names are case-sensitive in the API (`Eaprime1`). Expected; pass the org explicitly.
- Ignored files: the docs say a `.codacy.yml` bypasses the UI ignore settings. Codacy points to the Files page, Ignored tab. Our check found all 496 "ignored files" are expansions of the 38 `.codacy.yml` globs. Not yet confirmed in the UI.
- Bulk enable: UI only (filter, then the header checkbox). No CLI or API route known.

## Local analysis does not work on this Windows machine (option 2)

The Codacy Analysis CLI baseline ran 10m35s and found 0 issues, because most tools never executed:

- **Semgrep/Opengrep** (2143 patterns, largest tool): no Windows binary. Needs WSL (installed) or Docker.
- **Ruff, Trivy, shellcheck**: downloads failed because Git Bash `tar` reads `C:\...` as a remote host. Windows `tar.exe` (bsdtar) works. Retry through PowerShell.
- **PMD, PMD7**: need Java (not installed).
- **remark-lint, Oxlint**: Cloud-only, no local analyzer.
- Local runs also see few files while `.codacy.yml` excludes most of the repo.

Fix path: run `codacy-analysis analyze` from PowerShell, add Java, run Semgrep under WSL.

## Other open items

- Decide on MD022 and MD032 (blank lines around headings and lists, 143 Info findings): bulk-fix with a formatter, or disable.
- Enable the 1000+ pattern tools in stages, reading each tool's issues before enabling the next.
- Open draft PR #437 (stage-1 Markdown scope) overlaps this work. Reconcile it with what #438 merged.
- Two URLs in `guides/token-quickref.md` are still unverified.
- Drive the Codacy site through the Chrome side panel to check settings the CLI cannot read (see the message drafted for the Codacy chat).
