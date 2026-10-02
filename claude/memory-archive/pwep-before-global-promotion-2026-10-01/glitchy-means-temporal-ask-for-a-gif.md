---
name: glitchy-means-temporal-ask-for-a-gif
description: "When Sahil calls something in the pwep world \"glitchy\" or \"flickering\", it is a motion artefact a still cannot show — ask for a GIF and diagnose by comparing frames, not from one screenshot"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 141ee289-e785-4bbe-a523-88423ca6bc39
  modified: 2026-09-18T16:31:44.214Z
---

# "Glitchy" means it moves, and a still frame cannot show it

When Sahil reports that something in the `pwep-consulting-website` world is "glitching",
"flickering" or "glitchy", he is almost always describing a **temporal** artefact — something
that changes frame to frame while the scene is still. A single screenshot cannot show it, and
neither can the usual A/B sheet, because both sides are stills.

This cost two wasted rounds. He reported glitchy lights near the river; I diagnosed floating
lamp spheres from a still and fixed those, then a subagent diagnosed sub-pixel lamps popping
and fixed those too. Both were real faults and neither was his. He finally said: **"i think
you are likely fundamentally misunderstanding what my issue is. let me show you the glitching
in a gif"**, then boxed four regions and explained: **"compare them frame by frame. you will
see that they're constantly in motion, forming almost a QR code like pattern instead of a
steady light."** The actual fault was aliasing of a sub-pixel repeating pattern, which is
invisible in any one frame by definition.

So when he uses those words:

- **Ask for a GIF, or for the boxed regions, before diagnosing.** He is willing to produce
  one and to point at exactly where to look. A still he sends alongside the word "glitchy" is
  a location hint, not the evidence.
- **Diagnose by comparing frames, not by reading a frame.** The technique that works is to
  hold the camera still, read the frame back twice a second or two apart, and count the pixels
  that flip by more than about 40/255 inside a crop. A steady element gives roughly zero. Then
  nudge the camera slightly and diff again: true aliasing *reshuffles* rather than translating.
- **The A/B sheet is the wrong deliverable on its own** for this class of bug. The proof is
  the before/after count of flipping pixels; ship that number with the image.

The general shape of the mistake is answering a question about motion with evidence about a
moment. Two different people independently produced a plausible, well-evidenced fix for the
wrong fault because both were reasoning from stills.

## When you cannot see it, hand him URLs — he has offered

Some faults the capture harness **cannot** show at all. `?shot=1`, which every capture sets,
freezes the camera bob (`engine.ts`), and the bob is what re-quantises a sub-pixel pattern; the
rig also renders at a fraction of his window, so anything living at one or two pixels on his
screen is gone before a capture is taken. On the river-lamp bug, five successive theories were
built and measured headlessly and every one of them died in his browser.

Sahil's standing offer, stated twice: **"if you need me to look, just give me the urls and i
will look"** and "tell me if you need me to verify which sub-portion is actually fixing the
issue". Take it. When the fault is invisible to the harness, the fast path is not another
capture — it is a short, ordered list of URLs for him to try.

The form that works:

- **Bisect before fixing.** Ship toggles that turn candidate terms OFF one at a time so he can
  find *which object* is at fault, rather than shipping candidate fixes and asking him to judge
  each. One `&rivlit=0` from him settled in a minute what five headless rounds could not.
- **Each toggle must change exactly one thing and remove no light.** He rejected `&riverwalk=0`
  as an answer precisely because it deleted the light source: "it's not a fix, it's just
  avoiding the issue."
- **Give the URLs plainly, ordered, with what each result would prove**, and say which single
  parameter to append to the URL he is already on.
- Where no off-switch exists, build throwaway diagnostic knobs for him rather than guessing.

The general lesson is to treat him as the instrument when the instrument I have is blind, and
to spend his attention on isolating the cause rather than on judging a sequence of guesses.
