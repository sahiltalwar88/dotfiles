---
name: box-the-same-region-he-boxed
description: "When Sahil marks regions on a pwep screenshot, reproduce his exact boxes on your own capture and confirm they contain the same thing before diagnosing anything"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 141ee289-e785-4bbe-a523-88423ca6bc39
  modified: 2026-09-18T20:48:00.780Z
---

# Reproduce his boxes before you diagnose anything

When Sahil marks regions on a screenshot of the `pwep-consulting-website` world, the first
step is to **reproduce those same boxes on a capture of your own and check that they contain
the same objects he was pointing at**. Not something nearby, not something that would explain
the symptom — the same pixels.

This went wrong three times in a row on one bug. He reported "glitchy lights near the river".
I diagnosed floating lamp spheres from a still and fixed those. A subagent then diagnosed
sub-pixel lamps popping and fixed those. Sent back with a new theory, it diagnosed the water's
reflection cells and fixed those. Every one of those was a real fault and none was his. He had
boxed **lights on the roads and walkways**; we had each been looking at the water. His
correction:

> "what you showed in your screenshots obviously is not the same thing that i boxed in my
> screenshots. next time, verify that you are in fact talking about the same thing by looking
> to see if you've boxed the same areas rather than assuming you're right."

He also had to correct a premise I had carried into the diagnosis: I repeated a stale note
that "from the flyover the water reads as a street", and used it to argue his boxes were on
water after all. That trap was fixed long ago — the river has its own colour now. **A trap
recorded in the project docs is a snapshot, not a current fact**; check it still holds before
reasoning from it, especially when it is doing the work of dismissing what he actually said.

The practical procedure, before any theory:

1. Ask for the URL and scroll position of his frame if the `?perf` panel is not legible in it
   (the lens row gives the camera).
2. Capture that frame, draw the same boxes with `scripts/ab-sheet.py --mark=X0,Y0,X1,Y1`, and
   look at what is inside them.
3. Use `--pick` at those exact pixels to name the objects, and say what they are **before**
   proposing a cause.

The underlying failure is treating his marks as a hint toward a region and then following a
plausible fault found nearby, rather than treating the marks as the specification of what to
explain. Three confident, well-evidenced fixes for the wrong thing cost far more of his time
than one question would have.
