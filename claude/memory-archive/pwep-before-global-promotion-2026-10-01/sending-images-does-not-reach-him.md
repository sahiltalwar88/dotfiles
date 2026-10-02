---
name: sending-images-does-not-reach-him
description: "Images sent to Sahil with the file-sending tool do not render for him; put screenshots where his browser can open them instead, such as under the dev server's public directory"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 3537332a-f570-4481-b363-7e16a37e7c53
  modified: 2026-09-09T03:26:48.005Z
---

# Sending him an image file does not work — serve it instead

I captured screenshots of the Three.js world and delivered them with the file-sending tool,
describing them in the reply as though he could see them. He could not: **"i did not see an
image rendered above, so i think you may not be able to show me images unfortunately."**

So do not rely on that channel to show him anything. It reports success, and the file never
appears on his side, which is worse than not trying — I wrote a whole reply around two
images he was never shown.

What does work is his browser. He always has the dev server up at `http://localhost:4321`
while reviewing, so a PNG written under the project's `public/` directory is reachable at a
URL he can paste, exactly like the `?perf` URLs he already uses every round. Write captures
there (keep the directory out of git) and hand him the link in the reply.

Two things follow from this. Describe what a screenshot shows in words as well as linking
it, because the words are what definitely arrive. And when a capture is the evidence for a
claim, give him the URL rather than asserting the conclusion — the whole point of being
able to render frames here is that he can check them.
