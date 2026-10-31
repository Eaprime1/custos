#!/usr/bin/env python3
"""Watershed toy model: a few staple foods as streams, a market, and a body.

ILLUSTRATIVE ONLY. The nutrient numbers are rounded from general nutrition tables
and the market numbers are invented to show shape. Check before relying on any of
them. The point is how the system moves when a stream changes, not the exact values.
Standard library only. Run: python3 model.py
"""
import math

# per serving: vitamin D (ug), vitamin A (ug RAE), protein (g), energy (kcal)
ITEMS = {
    "milk":   {"serving": "1 cup",          "D": 2.9, "A": 100, "protein": 8,  "kcal": 150},
    "egg":    {"serving": "1 large",        "D": 1.1, "A": 75,  "protein": 6,  "kcal": 70},
    "beef":   {"serving": "3 oz cooked",    "D": 0.1, "A": 0,   "protein": 22, "kcal": 210},
    "bread":  {"serving": "1 slice",        "D": 0.0, "A": 0,   "protein": 3,  "kcal": 80},
    "carrot": {"serving": "1/2 cup cooked", "D": 0.0, "A": 650, "protein": 1,  "kcal": 40},
}
NEED = {"D": 15.0, "A": 800.0, "protein": 56.0}      # per person per day

BASE = {"milk": 1.0, "egg": 0.7, "beef": 0.6, "bread": 2.5, "carrot": 0.5}      # servings per person per day
OWN = {"milk": -0.4, "egg": -0.3, "beef": -0.7, "bread": -0.25, "carrot": -0.5}  # own-price elasticity
CROSS = {                                            # how item i reacts to the price of item j
    "egg":   {"milk": 0.15, "beef": 0.20, "bread": 0.05},
    "milk":  {"egg": 0.10, "beef": 0.05},
    "beef":  {"egg": 0.10, "milk": 0.05},
    "bread": {"milk": 0.05, "beef": 0.10, "egg": 0.05},
    "carrot": {},
}
PRICE_CAP, PRICE_FLOOR, DAMP = 20.0, 0.2, 0.3

D_TAU = 15.0 / math.log(2)        # 25(OH)D half-life taken as about 15 days
D_STATUS_BASE = 30.0              # ng/mL at the balanced baseline
D_LOW = 20.0                      # a common "low" line
A_RESERVE_DAYS = 200.0            # liver reserve at baseline, in days of need (assumed)


def intake(nutrient, servings, scale=None):
    """Nutrient from food. scale optionally multiplies each item's content (default 1)."""
    return sum(ITEMS[i][nutrient] * servings[i] * (scale or {}).get(i, 1.0) for i in servings)


# "other" = sun, supplements, other foods: set so the baseline diet is exactly balanced
OTHER = {n: NEED[n] - intake(n, BASE) for n in ("D", "A")}
D_K = D_STATUS_BASE / ((intake("D", BASE) + OTHER["D"]) * D_TAU)


def run(days, shock):
    price = {i: 1.0 for i in ITEMS}
    status = D_STATUS_BASE
    reserve = A_RESERVE_DAYS * NEED["A"]
    rows = []
    tot = {"unsold": 0.0, "protein_extra": 0.0, "d_low_day": None, "a_empty_day": None}
    for day in range(days):
        supply, other, a_scale = dict(BASE), dict(OTHER), {}
        shock(day, supply, other, a_scale)
        dem = {}
        for i in ITEMS:
            f = BASE[i] * price[i] ** OWN[i]
            for j, c in CROSS[i].items():
                f *= price[j] ** c
            dem[i] = f
        eat = {i: min(dem[i], supply[i]) for i in ITEMS}
        for i in ITEMS:
            if supply[i] <= 0:
                price[i] = PRICE_CAP
            else:
                price[i] = min(PRICE_CAP, max(PRICE_FLOOR, price[i] * (dem[i] / supply[i]) ** DAMP))
            tot["unsold"] += max(0.0, supply[i] - eat[i])
        d_in = intake("D", eat) + other["D"]
        a_in = intake("A", eat, a_scale) + other["A"]
        p_in = intake("protein", eat)
        status += D_K * d_in - status / D_TAU
        reserve = max(0.0, reserve + a_in - NEED["A"])
        tot["protein_extra"] += max(0.0, p_in - NEED["protein"])
        if status < D_LOW and tot["d_low_day"] is None:
            tot["d_low_day"] = day
        if reserve <= 0 and tot["a_empty_day"] is None:
            tot["a_empty_day"] = day
        rows.append((day, price["milk"], price["egg"], d_in, status, reserve / NEED["A"]))
    return rows, tot


def show(label, rows, tot, marks):
    print(f"\n== {label}")
    print(f"{'day':>5} {'milk$':>7} {'egg$':>6} {'D in':>6} {'D status':>9} {'A reserve (days)':>17}")
    for d in marks:
        if d < len(rows):
            r = rows[d]
            print(f"{r[0]:>5} {r[1]:>7.2f} {r[2]:>6.2f} {r[3]:>6.1f} {r[4]:>9.1f} {r[5]:>17.0f}")
    print(f"   D status first below {D_LOW:.0f}: day {tot['d_low_day']}   "
          f"A reserve empty: day {tot['a_empty_day']}   "
          f"unsold servings: {tot['unsold']:.1f}   protein over need (g): {tot['protein_extra']:.0f}")


def no_shock(day, supply, other, a_scale):
    pass


def milk_off(day, supply, other, a_scale):
    if day >= 30:
        supply["milk"] = 0.0


def milk_off_30_days(day, supply, other, a_scale):
    if 30 <= day < 60:
        supply["milk"] = 0.0


def all_vitamin_a_off(day, supply, other, a_scale):
    if day >= 30:
        other["A"] = 0.0
        a_scale.update({i: 0.0 for i in ITEMS})


def milk_egg_a_off(day, supply, other, a_scale):
    if day >= 30:
        a_scale.update({"milk": 0.0, "egg": 0.0})


def glucose(drink_g, hours=48):
    """Fast stream, excess glucose units. Meals release over 2 h, an energy drink over 30 min."""
    tau, g, peak, area = 1.5, 0.0, 0.0, 0.0
    meals = {8: 60, 13: 70, 19: 70}                      # hour of day -> grams of carbohydrate
    drinks = {10: drink_g, 15: drink_g} if drink_g else {}
    for step in range(hours * 12):                       # 5-minute steps
        t = (step / 12.0) % 24
        inflow = sum(gr / 2.0 for h, gr in meals.items() if h <= t < h + 2)
        inflow += sum(gr / 0.5 for h, gr in drinks.items() if h <= t < h + 0.5)
        g += (inflow - g / tau) / 12.0
        peak, area = max(peak, g), area + g / 12.0
    return peak, area


if __name__ == "__main__":
    rows, tot = run(120, no_shock)                       # sanity: a balanced baseline stays put
    assert abs(rows[-1][4] - D_STATUS_BASE) < 0.01, "baseline D status should hold"
    assert abs(rows[-1][1] - 1.0) < 1e-6, "baseline prices should hold"
    assert tot["unsold"] < 1e-6

    marks = [0, 29, 30, 31, 40, 60, 90, 119]
    show("baseline: nothing changes", rows, tot, marks)
    show("milk stops on day 30 and does not return", *run(120, milk_off), marks)
    show("milk is off for days 30 to 59, then returns", *run(120, milk_off_30_days), marks)
    long_marks = [0, 29, 30, 130, 230, 231, 600, 1000, 1299]
    show("ALL vitamin A removed on day 30 (every food and every other source)",
         *run(1300, all_vitamin_a_off), long_marks)
    show("only the vitamin A in milk and eggs removed on day 30",
         *run(1300, milk_egg_a_off), long_marks)

    p0, a0 = glucose(0)
    p1, a1 = glucose(50)
    print("\n== energy drink feed (excess glucose units, 48 h; toy fast stream)")
    print(f"   meals only                peak {p0:6.1f}   area {a0:7.1f}")
    print(f"   meals + 2 x 50 g drinks   peak {p1:6.1f}   area {a1:7.1f}   "
          f"(peak x{p1 / p0:.1f}, area x{a1 / a0:.2f})")
