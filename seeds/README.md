# Seeds

Seeds are the bootstrap layer — everything needed to get the concept's environment
up and running from a fresh terminal session.

## Files

| File | Purpose |
|---|---|
| `bootstrap.sh` | Run this first — installs packages and sets up dotfiles |
| `packages.yaml` | Declarative list of required and optional packages |
| `dotfiles/` | Config files deployed to `~` by the bootstrap script |

## Usage

```bash
# From inside a fresh Termux or terminal session:
bash seeds/bootstrap.sh
```

The bootstrap script is idempotent — safe to run more than once.

## Dotfiles

Files in `seeds/dotfiles/` are copied to `~/` during bootstrap.
Name them with a leading dot as they should appear at the destination:

```
seeds/dotfiles/.bashrc         → ~/.bashrc
seeds/dotfiles/.profile        → ~/.profile
seeds/dotfiles/.prima-env      → ~/.prima-env
```

## Design Notes

Seeds should be **minimal and additive** — they should not overwrite existing
config without checking. A player's home directory may already have things in it.
When in doubt, append rather than replace.

☯
