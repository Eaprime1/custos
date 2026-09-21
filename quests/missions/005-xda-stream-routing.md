---
id: missions/005-xda-stream-routing
title: "XDA Stream Routing"
arc: missions
sequence: 5
xp: 150
difficulty: apprentice
estimated_time: "20m"
requires:
  - missions/004-automate-verification
unlocks: []
tags:
  - routing
  - concept-entity
  - noise-typology
  - pinecone
---

Prima-clock: 202609210410

## Lore

A single domain does not guarantee a uniform signal. Transmissions from XDA arrive through a shared gateway, but their internal currents diverge. Technical documentation on local inference, sovereign self-hosting setups, and hardware modifications arrives wrapped in the same vessel as high-frequency commercial discount alerts.

Flattening this flow into a single Duplicatus entry degrades the entire stream. High-value engineering artifacts are drowned by daily promotional noise. The Shepherd does not discard the stream, nor do they permit noise to crowd out signal. By instantiating XDA as a multi-stream concept entity, each current receives its own label, archive cadence, and embedding priority.

## Objective

Map and verify the four sub-streams of the XDA concept entity: isolate commercial noise from persistent technical signals, configure archive lifecycles, and assign semantic vector priorities.

## Tasks

1. Inspect the concept entity definition to review the four designated sub-streams:

   ```bash
   cat world/entities/xda.md
   ```

2. Review the structured sub-stream configuration in the routing map:

   ```bash
   cat quests/routing_maps.yaml
   ```

3. Validate that all sub-streams are registered with their respective labels, retention cadences, and Pinecone priorities:

   - `local-ai`: `xda/local-ai`, 7d, `high` priority
   - `self-hosting`: `xda/self-hosting`, 7d, `high` priority
   - `diy-hardware`: `xda/diy-hardware`, 30d, `medium` priority
   - `deals`: `xda/deals`, 1d, `low` priority

4. Execute the multi-domain verification check to confirm integration across world lore, quests, and pandora germs:

   ```bash
   grep -r "XDA\|xda" world/ quests/ pandora/ 2>/dev/null | head -5
   ```

## Completion Check

```bash
grep -r "XDA\|xda" world/ quests/ pandora/ 2>/dev/null | head -5
```

## Reward

The signal-to-noise ratio is preserved. Technical assets are indexed for semantic retrieval while promotional noise is safely sequestered and swiftly expired.

**+150 XP** — Concept entity routing unlocked.
