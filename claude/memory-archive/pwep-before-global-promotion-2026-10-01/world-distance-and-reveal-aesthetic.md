---
name: world-distance-and-reveal-aesthetic
description: "Standing art direction for the Three.js world — distant objects must be small and faint, and everything must fade and grow in rather than pop into existence"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 7cb17e0d-56e3-4b8d-89ce-c109a4c12041
  modified: 2026-09-03T20:38:55.022Z
---

# Distance and reveal rules for the scroll-driven world

Sahil has a standing rule for the Three.js world in the pwep-consulting-website project:
**anything far away should be small and faint, and nothing should ever pop into or out of
existence.** Objects must fade in and grow as the camera approaches them, and fade out as
it leaves. He raised this as a general principle covering the whole world, not as feedback
about one object, so apply it to any new scene element without being asked.

Two concrete consequences he has already corrected:

When a distant landmark is meant to be visible but not the focus — for example the black
hole seen in the background at the end of the personal site and the start of the consulting
site — the answer is to keep it and make it small and faint, not to remove it. Do not
delete a background element to solve a prominence or readability problem; scale it down and
dim it instead.

Hard visibility toggles are the usual cause of popping. The zone lifecycle in
`src/world/engine.ts` originally set `group.visible = dist < 1.6`, which snapped whole
zones on and off. It now ramps a per-zone `fade` and applies it to materials that can be
dimmed without a shader recompile: ones already flagged `transparent`, and custom shaders
exposing a `uFade` uniform. Opaque materials are deliberately skipped, because flipping
`transparent` per frame rebuilds the shader program. So when adding a new object that
should fade, either mark its material `transparent: true` at construction or give its
shader a `uFade` uniform — otherwise it will still pop.

The convention for custom shaders is two multiplied fade uniforms: `uFade` is owned by the
engine and reflects zone proximity, while `uGate` is owned by the object itself for
narrative reveals or distance dimming. Keeping them separate stops one from clobbering the
other.

Related lesson about reveals: gate a reveal on something physical, such as the camera
crossing a known z position, rather than on the engine's `local` zone-progress value.
`local` only reaches 1 at the exact zone centre, which is the bottom of a full-viewport
section, so a threshold on it leaves the object invisible for most of the section.

## Things leave the way they arrived, and individually

The rule is symmetric, and Sahil has now stated the exit half of it directly. Reviewing
the Casefile zone's leader lines — three annotation lines drawn from exhibit cards out to
marker rocks in Saturn's belt — he objected that all three vanished together:

> all 3 lines would disappear all at once; they should disappear as each of their
> respected selected works scrolled halfway off the screen - the reverse of when they
> render in the first place

Two things generalise from this. First, **an exit should be the entrance played backwards**
rather than a separate piece of behaviour: if elements arrive one at a time, staggered and
animated, they must leave one at a time, staggered and animated, in reverse. Second, **each
element's exit is keyed to its own trigger, not to a shared one** — the line goes when *its*
card leaves, not when the group does or when the zone boundary is crossed. A shared exit
condition is the usual reason a carefully staggered entrance ends in a collective snap.

So when building any staged or sequenced reveal, design the departure at the same time as
the arrival, and drive each element from its own state rather than from a group flag.

## "Fade in" does not mean "slowly" — mask the arrival instead

Do not read the rule above as licence for a long, gentle ramp. Judging the City's
arrival on /personal, Sahil settled on a reveal of half a second and said why:

> "so far, openup=.5 is the best for me - i'm not trying to drag out the fade-in,
> i want it to be nearly instant"

He had already rejected two attempts at making the transition itself prettier: an
ordered dither, twice, because he dislikes the stipple it leaves. What he wants is
for the MOMENT of arrival to be hidden or motivated by something happening in the
world, and then over with quickly — not stretched out where it can be watched. His
own suggestions were to withhold a thing until the camera is closer and let it come
out of the mist, or to reveal the whole frame the way the Road's foreground does.

A related discovery worth keeping, because it explains what he actually likes.
Asked what the grass does that the rest of the world does not, he described it as
fading "upwards into view out of the darkness at the bottom of the screen". The
grass material is not doing that at all: the bicycle's headlight ramps with the
zone reveal (`e.light.intensity = e.base * fade` in `engine.ts`), and its falloff
lights the near ground first, so the lit pool grows upward while the grass itself
is simply black until lit. **The reveal he likes is a thing being LIT, not a thing
materialising.** Reach for light, occlusion or camera movement to cover an arrival
before reaching for opacity.
