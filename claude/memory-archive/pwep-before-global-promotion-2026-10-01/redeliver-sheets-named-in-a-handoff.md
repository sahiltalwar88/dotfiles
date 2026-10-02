---
name: redeliver-sheets-named-in-a-handoff
description: "A screenshot named in a pwep handoff document has probably never reached Sahil - re-send the URLs when taking over, do not assume he has seen them"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 141ee289-e785-4bbe-a523-88423ca6bc39
  modified: 2026-09-17T20:45:09.489Z
---

# A sheet listed in a handoff is not a sheet he has seen

When taking over `pwep-consulting-website` work from a previous session, the handoff
document typically lists A/B sheets by filename — "Sheets: `sign-large.png`,
`sign-decals.png`, `river2-navy.png`" — as evidence that a change was checked. It is easy to
read that list as "Sahil has reviewed these" and to plan only the missing ones.

He has probably not seen them. Offered a plan that reused the already-made sheets and only
captured the gaps, he answered: **"b, but show me those verification sheets again please, i
don't think i saw them."**

So when a handoff names existing captures, **re-deliver every one of them as
`http://localhost:4321/testing-screenshots/<name>.png` URLs, organised item by item**, before
or alongside any new capture work. Open each one first and confirm its two halves actually
differ, because a sheet made by another session against older code may no longer show
anything — the rule against sending an invisible A/B applies to inherited sheets exactly as
it does to ones I make.

The underlying reason is that a file written into `testing-screenshots/` reaches him only if
someone hands him the served URL. A previous session finishing a capture and writing its name
into a plan document does not put it in front of him, and he cannot act on a review list whose
evidence he has never opened.
