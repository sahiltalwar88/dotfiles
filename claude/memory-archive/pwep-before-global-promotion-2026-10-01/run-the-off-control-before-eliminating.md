---
name: run-the-off-control-before-eliminating
description: "Never tell Sahil a cause is ruled out until a control run with the feature switched OFF is shown to move the metric — \"I changed X and nothing happened\" is worthless without it"
metadata: 
  node_type: memory
  pinned: true
  originSessionId: 9f6908d0-85c6-4955-b42b-5ea6ab02629f
  modified: 2026-09-20T07:32:58.908Z
---

# An elimination without a control is not an elimination

Sahil asked for this to be written down after a day spent on the pwep river's wall
flicker, in which I produced three confident wrong answers in a row and every one
of them was caught by a control rather than by thinking harder.

The rule: **before reporting that something is ruled out, show that the metric
responds when the feature itself is switched off.** "I changed X and the number did
not move" means nothing until a run that deletes the thing entirely is shown to move
that same number. Until then, "this change does nothing" and "this metric measures
nothing" look identical, and I have repeatedly reported the second as the first.

## The three failures, all the same shape

- A pixel mask of "warm bright pixels in the river box" scored 39.5 against a 7.6
  background and looked like a clean isolation of the artefact. Switching the light
  off entirely moved it **1.6%** — it had been measuring lamp globes and lit windows
  the whole time, and three candidates had already been "ruled out" on it.
- An in-page A/B that toggles a change halfway through a capture reads about
  **-9% even when the toggle changes nothing**, because the second frame set is
  systematically calmer. That inflated a result to -25% and I reported it as a
  finding before retracting it.
- Every diagnostic paint mode painted at a brightness above the haze glow ramp and
  the bloom threshold, so reading one "steady" proved only that it was steady *above*
  the amplifier that was making the artefact visible. The same mistake was already
  baked into an older mode and I repeated it three more times.

## Corollaries worth keeping

**A fix that MOVES a symptom rather than removing it means the mechanism is right and
the fix is incomplete** — not that the hypothesis was wrong. Fixing the river run's
end lamp moved the flicker one lamp inward; the obvious reading was "wrong theory",
and it was in fact the right theory with a second discontinuity one slot over.

**Check a hypothesis against the source before measuring it.** The diagnosis that
finally worked came from another session reading one line of shader code. My useful
contribution was verifying it in the source — finding that the suspect `clamp` was on
one of three code paths, not all three, and that a neighbouring gate was missing
entirely. Reading the code was faster and more reliable than a day of eliminating
things by eye.
