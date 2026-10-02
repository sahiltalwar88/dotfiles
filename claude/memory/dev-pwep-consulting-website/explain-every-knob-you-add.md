---
name: explain-every-knob-you-add
description: "On the pwep world, every URL knob added in a round must be explained in plain language in the reply itself, with a suggested first test — code comments do not reach Sahil"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: baffd0aa-f21b-46f2-9b0a-21eb344831d7
  modified: 2026-09-08T20:11:21.169Z
---

# List and explain every knob in the reply, not just in the code

Sahil has repeatedly asked for a URL knob on every visual change so he can dial it
himself, and he has called that practice excellent. But adding the knob is only half
of it. After a round in which I added seven new parameters and documented each one
carefully in a `flags.ts` comment, he came back with: **"the only knob i understood was
leafsize, please explain the other knobs and give me suggestions for what to test
first."**

The comments in the source are not where he reads. He is sitting in front of a browser
with a URL bar, and what he needs is the name, what it does in plain language, what its
default and useful range are, and which one to try first. A knob he cannot interpret is
a knob he will not use, which wastes the whole point of shipping it.

So whenever a change lands behind a parameter, the reply that reports the change must
also carry:

- the parameter name and what it visibly does, in ordinary words rather than in terms of
  the shader uniform or the code path it feeds;
- its default and the range worth exploring, including the value that restores the
  previous look for an A/B;
- a short, ordered list of what to actually try first, written as full URLs he can paste,
  rather than a flat inventory of everything available.

Prefer a handful of well-chosen tests over an exhaustive list. The purpose is to get him
to the most informative frame in the fewest page loads, because his review is by eye in a
browser and every round trip is expensive.

## Give the WHOLE URL, ready to paste

A follow-up correction, and a small one that matters every single round: **"please give
me the entire url to make it easier to copy and paste into the url bar."**

So write `http://localhost:4321/personal?perf&plate=0.35`, not `?plate=0.35` and not
`/personal?perf&plate=0.35`. He is copying these straight into a browser while reviewing,
often several in a row, and a fragment he has to assemble by hand is friction on every
one of them. Include the scheme, the host and port, the path and the full query string,
as one unbroken string he can select and paste.

## Say how BIG the difference will be, and don't ship an A/B too small to see

A later correction of the same kind. I shipped a knob that switched the city's buildings
between one, two and three geometry families, explained it clearly, and gave him three
whole URLs to compare. He shot all three, could not tell them apart, and asked: **"i think
something may not be working; i don't really see much of a difference... am i missing
something?"**

Nothing was broken. The knob did exactly what it said — the on-screen counters proved the
new shapes existed — but the shapes it added covered about 2% of the city's screen area,
so the comparison could never have shown him anything. He spent a review round, and a
handful of screenshots, discovering that.

So before handing over an A/B, work out roughly what fraction of the frame the change can
possibly affect, and say so in the reply: "expect this to move about a fifth of the
skyline" or "this is a 2% change and you will probably not see it." If the honest answer
is that the effect is too small to see, the knob is not ready to be reviewed — either make
the change bigger first, or say plainly that it is not worth his time to look at yet.
Asking him to compare two frames that differ by a couple of per cent spends his attention,
which is the scarcest thing in this project, on nothing.

## Check it is in FRAME, not just in the scene

The next iteration of the same mistake. I made the city's landmark towers three times
taller, measured that they came to 10% of the scene's projected area, and told him to
expect an obvious difference. From the distant camera it was obvious. From the camera he
actually reviews the city at, it was not — because at that camera the landmarks are so
tall their crowns are above the top of the frame, and all he could see was that some
buildings had got thicker. His words: **"i was VERY confused by what you were expecting to
see with heroes until i realized that they're too tall for me to see with where the camera
is."**

Share-of-the-scene is not share-of-the-frame. Before promising a visible change, work out
what the review camera can actually see: its field of view, its height, its distance from
the thing, and therefore the band of the object that lands on screen. It is a few lines of
trigonometry against the camera in the code and it takes a minute. In this case it showed
that a 250-unit tower needs to be 400 units away for its top to be in shot, while the city
is only 300 units across — so the change could never have read from that viewpoint, and no
amount of tuning would have fixed it.

The general form: a scene has several cameras, and a change can be dramatic at one and
invisible at another. Say which camera you are promising the difference at, and check it
there.

## Give the ENFORCED bounds, not just the default

A later ask, after a round in which I shipped eight ring knobs with a default and a
first-test URL for each: **"give me context on what the bounds of each are and give me
some sample URLs to test that you think may be good."**

Two things were missing. First, `flags.ts` range-checks these parameters and refuses
anything outside the declared range with a red banner, so the actual minimum and maximum
are not decoration — they are what he will hit the moment he tries a value past the end.
State them as numbers: "0 to 45 degrees, default 21", not "try turning it up".

Second, per-knob first tests are not the same as suggested COMBINATIONS. He tests one URL
at a time and every load costs him a screenshot, so a handful of combined URLs that each
represent a coherent hypothesis — "this one is my best guess at the good look", "this one
isolates whether the fault is the shadow term" — is worth more than one-knob-at-a-time
sweeps. Offer both: the inventory with bounds so he can improvise, and a short ordered
list of combinations worth actually loading.

## Say which END of the range does what, every time

Stating the numeric bounds is still not enough. Sahil asked, after a round in which
he had a dozen ring knobs in front of him: **"please explain the dials matnear and
ringdens, including upper and lower bounds, defaults, and which bound means what
(e.g. upper bound means brighter mat, lower means dimmer, etc). also, please update
your memory to ALWAYS do this if it's not already saved."**

So the required shape for every knob, every time, is four things:

1. the name;
2. what it visibly changes, in ordinary words;
3. the **lower bound and what it looks like**, and the **upper bound and what it
   looks like** -- named as an appearance, not as a mechanism ("0.2 is a barely
   visible haze, 8 is a solid opaque sheet", not "sets optical depth");
4. the default, and what that default looks like relative to those two ends.

The direction is the part that is easy to leave out and impossible for him to
guess: some of these knobs invert (a knob that "thins the sheet as you approach"
is strongest at 0, not at 1), and several of them read backwards from their names.
He is dialling these in a URL bar with no source in front of him, so a knob whose
direction he has to discover by trial costs him a page load every time.

Give this whenever a knob is introduced AND whenever he asks about one later --
he should never have to ask twice for the same dial.
