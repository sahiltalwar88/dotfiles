---
name: damp-nudges-never-position-requests
description: "When damping or hijacking scroll input on the pwep world, slow the nudges (wheel, page keys, touch) but never the inputs where the user is asking for a specific position — scrollbar dragging above all"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: df663e2d-4272-457c-9ca8-932bb83ef806
  modified: 2026-09-20T07:42:58.905Z
---

# Damp the nudges, leave the position requests alone

When Sahil asked for the pwep world's scroll speed cut, the implementation had to
take over the browser's scroll handling. Asked to extend it beyond the wheel, he
drew the line himself:

> "let's also fix pagedown / page up / space / touch, leave scrollbar dragging
> alone because that's intentional by the user"

The distinction he is making is between two kinds of input, and it is worth keeping
because it decides the behaviour of anything that intercepts scrolling:

- **Nudges** — the wheel, PageUp/PageDown, space, the arrow keys, a touch drag.
  The user is asking to move *some amount* in a direction. The amount is ours to
  scale, and damping them is what makes the journey read at the pace he wants.
- **Position requests** — dragging the scrollbar, Home/End, clicking an anchor
  link. The user is asking to be *at a particular place*. Slowing these fights
  them: they have already said where they want to be, and damping only adds lag
  between the request and arriving.

So damp the first group and pass the second through untouched. A glide that is
still running when a position request arrives must also yield to it rather than
drag the reader back to its old target.

A related trap this exposed, which is mine rather than his: calling
`preventDefault` on a scroll event cancels the browser's **own** scroll animation
as well as its movement. Take that over and the smooth glide has to be rebuilt by
hand, or every input lands as a hard jump — which is exactly what he reported, in
his words "extremely jumpy and jagged and jarring". If you remove a browser
behaviour, you own replacing everything it was doing, not just the part you meant
to change.
