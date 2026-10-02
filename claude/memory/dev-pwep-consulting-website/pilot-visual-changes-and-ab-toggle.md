---
name: pilot-visual-changes-and-ab-toggle
description: For changes that alter a look Sahil has already approved, pilot them on one scene and ship them behind an A/B toggle rather than applying them across the whole world
metadata:
  pinned: false
---

# Pilot risky visual changes on one scene, and give him an A/B switch

When a change would alter the look of frames Sahil has already signed off — the example
was adding post-processing (tone mapping, bloom, vignette) across the whole Three.js
world — he does not want it applied everywhere in one go. Asked whether he needed to be
at the screen for it, he answered: "go ahead and do it for just the first scene, and then
we can decide." He also volunteered, unprompted, "i love the a/b testing idea also,
definitely do that", about putting the change behind a URL flag so the same frame can be
compared with and without it.

So the pattern he wants for any look-changing pass is: apply it to a single scene first,
keep the old look reachable behind a toggle, and let him judge before it spreads. This is
not timidity about the change itself — he is happy for the work to happen while he is
away. It is about keeping the comparison cheap for him, because he reviews by eye in a
browser and cannot diff a look he can no longer see.

The corollary is that "I cannot verify this visually from here" is not by itself a reason
to defer work. Deferring is what he was implicitly pushing back on; the pilot plus the
toggle is the way to do the work anyway without gambling frames he already likes.

## The toggle defaults OFF until he has confirmed the direction

Asked whether a new A/B knob should be on or off by default, Sahil chose off, and gave a
general reason rather than a case-specific one: "default off until we confirm that we're
going in the right direction. this is roughly our 8th pass on the city and we're really
struggling to get it right, so i am not willing to assume that things will work on the
first try."

So a new look-changing knob ships defaulting to the OLD behaviour. The old frame stays
what the page renders with no parameters at all, and the new work is something he opts
into with an explicit `?knob=1`. Flip the default only once he has looked and said the
direction is right. The reason is the same one behind the pilot rule above — he judges by
eye in a browser — with the added point that on a feature already several rejected rounds
deep, the prior is that the new attempt is also wrong, so it should not be what he sees by
default.

## The A/B defaults to the OLD look until he has said the new one is better

A rewrite ships behind its flag with the flag pointing at the EXISTING look, not
at the new one. I rewrote Saturn's ring disc and made the rewrite the default,
reasoning that the old one had already been rejected so anything was fair game.
Two review rounds later, with the new disc still worse than what it replaced, he
said: **"let's not make this the default until it's better than what we had."**

The reasoning is his, and it is about what the page renders while a rework is
still in progress. A rejected look that he knows is at least a known quantity;
a half-finished replacement is not, and every load of the site in between shows
him the worse of the two. Being told the old thing was bad is not permission to
ship something worse in its place by default.

So: build the new path, put it behind the knob, and leave the knob defaulting to
the old path. Give him the URL that turns the new one ON. Flip the default only
after he has looked and said it is better — which he does say plainly when it is
true, as he did with the city's mass model ("mass=1 is definitely better, let's
make that the default").
