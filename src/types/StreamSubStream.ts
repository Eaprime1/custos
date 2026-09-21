/**
 * Types and enums describing a sub‑stream of a larger concept stream.
 *
 * The XDA concept (and potentially others) uses this structure to
 * describe how each logical sub‑stream should be routed, archived,
 * and indexed in the Pinecone semantic layer.
 */

export enum Frequency {
  HIGH = 'high',
  MEDIUM = 'medium',
  LOW = 'low',
}

/**
 * Relative value density – how much “signal” vs “noise” a sub‑stream
 * typically carries.  Used by downstream services (archivers,
 * embedding pipelines) to prioritize work.
 */
export enum ValueDensity {
  HIGH = 'high',
  LOW = 'low',
}

/**
 * Configuration for a single sub‑stream.
 */
export interface SubStreamConfig {
  /** Human readable name, also used as a routing label */
  label: string;

  /** How often new items are expected */
  frequency: Frequency;

  /** Expected signal‑to‑noise ratio */
  valueDensity: ValueDensity;

  /** How often the sub‑stream should be archived (in days) */
  archiveCadenceDays: number;

  /** Pinecone embedding priority – lower numbers are higher priority */
  pineconePriority: number;
}
