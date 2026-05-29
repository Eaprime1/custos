# Unexusi

The Unexusi is the identity and connection layer — the oxygen that links a
player's state to a terminal session and persists it across time and machines.

This folder defines **how this prima terminal concept connects to Unexusi**.
It is a specification, not an implementation.

## Files

| File | Contents |
|---|---|
| `connect.yaml` | Connection spec — profile schema, session events, BBS config |

## What Unexusi Does

- Authenticates players (they log in to Unexusi, not to the concept directly)
- Loads and saves the player's profile (XP, quests, state)
- Handles the session lifecycle (on_connect, on_disconnect events)
- Optionally exposes BBS features (leaderboard, message board) for multi-player

## What Lives Here vs. What Lives in Unexusi Core

This repo owns: the **profile schema** (what fields matter for this concept)
and the **session event list** (what happens on connect/disconnect).

Unexusi core owns: authentication, storage, transport, and the runtime that
reads this spec and acts on it.

Think of `connect.yaml` as the concept's API contract with the Unexusi layer.
