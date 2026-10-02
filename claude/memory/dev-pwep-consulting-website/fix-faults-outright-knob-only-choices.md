---
name: fix-faults-outright-knob-only-choices
description: "On the pwep world, a fault Sahil reports should be fixed outright with no URL knob — knobs are for taste decisions he wants to A/B, not for bugs"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 136562f3-24dd-4e08-87a6-22a6f98cde61
  modified: 2026-09-22T06:55:54.197Z
---

# A fault gets fixed; only a taste decision gets a knob

Sahil asked for the pwep world's trees and city to stop popping in with the
instruction: "don't build knobs, just make them fade in AFTER they're fully
loaded."

This narrows the standing rule recorded in `one-knob-per-change-not-one-per-batch.md`.
That rule is real, but it applies to **changes of appearance he will want to
judge** — a new look, a tuning value, an alternative treatment. It does not
apply to something he has reported as broken. A pop-in, a collision, a wrong
position or a visible glitch is a fault, and a fault should simply be corrected
in the default path, with no switch, no A/B and no way back to the broken
behaviour.

The practical test before adding a knob: would Sahil plausibly ever set it to
the other value? If the other value is "the bug", the knob is noise — it adds a
registry entry, a `KNOBS.md` row and a branch in the code for a state nobody
wants. If the other value is a genuine alternative he might prefer, it earns its
knob.

This matters because knob sprawl is real on this project: the registry passed
500 entries, and every knob is code that has to keep working. It also fits his
standing bar that functionality is the asset and code is the liability.
