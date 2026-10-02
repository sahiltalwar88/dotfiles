---
name: hand-him-the-test-when-verification-drags
description: "When verifying a pwep change is taking a long time, hand the testing to Sahil — including when the capture is merely queued, since waiting is waiting — but only while he is around; if he has said he is away, let the slow harness run"
metadata:
  node_type: memory
  pinned: false
  originSessionId: e9992ae1-c104-4373-b637-f5b53db31550
  modified: 2026-09-24T03:50:43.596Z
---

# When the harness is the bottleneck, give the test to Sahil

While chasing a dead-click bug on the pwep site I spent a long stretch writing
and rewriting a headless Playwright probe that kept landing in page states that
were not the one I meant to measure — the new opening card was up, or the
"Explore the world" toggle was on, or the section spacing had not settled. Sahil
interrupted three separate times to offer help:

> "do you want me to check screenshots for you? it seems like you keep running
> into timeouts"
> "or just test it myself?"
> "checking in, this is taking a LONG time. can i test for you?"

He has the site open in a real browser on the machine. For anything he can see
by looking — a click that does or does not work, a cursor, a hover, whether an
animation reads right — he can answer in seconds what costs me many minutes of
headless setup, and my version is running in a different page state anyway.

The rule: once verifying a change has become a bigger job than making it, say so
and hand him the test. Give him the URL, a short numbered list of what to look
at, and what the right answer looks like. Do not keep debugging the probe while
he waits, and do not treat his offer as politeness to be declined. If a single
direct observation already shows the fix working, that is enough to ship it for
him to confirm — a repeat-count script that disagrees is more likely broken than
the page.

This is not an argument against measuring. Offline measurement is still the
right tool for things he cannot see by eye, such as which zone is part-faded at
a given scroll position. It is about which of us is cheaper to ask.

## Queued counts as blocked — do not argue the distinction

On 2026-09-23 he offered again ("do you want me to just do the capture? it seems
like you're really struggling with that"). I declined, on the grounds that the
harness was healthy and my captures were merely QUEUING behind several other
sessions rendering on the same machine — a delay, I said, not a failure. He
rejected the distinction flatly:

> "queueing is the same thing - you're still sitting around waiting for a
> capture, right? ask me next time"

So the trigger is the WAITING, not the diagnosis of why. A capture that is
healthy but twenty minutes behind a queue costs him exactly what a broken one
does, and worse, declining his offer to explain that the tooling is fine spends
his attention on my status rather than on his site. When a frame is on the
critical path and is not going to arrive promptly — broken, slow, contended, or
behind a machine-wide lock — offer it to him with the URL and what to look for,
and let him decide whether to take it.

## But only while he is at the keyboard

He immediately bounded it:

> "one clarification for your memory: hand it to me IF I'M AROUND. If I've
> explicitly said I'll be away, let the harness do its slow work."

So this whole rule is about who is cheaper to ask *right now*. When he has said
he is going to bed, stepping out, or otherwise away, handing him a test stalls
the work until he returns, which is the opposite of what an unattended run is
for. In that case the slow, queued, contended capture is the correct tool and I
should simply let it run — and keep working on something else meanwhile rather
than idling on it.
