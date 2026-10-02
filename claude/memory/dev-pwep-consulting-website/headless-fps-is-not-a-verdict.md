---
name: headless-fps-is-not-a-verdict
description: "Never declare a pwep world change expensive on the strength of a headless frame-rate reading — this box's GPU is translated and slow, and unequal warm-up makes the two runs draw different scenes"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 467db352-b606-4a80-ba6a-d7343c59437a
  modified: 2026-09-23T02:48:31.424Z
---

# A headless frame rate is a hint, not a verdict

I measured a change on the pwep world at "13 fps against 3 fps" with the headless
capture harness and wrote that into a handoff document as the reason not to adopt
it. Sahil did not accept the number as stated. He asked:

> "are you saying it's possibly very expensive or definitely very expensive?"

It was neither. He then opened both versions in his own Chrome and sent the
`?perf` panels: the change was **never slower** and in one pair was clearly
faster. My reading was wrong twice over, and both faults are easy to repeat.

## The two things that make a headless reading useless

**Unequal warm-up means the two runs are not drawing the same scene.** Zones build
and arrive over several seconds, and textures upgrade from draft to full. A run
captured earlier is drawing far less. The tell is in the panel itself: compare the
`tris`, `draws` and `progs` rows between the two frames before comparing `fps`. If
those differ, the frame rate is measuring how far through loading each page got,
not the change. In every pair I have looked at, the slower frame was simply the
one drawing more triangles.

**This box is not his machine.** It reaches the GPU through Mesa's d3d12
translation layer and runs several times slower than his native Chrome, and it is
shared with about ten other Claude sessions. `scripts/load-time.cjs` says this in
its own header: use it for shape and for A/B, and read the real figure off his
`?perf` panel.

## What to do instead

For anything that comes down to frame rate, ask him to open the two URLs and read
the panel — it costs him under a minute and it is the number that actually
matters. Tell him which rows to read: `fps` and `worst`, plus the `lowest` line,
and warn him that `fps` sits pinned at 60 (16.7 ms) whenever there is any headroom
at all, so it only reveals a problem once headroom runs out. Also tell him to wait
until `lowest` shows a number rather than "waiting for every zone to warm", and to
scroll to the heavy part of the scene rather than measuring at the top of the page.

If a headless number is all there is, report it as a hint with its confound named,
never as the reason a change cannot ship.
