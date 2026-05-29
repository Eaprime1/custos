# Getting Started

*Replace the italicized lore sections below with narrative that fits your world.*

---

*The terminal has always been here. Most people walk past it. You stopped.*

Welcome. This guide gets you from zero to your first quest in one session.

## Prerequisites

- A working terminal session (Termux on Android, or any Linux/macOS shell)
- `git` installed
- Internet access for the initial bootstrap

## Step 1 — Clone the Concept

```bash
git clone <your-concept-repo-url>
cd <your-concept-slug>
```

## Step 2 — Bootstrap the Environment

```bash
bash seeds/bootstrap.sh
```

This installs required packages and sets up your environment marker. It is
idempotent — run it again any time something seems off.

Reload your shell after bootstrap:

```bash
source ~/.prima-env
```

## Step 3 — Read the World

Before starting quests, spend five minutes in `world/lore.md`. Context
makes the quests make sense.

```bash
cat world/lore.md
```

## Step 4 — Your First Quest

Open your first quest:

```bash
cat quests/example/001-awakening.md
```

Read the lore section. Then follow the tasks. Then run the completion check.

## Step 5 — Record Your Progress

The concept does not track your progress automatically — you do.
Keep a log file in your home directory:

```bash
echo "Completed example/001-awakening — $(date)" >> ~/prima-log.txt
```

As the concept grows, a proper progress tracker will appear in `unexusi/`.

## Troubleshooting

**Bootstrap fails on Termux:**
Make sure Termux is up to date: `pkg upgrade`

**A package won't install:**
Check `seeds/packages.yaml` — some optional packages may not be available
on your platform. Skip them and continue.

**A quest's completion check fails unexpectedly:**
Read the quest's hints section. If you are genuinely stuck, that is
feedback — open an issue or contribute a better hint.
