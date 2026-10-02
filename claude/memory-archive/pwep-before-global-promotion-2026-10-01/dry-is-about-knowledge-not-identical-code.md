---
name: dry-is-about-knowledge-not-identical-code
description: Deduplicate only genuinely duplicated knowledge; never merge code that merely looks alike but serves different use cases
metadata:
    pinned: false
---

# DRY means one source for a fact, not one copy of a shape

Before any de-duplication work on Sahil's projects, apply the test from Nicolò
Pignatelli's "This Is Not The DRY You Are Looking For", which he pointed to directly
and called VERY important:

> "i DO NOT want you coupling things that happen to have the same code but use it for
> different use cases"

The original DRY principle is about knowledge and consistency — one fact stated in one
place — not about two files never containing the same characters. Two things that look
identical today but serve different purposes are *similar*, not *the same*. Merging them
buys a few saved lines and pays for it in tight coupling between unrelated components,
accidental complexity from an abstraction nobody needed, and a domain model that cannot
let the two diverge when their different purposes inevitably pull them apart. Going from
two specialised copies to one abstraction later is easy; going backwards out of a
premature abstraction is not.

So the question to ask of every candidate is **"is this one fact restated, or two
different things that currently rhyme?"**

- One fact restated — a list of zones repeated in the pages, the markup, the stylesheet
  and the audio table, all of which must agree by hand or something silently breaks —
  is real duplication. Give it one source and a test that proves the copies agree.
- Two things that rhyme — a production page layout and an internal review-tool layout, a
  live script and a dev-only draft's script, two closing sections whose copy already
  differs — stay separate, however similar the lines look.

When a pair is mostly the second kind but contains a genuine shared fact, extract the
fact and leave the two callers alone, rather than merging the callers.
