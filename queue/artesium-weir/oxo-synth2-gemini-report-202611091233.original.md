**Oxo Synth2** is a recreation of Daichi Laboratory’s legendary **Synth1**—a software instrument modeled originally on the Clavia Nord Lead 2 hardware architecture. Developed by François Chabloz and released under the permissive MIT open-source license, Oxo Synth2 addresses the growing obsolescence of 32-bit/legacy VSTs on modern 64-bit systems (particularly Apple Silicon and iPadOS), using roughly 3 GB of empirical measurement data to mirror the sound and response of the original synthesis engine.

---

### Core Architecture & Technical Specifications

* **Oscillator Section:** Two main oscillators plus an independent sub-oscillator. Includes detune, FM (frequency modulation), ring modulation, hard sync, and noise.
* **Filter Topography:** 5 filter modes:
* Low-Pass (LP12, LP24)
* High-Pass (HP12)
* Band-Pass (BP12)
* Low-Pass Distortion/Saturated (LPDL)
* Includes velocity sensitivity, key tracking, and resonance saturation.


* **Modulation Routing:** Two tempo-syncable LFOs with 6 selectable waveforms. Targets include pitch, filter cutoff, amp, pulse-width (PWM), FM depth, and stereo pan. A dedicated modulation envelope handles FM, PWM, or pitch sweeps independently of the main envelopes.
* **Performance & Voicing:** Up to 32-voice polyphony with mono, legato, portamento, and an 8-voice unison mode featuring spread and detuning controls. Includes a 1–4 octave syncable arpeggiator (up, down, up/down, random).
* **Onboard Effects:** Two analog-style distortion modes, digital distortion/bitcrush, decimation, ring modulation, compression, 4 phaser types, stereo/ping-pong delay, and chorus/flanger.
* **Compatibility:** Full backward compatibility with native Synth1 `.sy1` patches and standard zipped soundbanks.

---

### Versatility & Sound Design Potential

| Category | Practical Capability | Notable Edge Cases & Strengths |
| --- | --- | --- |
| **Virtual Analog & Retro Brass/Leads** | Emulates early VA poly-synths (Nord Lead 2 lineage). Capable of biting saws, warm brass pads, and punchy synth-pop poly leads. | 8-voice unison and dedicated detune make it instantly capable of massive supersaw-style patches. |
| **Chiptune & Lo-Fi Textures** | Built-in decimation, digital clipping, and hard ring modulation allow direct creation of 8-bit/12-bit textures without external bitcrushers. | Fast modulation envelopes allow punchy percussive blips, zap kicks, and retro gaming SFX. |
| **Industrial, Techno & Aggressive Tones** | Cross-modulation, oscillator sync, and aggressive filter saturation (LPDL) paired with dual distortion stages. | FM coupled with hard sync yields metallic, screeching industrial leads and FM basslines. |
| **Classic Arpeggiation & Ambient Sequences** | Dual tempo-synced LFOs feeding pan and filter while the arpeggiator drives stereo ping-pong delays. | Highly responsive to live filter manipulation during sequenced runs without DSP artifacting. |

---

### Strengths & Limitations

#### Key Strengths

* **Complete Soundbank Interoperability:** Immediate access to two decades of community-built Synth1 soundbanks (literally tens of thousands of free patches online).
* **Open-Source Footprint (MIT):** Free to audit, adapt, port, or embed into custom workflows and community-led builds.
* **Cross-Environment Touch Support:** The AUv3 release makes it fully functional inside modular iPad DAWs (AUM, Logic Pro for iPad, Cubasis).
* **Low CPU Overhead:** Retains the lean subtractive topology that made the original Synth1 an industry benchmark for running dozens of simultaneous plugin instances.

---

### Current Constraints

* **Platform Availability:** Currently launched for **macOS (VST3/AU)** and **iPadOS (AUv3)**. Windows VST3 remains in development, and native Linux binaries rely on future community packaging.
* **Traditional Subtractive Engine:** While flexible, it adheres strictly to classic subtractive/FM virtual analog principles; it does not offer modern wavetable manipulation, sample layering, or multi-segment envelope generators (MSEGs).

---

### Practical Evaluation & Next Steps

1. **Verify Your Environment:** Ensure target host systems meet the minimum requirements (**macOS 14+** for desktop AU/VST3 or **iPadOS 17+** for AUv3 host environments).
2. **Download & Install:** Retrieve the binaries directly via the [official Oxo Synth2 product page](https://www.synthtopia.com/content/2026/11/09/oxo-synth2-revives-classic-synth1-as-a-free-open-source-software-synthesizer/).
3. **Import Legacy Banks:** Download standard `.sy1` Synth1 preset zip files and load them via the internal preset browser to verify preset translation fidelity across complex modulation routings.
4. **Inspect Source:** For developers interested in headless audio builds or porting to additional operating systems, inspect the project repository directly under its MIT license terms.
