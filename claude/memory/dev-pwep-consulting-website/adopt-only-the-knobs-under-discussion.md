---
name: adopt-only-the-knobs-under-discussion
description: "When Sahil approves a test URL and says to make it the default, adopt only the knobs the conversation was about — never the other parameters that happened to be in the URL"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 7856d116-b7d6-482b-8b93-85e48fdceee9
  modified: 2026-09-22T07:49:21.623Z
---

# A tested URL is not a list of defaults to adopt

On the pwep world, the normal way Sahil approves a change is to open a URL full
of knobs, look at it, and say some version of "looks good, make that the
default." That URL almost always carries parameters that have nothing to do with
the change under discussion — a diagnostic panel, a debug switch, a feature he
turned on for an unrelated reason.

On 2026-09-22 he approved
`/personal?voice=1&perf&fogseam=1&fadestart=240&dashstart=200&fadepow=0.7` and
said to set "those" as the defaults. He then interrupted with:

> "wait - DO NOT SET VOICE=1 AS DEFAULT, only the fog related ones"

`?voice=1` and `?perf` were incidental to how he was viewing the scene; only the
fog seam family was under discussion.

**The rule: adopt only the knobs the conversation was actually about.** Treat
every other parameter in the URL as scaffolding for the viewing session, not as
part of the approval. When it is genuinely unclear whether a parameter belongs
to the change, name the exact list back to him before editing anything — the
list is short and he can correct it in a word, whereas a wrongly adopted default
ships a behaviour change he never asked for and may not notice for days.

The same caution applies in reverse: do not quietly leave out a knob that *is*
part of the family because it was not written in the URL, when it only has an
effect once its master switch is on.
