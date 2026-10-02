---
name: keep-the-dev-server-parseable
description: "Sahil watches the pwep dev server live while work is in progress, so a broken build must be fixed immediately and files must be left parseable between edits"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 30f6bc51-1bd6-49a5-8648-8b020c0d6334
  modified: 2026-09-09T05:54:15.318Z
---

# Never leave the pwep dev server broken between edits

Sahil keeps `http://localhost:4321` open in a browser while work is happening, including
work he has released me to do unattended. When an edit leaves a source file unparseable, he
sees it immediately as a `500 (Internal Server Error)` on the module Vite is trying to
transform, and he reports it. When it happened a second time he said: **"fix the 500 error
before you keep going please."**

So a broken dev server takes priority over whatever else is in flight. Stop, fix it, confirm
the module serves 200, and only then continue. Do not finish the current sub-task first on
the theory that the break will be resolved by the end of the batch — from his side there is
no way to tell a deliberate mid-edit state from a mistake that will still be there in the
morning.

The practical consequence is about pacing rather than care: verify that a file still parses
after **each** edit, not once at the end of a run of edits. In this repo the cheap check is
`npx esbuild src/world/<file>.ts --bundle --platform=node --format=cjs --outfile=/dev/null`,
which takes about a second and names the line, and `npm run probe` runs a stricter shader
check on top of it. A batch of five edits verified once at the end leaves the site broken
for however long the batch takes, which on this project can be many minutes.

This matters more than it would on a normal codebase because the deliverable here is a
rendered frame that he judges by eye. The dev server is not a build artifact to him; it is
the product.
