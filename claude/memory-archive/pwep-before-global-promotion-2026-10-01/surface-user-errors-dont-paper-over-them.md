---
name: surface-user-errors-dont-paper-over-them
description: "When Sahil makes a mistake in input the tool accepts, he wants a visible error rather than lenient parsing that silently corrects it"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 293a2d8a-57f8-47a2-ac78-9e7915dd559c
  modified: 2026-09-07T00:26:14.451Z
---

# Tell Sahil he made a mistake; do not silently correct it

On the pwep world, the tuning knobs are URL query parameters (`?bloom=`, `?real=`,
`?thresh=`). Sahil twice typed a malformed query — `?thres=` instead of `?thresh=`, and a
second `?` in the middle of the string, as in `...&?real=0`, which makes the parameter's
name literally `?real` so `get('real')` returns null. Both silently did nothing, and both
cost a round of review because he was comparing two URLs that were secretly identical.

My fix was to make the parser lenient: strip a stray leading `?` from every key so the
parameter reads as the one he obviously meant. He rejected that approach and asked for the
opposite: **"just make it throw a visible alert on screen if the url is malformed instead
of making it read URLs more resiliently so that i know i messed it up, that will make this
easier in the future - i can just fix my own mistake."**

The general preference: when he gives input that is wrong, he wants to be told, on screen,
immediately. Lenient parsing hides the mistake and teaches him nothing, so the next time he
mistypes something the tolerant path does not happen to cover, he is back to debugging a
knob that appears to do nothing. A loud, specific error is cheaper for him than a quiet
correction, because he is the one at the keyboard and he can fix it in a second once he
knows.

Apply this beyond URL parsing: prefer failing visibly on bad input over guessing what was
meant, in anything he drives by hand.
