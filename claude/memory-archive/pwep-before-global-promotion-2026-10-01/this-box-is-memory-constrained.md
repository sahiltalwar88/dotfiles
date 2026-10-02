---
name: this-box-is-memory-constrained
description: "Sahil's pwep machine runs ~10 Claude sessions on 12 GB of RAM and his IDE has crashed under the load, so check free memory before builds, probes or headless GPU captures"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 3032c14a-c5f7-4485-8d13-356d6821e542
  modified: 2026-09-24T06:29:25.481Z
---

# Heavy tool runs can crash Sahil's IDE — check memory before launching one

Sahil's IDE crashed while several Claude sessions were working on
`pwep-consulting-website`, and he attributed it to something one of those sessions did:

> "please note that one of you sessions did something to crash it, so please be careful
> with what you're doing"

The machine's numbers explain why this is a standing hazard rather than a one-off. It
is a WSL2 box with roughly **12 GB of RAM**, and at the time of the crash about 7 GB was
in use with only **334 MB of its 2 GB swap left**. Ten Claude session processes were
running at once, and the long-lived Astro dev server on port 4321 had grown to **1.1 GB
resident** over four days of uptime. There is very little headroom, and the IDE and the
dev server are the things that die when it runs out.

The expensive operations in this repo, in rough order of cost, are: `npm run shot`
(a full Chromium doing GPU compositing, the heaviest by a wide margin), `npx astro build`
(Vite and Rollup), and `npm run probe` (an esbuild bundle plus a Node run). CLAUDE.md
requires the build and the probe after any change under `src/world/`, so those are not
optional — but running them repeatedly, or firing off a capture casually, is.

He repeated it as a standing rule on 2026-09-24, while archive captures were running:

> "there are other sessions running, make sure you're aware of what % of system
> resources you're using and leave plenty for others ... if you use too much, you will
> crash all the sessions and this entire ide"

So before and during any heavy run, know the number: what share of RAM the run takes
and how much is left for everyone else, and gate each step on free memory rather than
launching and hoping. The box has since grown to about 24 GB, but the rule is about
leaving room for the other sessions, not about a fixed size.

Practical rules that follow:

- For a series of captures, run them one at a time and have each wait until a
  generous amount of memory is available (a third of the box is a sensible floor).

- Run `free -m` before a capture or a build when the session has already run several,
  and say so if headroom is short rather than pressing on.
- Run the build and probe **once**, at the end, rather than after each edit.
- Never start another dev or preview server; reuse the ones already listening (4321 for
  dev, 4322 for the shot server).
- Prefer the smallest viewport that answers the question when capturing.
- Never kill a process by name to reclaim memory — other sessions and the IDE depend on
  the same servers. Only ever stop a specific pid this session started.
