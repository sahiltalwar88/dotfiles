---
name: test-every-cause-he-names
description: "When Sahil names several possible causes for a pwep fault, test all of them — finding a plausible mechanism in the first one is not proof it is the cause"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: ddd7af3a-c3d4-43ff-b9c6-17f4c071a804
  modified: 2026-09-21T00:37:09.976Z
---

# When he names candidate causes, test every one before concluding

When Sahil suggests what is behind a fault in the `pwep-consulting-website` world, he
usually names more than one candidate, because he has been looking at the thing in a real
browser and knows which knobs are near it. Those names are evidence. Finding a plausible
mechanism inside the *first* candidate does not discharge the rest of the list.

He reported that the river had gone still and said:

> "yes, it is likely to be rivsteady or rivcalm"

I examined `?rivsteady`, found that one of its two folds drove the water's surface normal
to zero amplitude at flyover distance, and stopped there — treating a correct mechanism as
a sufficient one. I then argued `?rivcalm` could not matter, reasoning that `rivsteady`
already pinned the value `rivcalm` mixes toward, so `rivcalm` was a no-op. That reasoning
was true only *while* `rivsteady` was masking it; with `rivsteady` off, `rivcalm` became
the dominant term. Measured at the City flyover, `rivsteady=0` alone raised the water's
moving-pixel count from 300 to 420, while `rivsteady=0` plus `rivcalm=0` raised it to 1202.
`rivcalm` — the candidate I dismissed — was roughly four times the effect.

The shape of the mistake is stopping the search at the first satisfying explanation. A
mechanism that is real, that the code plainly supports, and that I can derive from the
shader maths can still be a minor contributor. Two interacting terms can each look
irrelevant when analysed with the other left at its default, which is exactly the case
where analysing one at a time gives the wrong answer for both.

So: when he lists candidates, test each one against a measurement, and test them in
combination, before saying which is responsible. The cost is one extra measurement; the
cost of getting it wrong is shipping a change that does not fix what he asked about while
telling him it does.
