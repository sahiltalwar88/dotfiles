---
name: no-invisible-ab-tests
description: "Never hand Sahil an A/B whose two sides look the same to the eye; strengthen the change until it is plainly visible, or discard it"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 48ac07cb-5b80-4f81-a14d-2066a34cfb35
  modified: 2026-09-11T04:40:46.729Z
---

# Never show Sahil an A/B that looks identical

Sahil's standing instruction on the pwep world: **"do not show me a/b tests that look
identical; if you find that something did not make a difference, adjust the knob until
it does or discard that attempt."**

The trigger was a round where three new city knobs (`pane`, `spill`, `recess`) were
delivered with measured mean differences of 2 to 5 out of 255 — several times the
capture noise floor, and reported as "real" on that basis. On his screen two of the
three made "absolutely no difference". A difference that a pixel-diff can detect is not
the same as a difference a person can see, and he judges by eye.

So before presenting any A/B:

- Look at the two frames yourself, at the scale he will see them, and ask whether the
  difference is obvious without being told where to look. A measurement above the noise
  floor is necessary but nowhere near sufficient.
- If it is not obvious, raise the knob's strength (or its default) until it is, then
  present it. An exaggerated version he can see and dial back is useful; a subtle one he
  cannot see wastes his review and his trust in the next A/B.
- If no strength makes it visible, say so and drop the attempt rather than shipping it
  as a knob.

The reason is cost and trust: he reviews in a browser, every A/B costs him time, and an
A/B that looks identical reads as either a broken change or a claim that was never
checked.

## Visible is not enough: check the direction, and check between the zones

On 2026-09-16 he pushed further, after a night of work on the Observatory and the Archive:
"did you actually look at these screenshots to verify that you were moving in the right
direction and that there was an obvious difference? if not, please do moving forward."
Two ways I had fallen short. A cloud change was plainly visible and I reported it as a
win, and on his screen it was "neutral to slightly worse". I had judged that it was
different, not that it was better. And I captured only the centres of the zones, so I
never saw the faults he found at the positions in between: trees glowing through fog on
the approach, and a tower visible from beneath its cloud deck during the climb.

So for every visual change: look at the frame and decide honestly whether it is better,
not just whether it changed. Also capture the transitions the change touches (the
approach, the climb, the moment an object appears), not only the resting frame of each
zone. A change that fixes the resting frame and breaks the approach is a regression.

## A knob you recommend must be proved to move the number first

On 2026-09-20 he asked for the world's scroll speed at 50%. I halved the `?rate`
default, wrote him a confident explanation of the consequences, and offered
`?rate=700` versus the new default as the A/B. He came back with "when i scroll one
time on rate=250 and the normal rate, it scrolls down the exact same amount. am i
missing something?" He was not: `?rate` feeds a page-spacing formula that floors the
result at the copy's own height, so on most legs the travel term was discarded
entirely and the knob did nothing at all. I had reasoned about the formula instead of
measuring the page it produces.

The rule generalises past visual A/Bs. Before telling him a knob or a default will
have an effect, **measure the quantity it is supposed to change, at both settings**,
and quote the two numbers. For anything that changes layout or pacing this is cheap —
a short Playwright script reading `scrollHeight` and the section marks answers it in
under a minute, with no rendering settle needed. An argument from the source is not a
measurement, and a formula that looks like it scales something may be clamped,
floored or overridden downstream.
