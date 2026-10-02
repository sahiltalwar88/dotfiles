---
name: correctness-must-not-cost-load-time
description: On the pwep world a fix that costs load time must pay for itself in something Sahil can see; a correctness-only fix with no visible payoff should be dropped for a comment instead
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 4471d77f-ae54-4385-b89d-35d2a4ad77f6
  modified: 2026-09-23T02:28:36.205Z
---

# A correctness fix is not worth load time on its own

Sahil's standing bar, given after I fixed a texture-upload bug whose visible effect
turned out to be almost nothing:

> "load time extremely matters to me - a correctness fix is NOT worth it if it costs
> a lot of extra load time. can we get the correctness without the extra time? if not,
> is that correctness actually worth anything? if it's preventing possible future bugs,
> drop a comment and let's move on - performance is very important, the site is
> sluggish and frequently stutters right now"

The ordering he wants applied to any fix that costs time:

1. Get the correctness **without** the extra cost if there is a way.
2. If there is not, ask honestly what the correctness actually buys. A fix whose only
   payoff is "the code now does what it claims" is not worth paying for.
3. If the value is only guarding against a future bug, **write a comment explaining the
   trap and move on** — do not ship the fix.

This is narrower and sharper than the existing note that performance beats visual
technique. It applies to work that is not visual at all: internal consistency, a lying
diagnostic readout, a leak, a silently failing call. None of those justify load time by
themselves.

Two habits that follow. **Measure the cost before proposing the fix**, not after he
challenges it — he will ask, and an unmeasured "this should be cheap" does not survive
the question. And when a fix turns out to buy nothing he can see, **say so plainly and
offer to drop it**, rather than defending it as correct; on this project a difference he
cannot see is a difference that does not exist.

Frame rate and load time are live problems on this site, not hypothetical ones — he
describes it as sluggish and frequently stuttering. Treat any proposed cost against that
background.
