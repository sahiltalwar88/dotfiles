---
name: his-boxes-mark-appearance-not-geometry
description: "A box Sahil draws on a pwep frame marks the LOOK he wants changed, not the list of objects whose geometry happens to fall inside it — name the visual feature back to him, not the pick results"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 1a5f1179-2648-4713-b7cb-7a273b973c0d
  modified: 2026-09-20T05:21:43.657Z
---

# A box marks a look, not an object list

When Sahil draws a rectangle on a frame of the world, he is pointing at something
he can *see* — a colour, a band, a hard edge, a brightness. He is not enumerating
the meshes inside the rectangle. Those are two different things, and picking the
front-most geometry at a few pixels inside his box answers the wrong one.

This went wrong on the city/mountain fog seam. He boxed a wide strip across the
far edge of the city and a tall box over the elevated highway. I ran `--pick` at
points inside both, got back instanced tower blocks, the highway deck and the
traveller, and proposed three new knobs to fade the *towers and the deck* into the
mountain. He came back with:

> "i am talking about only the fog AFTER all the towers, in the purple band BEYOND
> the far edge of the river ... so it shouldn't impact the towers at all."

The towers and the deck were inside his boxes only because they are in front of
the thing he meant. What he meant was the flat, uniformly bright slab of ground
filling the box behind them — an object my picks had reported as an incidental
second or third hit.

A second, sharper version of the same mistake followed immediately. Having drawn
his boxes correctly onto my own capture, I then profiled a pixel column that ran
mostly *above* them, found a fog gradient on the mountain flank, and rebuilt that
instead — the one part of the frame he was happy with. He asked, fairly, whether I
had actually opened the image. Drawing the box is not looking at it: the
measurements have to be taken from pixels INSIDE the rectangle, and a crop zoomed
to the box's own bounds should be opened and described before any column is
sampled outside it.

So the order is: reproduce his box, then ask what *visual feature* inside it is
unusual — the flat area, the hard line, the colour that does not belong — and
identify the surface responsible for THAT. Picks are for confirming which surface
produces a feature you have already named, not for deciding what the subject is.
When several objects sit in the box, say which one you think he means and why,
in the sentence where you restate the request, so a wrong guess costs a word
instead of a round of measurement and a knob proposal built on the wrong thing.
