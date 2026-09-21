# XDA Concept Entity

Multi-stream concept entity definition separating technical signal from commercial noise.

Prima-clock: 202609210410

---

## Entity Classification

- Entity: XDA
- Type: Multi-Stream Concept Entity
- Primary Domain: `xda-developers.com`
- Origin Source: `newsletters@xda-developers.com`
- Separation Mechanism: Sub-stream routing architecture

---

## The Separation from Duplicatus

The single inbox sender representation models XDA as a flat Duplicatus entry. Under a flat entry, incoming transmissions are treated as a homogeneous flow.

XDA does not operate as a singular stream. It carries four distinct sub-streams with diverging frequencies and value densities. Conflating these sub-streams into a single semantic container compresses high-value technical documentation with high-volume promotional deal alerts. The value density differential collapses, burying actionable engineering knowledge under commercial radiation.

Duplicatus handles duplicate consolidation across singular entities. It cannot differentiate mixed-signal streams originating from a shared sender. The XDA Concept Entity provides the structural separation mechanism required to preserve signal-to-noise ratio.

---

## Sub-Streams

| Sub-Stream | Frequency | Value Density | Focus |
|---|---|---|---|
| `local-ai` | Medium | High | Technical depth, local inference, model quantization, edge compute |
| `self-hosting` | Medium | High | Infrastructure, sovereign services, network storage, home lab operations |
| `diy-hardware` | Low | High | Repairability, modification, maker projects, board-level diagnostics |
| `deals` | High | Low | Commercial radiation, ephemeral discount notifications (noise in value costume) |

---

## Routing Behaviors

Each sub-stream is governed by specific routing rules for classification, archival cadence, and vector embedding priority.

### 1. local-ai
- Label: `xda/local-ai`
- Archive Cadence: 7 days
- Pinecone Embedding Priority: `high`
- Vector Metadata: `stream: "local-ai"`, `signal_tier: "primary"`, `retention: "persistent"`
- Purpose: Preserves actionable local inference tutorials, fine-tuning methodologies, and on-device execution patterns for semantic search retrieval.

### 2. self-hosting
- Label: `xda/self-hosting`
- Archive Cadence: 7 days
- Pinecone Embedding Priority: `high`
- Vector Metadata: `stream: "self-hosting"`, `signal_tier: "primary"`, `retention: "persistent"`
- Purpose: Indexes sovereign self-hosted infrastructure guides, container deployments, and protocol configurations.

### 3. diy-hardware
- Label: `xda/diy-hardware`
- Archive Cadence: 30 days
- Pinecone Embedding Priority: `medium`
- Vector Metadata: `stream: "diy-hardware"`, `signal_tier: "secondary"`, `retention: "persistent"`
- Purpose: Captures hardware teardowns, micro-soldering guides, schematics, and component-level repairs on an extended reference cadence.

### 4. deals
- Label: `xda/deals`
- Archive Cadence: 1 day
- Pinecone Embedding Priority: `low`
- Vector Metadata: `stream: "deals"`, `signal_tier: "transient"`, `retention: "ephemeral"`
- Purpose: Maps directly to Noise Typology Type 6 (Genuine signal in noise costume). Isolates promotional deal alerts to prevent vector search pollution in technical indexing spaces. Fast daily archive prevents activation pressure accumulation in the inbox.

---

## Semantic Layer Integration

The Pinecone vector store functions as the semantic categorization layer for inbound mail streams. Threads tagged with `xda/*` labels inherit vector embeddings partitioned by sub-stream metadata. High-priority technical streams (`local-ai`, `self-hosting`) are weighted for long-term similarity matching and concept discovery. The `deals` stream is excluded from foundational knowledge retrieval queries.
