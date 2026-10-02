---
name: explain-in-plain-language
description: Sahil wants technical explanations in plain language; he asks again when an answer leans on graphics or web-performance jargon
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 01953513-7273-4a86-95ad-dc1f9189f0d3
  modified: 2026-09-07T03:59:37.563Z
---

# Explain in plain language, especially rendering and performance internals

Sahil is an engineering executive and reads code fluently, but he is not a graphics or
browser-internals specialist, and he does not want to be handed vocabulary he then has to
decode. When an explanation leans on jargon he stops and asks for it again in simpler terms.
He has done this twice in one session on the pwep world project: he asked "sorry, what is an
auto-arm? i don't know what you mean" about a term I had invented for a piece of our own
code, and later "i did not understand your point about the passes contradicting each other.
give me a simpler explanation?" about a summary written in WebGL terms.

So write the first version the way he would want the second. Concretely:

- Name things by what they do for the reader or the page, not by the identifier in the
  source. "The thing that makes autoscroll start by itself" lands; "the auto-arm" does not.
- Terms of art from graphics and browser performance — shader linking, program variants,
  PMREM, parallel shader compile, pipeline creation — need a one-clause gloss the first time
  they appear in a reply, or they need replacing with a description.
- When two positions conflict, explain the mechanism in ordinary steps before naming the
  disagreement, so the disagreement has something to attach to.
- Coining a shorthand for a piece of our own code is the worst case: it sounds like an
  established term he ought to recognise, so it invites confusion rather than a question.

The cost of getting this wrong is a wasted round trip on a project where he is often waiting
on a reply before he can review something in the browser, which is the same reason he insists
on being asked questions up front rather than after the work.
