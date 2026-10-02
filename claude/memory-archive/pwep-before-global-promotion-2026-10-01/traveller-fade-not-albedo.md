---
name: traveller-fade-not-albedo
description: "The pwep traveller \"vanishing\" between forms was a cross-fade timing fault, not an albedo or lighting problem — and commit messages there record the attempted fix, not the cause"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 29ae9fee-e603-4d13-a426-f13d659a3572
  modified: 2026-09-16T03:13:17.537Z
---

# The traveller vanishing was a cross-fade timing fault

In the /personal world the traveller changes form as the journey goes on — bike, car, prop
plane, jet, rocket — and each change is a cross-fade between two models. At the Archive the
jet appeared to disappear entirely. Sahil corrected me on what caused it:

> "the jet vanishing was not albedo, it was that the old model was fading out too quickly
> while the new model was fading in too slowly, and because the new model was so small, it
> looked like the entire thing was disappearing"

So the fault was in the OVERLAP of the two fade curves, made worse by the incoming model
being small in frame. It was not the vehicle's colour against a bright sky, and it was not
fog or opacity. Any future report of the traveller "fading into the background", vanishing,
or thinning out at a zone boundary should be investigated as fade timing and relative size
first.

**The fade and the morph are SETTLED — do not change them.** The fix landed long ago and
Sahil said so directly ("that was fixed long ago, don't change that!"). The cross-fade now
raises each form's opacity to the square root of its weight, so both machines stay solid
through the middle of a hand-off and a brief double image is accepted as the lesser fault.
Treat that code as off limits unless he asks for it, and when a piece of work merely
inspects it, say plainly that it was read and not modified — hearing that an old fix
"matches" can otherwise sound like it was just re-implemented.

The general lesson is larger than this one bug. The commit messages and doc comments in this
repo record the change that was MADE — in this case an albedo lift from #3a4150 to #6b7488 —
and a later reader (including a research subagent mining the history) will naturally read
that as the diagnosis. It often is not. The history is a reliable record of what was tried
and what Sahil rejected; it is not a reliable record of root cause. When a mined lesson is
about to drive new work, say where it came from so he can correct it, as he did here.
