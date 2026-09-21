# XDA Concept Entity

Multi-stream concept entity definition separating technical signal from commercial noise.

Prima-clock: 202609210410

---

## Overview

XDA is structured as a multi-stream concept entity with four distinct sub-streams. For the detailed specification, refer to [world/entities/xda.md](entities/xda.md).

---

## Sub-Streams Summary

| Sub-Stream | Frequency | Value Density | Routing Label | Archive Cadence | Pinecone Priority |
|---|---|---|---|---|---|
| `local-ai` | Medium | High | `xda/local-ai` | 7 days | `high` |
| `self-hosting` | Medium | High | `xda/self-hosting` | 7 days | `high` |
| `diy-hardware` | Low | High | `xda/diy-hardware` | 30 days | `medium` |
| `deals` | High | Low | `xda/deals` | 1 day | `low` |

---

## Structural Function

- Separation from Duplicatus: Replaces single flat sender tracking with partitioned stream boundaries.
- Noise Typology: Isolates Type 6 noise (Genuine signal in noise costume) from core technical infrastructure.
- Vector Indexing: Allocates Pinecone embedding priority according to persistent value density rather than arrival frequency.
