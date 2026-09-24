import { XdaConcept } from '../XdaConcept';
import { Frequency, ValueDensity } from '../../types/StreamSubStream';

describe('XdaConcept', () => {
  it('should expose all four sub‑streams', () => {
    const labels = XdaConcept.listLabels();
    expect(labels.sort()).toEqual(
      ['local-ai', 'self-hosting', 'diy-hardware', 'deals'].sort(),
    );
  });

  it('should return correct config for "local-ai"', () => {
    const cfg = XdaConcept.getSubStream('local-ai');
    expect(cfg).toBeDefined();
    expect(cfg?.frequency).toBe(Frequency.MEDIUM);
    expect(cfg?.valueDensity).toBe(ValueDensity.HIGH);
    expect(cfg?.archiveCadenceDays).toBe(7);
    expect(cfg?.pineconePriority).toBe(1);
  });

  it('should return correct config for "deals"', () => {
    const cfg = XdaConcept.getSubStream('deals');
    expect(cfg).toBeDefined();
    expect(cfg?.frequency).toBe(Frequency.HIGH);
    expect(cfg?.valueDensity).toBe(ValueDensity.LOW);
    expect(cfg?.archiveCadenceDays).toBe(1);
    expect(cfg?.pineconePriority).toBe(5);
  });

  it('should return undefined for unknown sub‑stream', () => {
    expect(XdaConcept.getSubStream('nonexistent')).toBeUndefined();
  });
});
