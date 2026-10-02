---
name: subagent-model-selection
description: "Sahil's opinions about which pwep-consulting-website tasks need the expensive fable agent are non-binding suggestions; use your own judgment, and re-check which spending mode he last put the session in"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: e52085de-440b-4fd2-8339-fe3ddcc4919b
  modified: 2026-09-05T04:47:29.519Z
---

# Choosing a subagent tier is my call, not Sahil's

On the pwep-consulting-website project Sahil often annotates individual pieces of
feedback with a guess at difficulty — "fixing the city is likely a fable level task",
"likely a fable task". These are **opinions offered in passing, not instructions**. He
said so explicitly: "don't rely on me to tell you what is or isn't a fable task, feel
free to use your judgment - I'm just opining when i remember to."

So treat those annotations as a weak signal and decide the tier from the work itself.
The standing cost discipline still applies and is the real constraint: `mechanic-glm`
for mechanical edits, bulk find/replace and build runs; `writer-luna` for simple,
well-specified copy and component edits; `writer-sol` when moderate content judgment is
needed; `visual-fable` only when the task genuinely needs an eye for how the rendered
scene looks — camera choreography, shader work, scene composition. Do not escalate to
fable or opus just because he mentioned fable, and do not avoid fable on a genuinely
compositional task merely because he did not mention it.

The corollary matters too: he will not always flag the hard ones. Items he says nothing
about can still need the expensive tier, so assess every item independently rather than
sorting by whether he commented.

## Spending mode is a toggle he flips explicitly, in both directions

Sahil's spending posture tracks his weekly model limits, and he announces each change.
When his fable allowance was about to reset he switched the session's base model to
fable and said: "feel free to do a *lot* more of this remaining work yourself rather
than farming it out to cheaper models until i tell you otherwise." When the limits reset
again he switched the base model back to Opus and said: "please go back to the thrifty
token spending strategy and heavily use cheaper subagents whenever possible, reserving
fable use for when it's needed."

Thrifty is the default; the do-it-yourself mode is the exception, and it lasts only
until he says otherwise. **Do not carry a previous "do it yourself" grant into a new
session.** If the session's own model is an expensive one he may well have flipped the
toggle, but confirm from what he has actually said in this conversation rather than
inferring it from the model name. When in doubt, be thrifty: delegate mechanical and
well-specified work to the cheap profiles and keep the arithmetic-heavy, cross-file
structural work for the main session.
