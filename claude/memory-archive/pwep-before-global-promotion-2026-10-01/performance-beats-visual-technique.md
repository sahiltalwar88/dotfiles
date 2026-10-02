---
name: performance-beats-visual-technique
description: "On the pwep world, if a visual technique costs frame rate, Sahil wants the frames and a cheaper route to the look — do not spread the expensive technique further"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: e52085de-440b-4fd2-8339-fe3ddcc4919b
  modified: 2026-09-16T03:27:15.263Z
---

# Performance wins over any particular visual technique

Sahil has made frame rate a hard constraint on the pwep Three.js world: "overall
performance needs to improve from here, not degrade." When a specific technique turns
out to be what is costing frames, he does not want to be offered the trade-off and he
does not want the look defended — he wants the technique dropped and a cheaper route
found to the same impression.

He said this most directly when procedural normal-mapped rock made a mountain look
exactly the way he wanted, he had just asked for that treatment everywhere, and the site
had simultaneously become noticeably laggier. Asked which he would rather have, he
answered: "i would rather have performance and find another answer for the photorealistic
look. if you find that's the suspect, don't add it everywhere; instead pivot to finding a
better solution."

The instruction generalises past that one case. A technique being responsible for a look
he has already praised does not protect it. The right response to "this expensive thing
is the bottleneck" is to go looking for a cheap approximation of the same impression —
baked or vertex-level detail, silhouette and lighting work, fewer and larger draws —
rather than to keep the expensive version and spend the budget elsewhere, and rather than
to ship it more widely and let the frame rate fall.

## The target is 60 fps everywhere, and hidden detail should cost nearly nothing

On 2026-09-14 he set the bar concretely: **60 fps at every scroll position, in his normal
browser window** (about 1728x1340 on his machine), not an average. The trigger was the
city's street trees, which had been built with the Road's near-photoreal leaf-card
conifers and cost about 4.9 million triangles while sitting "almost entirely hidden in the
fog" — he estimated a 95% cut would be fine. His rule for such things: objects that are far
away or fogged "just have to look like the silhouettes of trees mostly, not actually look
like semi-photorealistic trees like the road section." So size detail to what the camera can
actually resolve through distance and fog, and treat a large triangle count on something
barely visible as a defect rather than a quality setting.

He restated the bar on 2026-09-15 when setting the budget for a beautification pass, and
added the escape hatch: **"60 fps at all times, no dips. if you encounter something that is
exorbitantly expensive - let's say more than 30ms - find a cheaper path or wait for input."**
So 30 ms of frame time is the line at which a technique stops being a tuning question and
becomes a decision for him. Below it, pick the cheap route and carry on; at or above it,
either find another way to the same impression or stop and ask — never ship the expensive
version and report the cost afterwards.
