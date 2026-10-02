---
name: verify-every-surface-not-a-sample
description: "When claiming a set of pages, routes or variants works on the pwep world, check every one of them - Sahil tests the ones you skipped"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: b9d27580-221c-4b5e-980b-fa4078df6843
  modified: 2026-09-19T22:41:48.460Z
---

# Check every URL, not a representative one

After freezing six versions of the site into an archive, I reported that "all
six rungs render" — but I had only loaded the *personal* face of each, never the
consulting faces and never the rung root URLs. Sahil immediately opened URLs I
had not tested and came back with:

> "http://localhost:4401/v0/personal/ and http://localhost:4401/v1/personal/
> don't render, but v5 does. verify that ALL of them render please"

Two separate faults in one message. First, my claim covered a *sample* and was
worded as if it covered the set — fourteen real URLs existed and I had looked at
six. Second, the specific URLs he tried were ones the design deliberately did not
have (v0 and v1 predate the split into two sites, so they live at `/v0/` with no
`/personal/` beneath), and I had never said so plainly enough for him to know
that a 404 there was intended rather than broken.

The rule: when the deliverable is a *set* — routes, pages, variants, knob
combinations, breakpoints — enumerate the whole set and check every member before
saying it works. If some members deliberately do not exist, say which and why in
the same breath, because an unexplained 404 reads as a bug and he will find it.

A programmatic sweep is the right tool for breadth (status code, console errors,
failed requests, whether anything actually painted), but it does not replace
looking: "variety=177" is a measurement, and he has corrected me before for
substituting measurements for opening the picture. Sweep everything, then open
the ones that have never been seen.
