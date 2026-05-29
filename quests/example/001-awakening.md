---
id: example/001-awakening
title: "The Awakening"
arc: example
sequence: 1
xp: 50
difficulty: novice
estimated_time: "10m"
requires: []
unlocks: []
tags:
  - orientation
  - filesystem
  - navigation
---

## Lore

*Replace this with narrative that belongs to your world.*

You open your eyes. The terminal blinks. Something is different today — the prompt
is waiting, and for the first time, you understand that it is asking you something.

Not a command. A question: *where are you?*

## Objective

Orient yourself in the environment. Know where you are, what surrounds you,
and leave a mark that proves you were here.

## Tasks

1. Find out your current location in the filesystem.

   ```bash
   pwd
   ```

2. List everything in your home directory, including hidden files.

   ```bash
   ls -la ~
   ```

3. Create a file that records this moment — your first mark.

   ```bash
   echo "I was here. $(date)" > ~/prima-awakening.txt
   ```

4. Read it back to confirm it exists.

   ```bash
   cat ~/prima-awakening.txt
   ```

## Completion Check

```bash
# Run this to verify the quest is complete.
[ -f ~/prima-awakening.txt ] && echo "Quest complete: The Awakening" || echo "Not yet — prima-awakening.txt not found."
```

## Reward

You now know where you stand. The filesystem is not a maze — it is a map,
and you are on it. `pwd` is your compass. It will never lie to you.

**+50 XP** — *Orientation unlocked*

## Hints

<details>
<summary>Hint 1 — "I don't know what pwd means"</summary>
`pwd` stands for Print Working Directory. It tells you the full path of the
folder your terminal session is currently inside.
</details>

<details>
<summary>Hint 2 — "The ls output is overwhelming"</summary>
The `-l` flag gives you a long listing (permissions, owner, size). The `-a` flag
shows hidden files (names that start with a dot). Together, `-la` shows everything.
Focus on the file names in the rightmost column for now.
</details>

☯
