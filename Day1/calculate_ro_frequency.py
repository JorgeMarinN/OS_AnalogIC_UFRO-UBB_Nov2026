#!/usr/bin/env python3
"""Measure a 3-stage ring oscillator frequency from six-column SPICE raw text.

Columns: time1 voltage1 time2 voltage2 time3 voltage3.
Requires numpy and matplotlib. No NumPy 2-only functions are used.
"""
import argparse
from pathlib import Path
import numpy as np


def rising_crossings(time, voltage, threshold):
    """Return linearly interpolated rising threshold crossing times."""
    valid = np.isfinite(time) & np.isfinite(voltage)
    t, v = time[valid], voltage[valid]
    if len(t) < 2 or np.any(np.diff(t) <= 0):
        raise ValueError('Time values must be strictly increasing.')
    indices = np.flatnonzero((v[:-1] < threshold) & (v[1:] >= threshold))
    return t[indices] + (threshold - v[indices]) * (
        t[indices + 1] - t[indices]
    ) / (v[indices + 1] - v[indices])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('file', nargs='?', default='TT_3stage_RO_v1p1.txt')
    parser.add_argument('--vdd', type=float, default=1.2, help='Supply voltage (V)')
    parser.add_argument('--threshold', type=float, default=None,
                        help='Crossing threshold (V); default VDD/2')
    parser.add_argument('--start-ns', type=float, default=0.0,
                        help='Ignore crossings earlier than this time (ns)')
    parser.add_argument('--end-ns', type=float, default=None,
                        help='Ignore crossings later than this time (ns)')
    parser.add_argument('--no-plot', action='store_true')
    args = parser.parse_args()

    data = np.loadtxt(args.file, comments='#')
    if data.ndim != 2 or data.shape[1] != 6:
        raise ValueError('Expected six columns: t1 v1 t2 v2 t3 v3')

    threshold = args.vdd / 2 if args.threshold is None else args.threshold
    start = args.start_ns * 1e-9
    end = np.inf if args.end_ns is None else args.end_ns * 1e-9
    if end <= start:
        parser.error('--end-ns must be greater than --start-ns')

    results = []
    print(f'Input: {Path(args.file).name}')
    print(f'Rising-edge threshold: {threshold:.4f} V')
    print(f'Analysis window: {args.start_ns:g} ns to '
          f'{args.end_ns if args.end_ns is not None else "end of file"} ns\n')
    print(f'{"Node":<8}{"Cycles":>9}{"Mean period (ps)":>20}'
          f'{"Frequency (GHz)":>20}{"Period std (ps)":>20}')

    for node in range(3):
        time, voltage = data[:, 2 * node], data[:, 2 * node + 1]
        crossings = rising_crossings(time, voltage, threshold)
        crossings = crossings[(crossings >= start) & (crossings <= end)]
        if len(crossings) < 2:
            raise ValueError(f'Node {node+1}: fewer than two rising crossings '
                             'in the selected window')
        periods = np.diff(crossings)
        mean_period = np.mean(periods)
        frequency = 1.0 / mean_period
        results.append(frequency)
        print(f'{node+1:<8}{len(periods):>9d}{mean_period*1e12:>20.4f}'
              f'{frequency/1e9:>20.6f}{np.std(periods)*1e12:>20.4f}')

    results = np.array(results)
    print(f'\nAverage frequency (3 nodes): {np.mean(results)/1e9:.6f} GHz')
    print(f'Between-node frequency std: {np.std(results)/1e6:.6f} MHz')
    print(f'Equivalent average period: {1e12/np.mean(results):.4f} ps')

    if not args.no_plot:
        import matplotlib.pyplot as plt
        fig, ax = plt.subplots(figsize=(11, 4.5))
        for node in range(3):
            t, v = data[:, 2 * node], data[:, 2 * node + 1]
            mask = (t >= start) & (t <= end)
            ax.plot(t[mask] * 1e9, v[mask], label=f'Node {node+1}', lw=1)
        ax.axhline(threshold, ls='--', color='gray',
                   label=f'Threshold = {threshold:g} V')
        ax.set(xlabel='Time (ns)', ylabel='Voltage (V)',
               title=f'3-stage RO | Average frequency = {np.mean(results)/1e9:.4f} GHz')
        ax.grid(alpha=0.3)
        ax.legend()
        fig.tight_layout()
        output = Path(args.file).with_name(Path(args.file).stem + '_frequency.png')
        fig.savefig(output, dpi=180)
        print(f'Waveform plot: {output}')
        plt.show()


if __name__ == '__main__':
    main()
