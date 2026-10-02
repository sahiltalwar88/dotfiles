---
name: outlined-buttons-not-filled
description: "On Sahil's world sites, make a call to action prominent with an outlined accent button, not a solid filled block — he finds a filled button too high-contrast"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 467db352-b606-4a80-ba6a-d7343c59437a
  modified: 2026-09-22T03:27:27.445Z
---

# Give a prominent button an accent outline, not a solid fill

When I made the cross-site call to action at the end of `/personal` and
`/consulting` more obvious, I promoted its button to a solid block of the accent
colour with the background colour as its text. Sahil rejected the contrast:

> "take this approach so we don't have such a high level of contrast for the
> button"

He attached a picture of the treatment he wanted instead — a nearly black button
carrying a bright accent-coloured border about two pixels wide, accent-coloured
mono text in the site's usual letterspaced upper case, and a faint outer glow.
That is the site's ordinary `.btn` with its text recoloured to the accent and its
edge thickened, not a new component.

The lesson generalises past that one button. The world pages are very dark, so a
filled accent rectangle is the loudest thing on the screen by a wide margin and
reads as a banner rather than as a link. Prominence on these pages comes from the
accent colour, edge weight, glow and size, while the fill stays dark. Filling with
the accent is still right on **hover**, where it is a momentary state rather than
the resting look.

A button can be clearly primary this way: the neighbouring secondary buttons drop
to a grey ghost outline with grey text, so the accent edge and accent text are
enough to make the important one win.
