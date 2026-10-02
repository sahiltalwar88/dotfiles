---
name: pass-his-subagent-briefs-verbatim
description: "When Sahil words a brief for a subagent, hand it over verbatim — propose improvements to him first rather than substituting your own wording, and never append a constraint that forbids what he asked for"
metadata:
  node_type: memory
  pinned: false
  originSessionId: e9992ae1-c104-4373-b637-f5b53db31550
  modified: 2026-09-24T03:18:21.088Z
---

# When he words a brief, the subagent gets his words

When Sahil describes what he wants a subagent to produce — especially
`visual-fable` for design work on the pwep world — his phrasing is the brief, and
it goes to the agent unchanged. He said so while planning the version archive's
index page:

> "and give fable that *exact* prompt that i gave you"

and immediately after:

> "or, if you have a suggestion for how to improve the prompt, tell me. but don't
> give it a different prompt unless you run it by me first"

So the rule is not "never improve the prompt" — it is that **a rewrite is a
proposal, not a decision**. Show him the change and let him approve it. In
practice the useful move is to keep his words intact as the brief and *append*
the context the agent cannot know: file paths, established facts, constraints,
where assets live. Adding material around his wording is different from replacing
it, and it is what he actually wants.

The reason this matters is that his phrasing carries intent that a tidied version
loses. "Style it to match the website creatively, tying in the versions into the
story of both of these websites" is doing real work — it tells the designer the
index is part of the narrative, not a list. A cleaner paraphrase would very
likely drop exactly that.

## The appended constraints must not forbid what he asked for

Appending context is right, but on 2026-09-23 I appended a guardrail that
contradicted his actual request and nearly buried it. He had specifically
proposed putting the Observatory's mountain into the city skyline card so its
pop-in would be hidden. In the brief I demoted that to one of two "fallbacks",
and then added a constraint of my own — "do not undo the city skyline card, he is
delighted with it" — which as written forbade touching the very thing his plan
required. His correction:

> "i *specifically* suggested adding the mountain's silhouette to the skyline
> card to avoid the pop. but if it can come up with a better solution, i would be
> happy with that"

Two habits come out of it. **Rank his own proposal first** — if he names a
solution, it is the route to try, and anything I think is better is an
alternative for the agent to weigh and justify against it, not a replacement for
it. And **read every constraint back against his request before sending**: a
guardrail meant to protect finished work ("don't regress X") reads to an agent as
"don't go near X", which is how a well-intentioned instruction silently rules out
the answer. Say what must not regress and how it will be re-measured, rather than
putting the area off limits.
