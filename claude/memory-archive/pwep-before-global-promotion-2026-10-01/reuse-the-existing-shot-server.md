---
name: reuse-the-existing-shot-server
description: "On pwep-consulting-website, capture against whatever shot:server is already running on port 4322 rather than starting another one"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 141ee289-e785-4bbe-a523-88423ca6bc39
  modified: 2026-09-17T20:45:00.558Z
---

# Use the shot server that is already running, do not start a third

Several Claude sessions work in `pwep-consulting-website` at once, and more than one of
them wants a built copy of the site to capture against. `CITY-PLAN.md` says to shoot
against the built site when other sessions are editing (`npm run shot:server`, port 4322),
which reads as though each session should start its own.

Sahil's instruction is the opposite: **use the 4322 server that is already up.** When I
noted that another session already held the port and implied I would start a separate one,
he said: "you can use 4322, no need for a third server unless you have issues with that."

The practical shape is: check whether 4322 already answers (`curl -s -o /dev/null -w "%{http_code}"
http://localhost:4322/personal`), and if it does, capture with `--host=http://localhost:4322`.
`astro preview` serves `dist/` straight off disk, so running `npx astro build` refreshes what
that server hands out without restarting anything — an edit of mine reaches the shared server
through a plain rebuild. Only stand up another port if the shared one is genuinely unusable,
and say why.

The reason is that he watches the dev server on 4321 himself and does not want a spread of
half-known processes on his machine; the cost of one more Node server is not the issue, the
confusion is.
