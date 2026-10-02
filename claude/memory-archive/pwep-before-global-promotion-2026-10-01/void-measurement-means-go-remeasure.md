---
name: void-measurement-means-go-remeasure
description: "When a measurement turns out to be invalid, Sahil expects a NEW measurement, not code left in unmeasured limbo — and a tidy explanation for a null result is a warning sign, not a conclusion"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 219b04d1-07d5-462c-b471-c7cbd683c7e2
  modified: 2026-09-23T22:45:51.078Z
---

# A void measurement obliges a new one

On the pwep world I measured a shader change, got a near-zero result, called it
invisible, and invented a reason why — that the Observatory is ambient-dominated
(1.1 ambient against 0.7 sun) and ambient light does not depend on the normal, so
normal work could not read there. It was a neat, plausible, mechanism-level
explanation. Then I discovered the measurement had been taken while another
session had clobbered the one-line call site that fed the feature, so it had
compared a no-op against a no-op. I reported the measurement as void, kept the
code at its off default, and moved on.

Sahil pushed back on exactly the right thing:

> "so you kept or killed that snow change, since it made no difference? or are
> you saying it did make a difference but your measurement was wrong - if so,
> where is the new measurement?"

Keeping unmeasured code is the worst of the options. Either it earns its place or
it goes, and only a measurement decides which. When I re-ran it properly the
change moved 37.4% of the relevant pixels by a mean of 2.38 levels out of 255,
against the 0.3% / 0.09 of the void run — a hundredfold difference. The tidy
explanation was wrong as well as unnecessary.

The rules this leaves:

- **A void measurement is an obligation to re-measure, not a licence to shrug.**
  Reporting "that number was invalid" is half an answer; he will ask for the
  other half, and he is right to.
- **Never leave code in the tree that has never been shown to do anything.**
  Functionality is the asset and code is the liability — unmeasured code is pure
  liability. Decide with a number.
- **Be suspicious of a satisfying explanation for a null result.** A mechanism
  that neatly explains why something could not possibly have worked is exactly
  what a broken test bench also produces. Check the feature is live before
  explaining why it is not visible.
- **Verify liveness offline before rendering.** A capture cannot tell a no-op
  apart from a technique that does not work; a probe that reads the actual input
  can, in a second. That is what `scripts/snow-check.sh` was written for, and
  the same shape applies to any knob, mask or attribute that a frame depends on.
