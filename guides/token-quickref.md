# Token & Key Quick Reference

Where to get each token, where it lives, what uses it. URLs only; never paste a token value into this file.
Add a row each time you create a new one. "Verify" means the path is from memory and has not been confirmed in the UI.

| Token | Get it here | Stored as | Used by |
|---|---|---|---|
| Codacy account API token | https://app.codacy.com/account/access-management (Verify) | `CODACY_API_TOKEN` (GitHub secret + local env); also `~/.codacy/credentials` via `codacy login` | `codacy` and `codacy-analysis` CLIs, Codacy MCP server |
| Codacy project token (per repo) | https://app.codacy.com/gh/Eaprime1/custos/settings/integrations (Verify) | `CODACY_PROJECT_TOKEN` | coverage upload, repo-scoped CLI calls |
| GitHub Actions secrets (where tokens get stored) | https://github.com/Eaprime1/custos/settings/secrets/actions | n/a | CI workflows |
| GitHub personal access token | https://github.com/settings/tokens | `GH_TOKEN` | `gh` CLI, GitHub MCP |

## Gotchas

- Codacy's org name is case-sensitive: `Eaprime1`, not `eaprime1`. The git remote is lowercase, so the CLIs' auto-detect 404s. Pass the org explicitly: `codacy repo gh Eaprime1 custos`.
- Codacy CLIs share one login (`~/.codacy/credentials`), so `codacy login` covers both.
- A GitHub secret is readable only by workflows, not by your local shell. Set the same name locally if a local tool needs it.
