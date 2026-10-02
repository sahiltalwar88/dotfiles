---
name: report-knobs-with-ranges-and-recap-everything
description: "Every knob reported to Sahil needs its min, max, what those ends mean and a suggested value; and a report after he has been away must stand alone without scrolling back"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 48ac07cb-5b80-4f81-a14d-2066a34cfb35
  modified: 2026-09-12T21:44:27.259Z
---

# Report knobs with their ranges, and make the final report stand alone

Two related instructions Sahil gave after a long unattended session on the pwep world:

> "remember to tell me the min and max values for each knob are and what they mean, what
> the suggested value is, etc - i didn't see that here. similarly, make sure you include
> everything you did in the report at the end if i go away for a while like i did last
> night, i had to scroll up to understand some comments and i'm not sure if i missed
> anything still"

So, whenever a knob is mentioned in a reply:

- Give the **minimum and maximum**, say what each end actually looks like, and name a
  **suggested value** to try first. `?spandrel=1` on its own tells him nothing; "0 to 1,
  0 is off and 1 is the strongest, try 1" is usable. The range lives in `flags.ts` and the
  default at the call site, so both are cheap to look up and there is no excuse for
  omitting them.
- Say what it needs to work — many City knobs do nothing without `?fam` or `?facelines`.

And whenever he has been away for a stretch:

- The closing report must be **self-contained**. He should not have to scroll back through
  the session to understand a reference, and he should not be left wondering whether he
  missed something. List everything that landed, everything that was tried and rejected
  (with why), every default that changed, every question still open, and the URLs to look
  at. Assume the earlier messages are gone.

The underlying reason is that he reviews asynchronously, often hours later on a different
device, and a reply that depends on the conversation's scrollback is a reply he cannot
act on.
