#!/usr/bin/env python3
"""Plinko consideration engine. Chips fall through a board of pegs into concept slots.
The first slot to hold three chips is the concept to consider developing first.

The randomness comes from a pattern, not a random-number call: the centre column of the
Rule 30 cellular automaton, started from a seed you give it (digits, such as a prima-clock).
Same seed, same game, every time. Standard library only.

Run: python3 plinko.py [--flat] [seed-digits ...]
A result is a suggestion for the Shepherd to weigh. It decides nothing.
"""
import sys
from math import comb

# left to right, in the order they were named in the thoughts of 20261030
CONCEPTS = [
    "hat narrator",
    "gear-shift notation (* marks)",
    "perpetual blackjack, the next iteration pair",
    "one simple contribution per navigo (setup, prep, create)",
    "watershed model of indicator streams",
    "fuel and vehicle-value streams",
    "plinko consideration engine itself",
    "effluent ledger",
]
CHIPS_TO_WIN = 3
WIDTH = 64
WARM_UP = 2 * WIDTH


def rule30_bits(seed_digits):
    """Endless bits from the centre column of Rule 30, started from the seed digits."""
    cells = [0] * WIDTH
    for pos, ch in enumerate(seed_digits):
        cells[(pos * 7 + int(ch)) % WIDTH] = 1
    if not any(cells):
        cells[WIDTH // 2] = 1
    step = 0
    while True:
        if step >= WARM_UP:                  # the pattern needs time to grow in from the edges
            yield cells[WIDTH // 2]
        cells = [cells[(i - 1) % WIDTH] ^ (cells[i] | cells[(i + 1) % WIDTH]) for i in range(WIDTH)]
        step += 1


def play(seed_digits, concepts=CONCEPTS, chips_to_win=CHIPS_TO_WIN, flat=False):
    """flat=False: a real plinko board (each peg left or right, so the middle is favoured).
    flat=True: every slot equally likely (bits read as a number, tries again if too big)."""
    bits = rule30_bits(seed_digits)
    n = len(concepts)
    rows = n - 1
    width = max(1, (n - 1).bit_length())
    counts, dropped = [0] * n, 0
    while max(counts) < chips_to_win:
        if flat:
            slot = n
            while slot >= n:
                slot = 0
                for _ in range(width):
                    slot = slot * 2 + next(bits)
        else:
            slot = sum(next(bits) for _ in range(rows))   # each peg: left (0) or right (1)
        counts[slot] += 1
        dropped += 1
    return counts, dropped


def slot_odds(n_slots):
    rows = n_slots - 1
    return [comb(rows, k) / 2 ** rows for k in range(n_slots)]


if __name__ == "__main__":
    args = sys.argv[1:]
    flat = "--flat" in args
    seeds = [a for a in args if a != "--flat"] or ["20261030", "202610311130", "202610310526", "21", "3"]
    if flat:
        print("Flat board: every slot equally likely")
    else:
        print("The board favours the middle: chance a single chip lands in each slot")
        for name, p in zip(CONCEPTS, slot_odds(len(CONCEPTS))):
            print(f"   {p * 100:5.1f}%  {name}")
    print(f"\nFirst concept to hold {CHIPS_TO_WIN} chips wins.")
    for seed in seeds:
        counts, dropped = play(seed, flat=flat)
        win = counts.index(max(counts))
        shown = " ".join(str(c) for c in counts)
        print(f"   seed {seed:>13}: {dropped:>2} chips   slots [{shown}]   -> {CONCEPTS[win]}")
