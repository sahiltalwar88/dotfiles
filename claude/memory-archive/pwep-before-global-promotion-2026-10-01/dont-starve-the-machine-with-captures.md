---
name: dont-starve-the-machine-with-captures
description: "On pwep-consulting-website, never run headless captures in parallel or chain them with builds — the box has only 11 GB and an OOM kill has crashed Sahil's IDE"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: a4437303-d5c5-43ed-a427-614c007caf1b
  modified: 2026-09-21T04:17:20.313Z
---

# Headless captures can take down Sahil's IDE — run them one at a time

Sahil's IDE crashed while this session was running the screenshot harness, and he
asked for care:

> "please note that one of your sessions did something to crash it, so please be
> careful with what you're doing"

The machine has about **11 GB of RAM total**, shared with however many other Claude
sessions are working in the same checkout at that moment. A headless Chromium
rendering the world on the real GPU is heavy on its own; several of them, or one of
them alongside `astro build`, is enough to trigger the kernel's OOM killer. The
signature to watch for is a command exiting with **code 137** — that is a kill, not a
failure of the command, and it means something on the box was starved. It is not
always the capture that gets killed; it can be whatever else the user was running.

The rules that follow:

- **Never run two browser captures at once.** Run them sequentially, even though a
  parallel pair is faster and the results look the same.
- **Never chain a capture or a build into a single long `&&` command** such as
  `astro build && npm run probe && npm test`. Run each separately so a kill is
  attributable and the peak is lower.
- Keep the viewport small — this reinforces the existing note about capture size,
  but the reason here is memory rather than politeness about GPU contention.
- After a run, check that nothing was left behind (`ps` for the pids started), and
  report honestly if this session was the likely cause of a crash rather than
  treating it as an unexplained event.

This sits alongside the standing rule that other sessions are always working in the
same checkout: the resource being shared is not just the files, it is the machine.
