---
name: ship-batches-behind-one-auto-switch
description: "When shipping a batch of pwep world changes Sahil has not reviewed, keep every knob default-off and add one master switch that turns on your whole take at once"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 2d01ad48-93e3-4537-a877-986a99730159
  modified: 2026-09-13T06:07:09.198Z
---

# Ship unreviewed batches default-off, behind a single master switch

When a round of work on the pwep world lands that Sahil has not yet seen — especially
an autonomous run while he is away — every individual knob stays **default-off**, and
on top of that there is **one master switch that enables the whole take at once**.

His instruction, given when I proposed the opposite:

> "do the inverse - default-off; make knobs for everything but put everything behind a
> single on/off switch as well - so like 'auto=1' or something for your take on what you
> think looks best, and auto=0 for all those knobs to return to their current defaults"

So the shape is: `?auto=1` renders my recommended combination of everything in the batch;
`?auto=0` (the default) renders exactly the city as it was before the round; and each
individual knob still works on its own, overriding whatever `?auto` would have set, so he
can bisect a batch down to the one change he dislikes.

I had recommended the reverse — shipping default-ON with a single `?classic=1` escape
hatch — on the reasoning that otherwise he wakes to a city that renders identically to
the night before and has to type knobs to see any of the work. He rejected that. The
asymmetry matters to him: the bare URL must keep rendering the look he last approved,
and seeing new work should be the thing that takes an explicit action, not reverting to
known-good.

This also matches what the project's own plan documents already say — every knob added in
a round is default-off, because a change to a look he has approved ships behind a switch.
The master switch is what makes that rule survive a large batch, where flipping fifteen
knobs by hand to see the round's combined effect is otherwise impractical.

Implementation note: the knob's default has to be computed from `?auto` rather than being
a literal, i.e. read `auto` first and then use `num('grid', auto ? 1 : 0)`, so that an
explicit `?grid=0` still beats `?auto=1`.
