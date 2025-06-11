# 02 – Basics of Filter Design

Designing a filter involves setting key parameters based on application needs:

- **Cutoff Frequencies**: Determine the frequency range that passes or gets attenuated.
- **Selectivity (Q-Factor)**: Defines sharpness of resonance or transition.
- **Gain**: Determines how much signal is amplified in the passband.
- **Ripple**: Acceptable variations in passband or stopband.
- **Order**: Higher-order filters offer steeper transitions but more complexity.

### Common Filter Types

- **Low-Pass Filter (LPF)**: Allows low frequencies, blocks high.
- **High-Pass Filter (HPF)**: Allows high frequencies, blocks low.
- **Band-Pass Filter (BPF)**: Passes only a specific frequency band.
- **Band-Stop Filter (BSF)**: Blocks a specific frequency band.

### Effects of Poles and Zeros

- Zeros increase gain at certain frequencies.
- Poles reduce gain and define filter roll-off behavior.

### Filter Approximations

Different approximation methods shape the filter response:
- **Butterworth**: Maximally flat in the passband
- **Chebyshev**: Sharper roll-off with ripple
- **Elliptic**: Sharpest roll-off with ripple in both bands
- **Bessel**: Best phase linearity

