import {
  Frequency,
  ValueDensity,
  SubStreamConfig,
} from '../types/StreamSubStream';

/**
 * XDA concept entity.
 *
 * XDA is not a single inbox stream; it consists of four logical
 * sub‑streams that differ in frequency and value density.
 *
 * This file centralises the definition so that routing, archiving,
 * and embedding services can import a single source of truth.
 */
export class XdaConcept {
  /** All sub‑streams belonging to XDA */
  public static readonly subStreams: Record<string, SubStreamConfig> = {
    'local-ai': {
      label: 'local-ai',
      frequency: Frequency.MEDIUM,
      valueDensity: ValueDensity.HIGH,
      // Medium frequency → archive weekly
      archiveCadenceDays: 7,
      // High‑value content gets top embedding priority
      pineconePriority: 1,
    },
    'self-hosting': {
      label: 'self-hosting',
      frequency: Frequency.MEDIUM,
      valueDensity: ValueDensity.HIGH,
      archiveCadenceDays: 7,
      pineconePriority: 1,
    },
    'diy-hardware': {
      label: 'diy-hardware',
      frequency: Frequency.LOW,
      valueDensity: ValueDensity.HIGH,
      // Low frequency → archive monthly
      archiveCadenceDays: 30,
      pineconePriority: 2,
    },
    deals: {
      label: 'deals',
      frequency: Frequency.HIGH,
      valueDensity: ValueDensity.LOW,
      // High‑frequency noise → archive daily
      archiveCadenceDays: 1,
      // Low priority for embeddings
      pineconePriority: 5,
    },
  };

  /**
   * Retrieve a sub‑stream config by its label.
   *
   * @param label The sub‑stream label (e.g. "local-ai")
   * @returns The configuration object or undefined if not found
   */
  public static getSubStream(label: string): SubStreamConfig | undefined {
    return XdaConcept.subStreams[label];
  }

  /**
   * List all sub‑stream labels.
   */
  public static listLabels(): string[] {
    return Object.keys(XdaConcept.subStreams);
  }
}
