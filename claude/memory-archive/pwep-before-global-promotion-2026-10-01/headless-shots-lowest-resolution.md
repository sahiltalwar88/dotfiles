---
name: headless-shots-lowest-resolution
description: "On the pwep world, re-read CLAUDE.md's rendered-frame section before capturing — the headless renderer moved from CPU to the real GPU, which reversed the earlier keep-it-tiny advice — and write captures into public/shots/ so Sahil can actually open them"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 625c614a-096f-44a5-8c8f-fdcfe1d1e9f4
  modified: 2026-09-09T05:11:44.327Z
---

# Check how the headless renderer is set up before you shoot

The pwep project can capture real rendered frames headlessly (`npm run shot`). **Read the
"Looking at the rendered frame" section of `CLAUDE.md` before using it**, because its
performance characteristics have already changed once mid-project and the guidance
inverted when they did.

## The resolution advice reversed, and that is the point

Originally the capture path ran through ANGLE's SwiftShader on the **CPU**, about one
frame per second, and Sahil's instruction was: *"always request the lowest resolution that
will show your changes reliably; the shader is at a premium right now because there are
multiple agents running and it's very cpu intensive."*

He then wired it to the real GPU — WSL2 reaching an RTX 3070 Ti through `/dev/dxg` and
Mesa's `d3d12` driver — and told me to go and re-read the file, noting that *"a picture
3.5x the size is now 1/8 the cost."* A 900x560 frame on the GPU is now cheaper than
480x300 was on the CPU, and `CLAUDE.md` says the keep-it-tiny advice is largely obsolete.

So the durable lesson is not a resolution number, it is: **do not carry a performance
assumption across sessions.** Check what the capture path is actually doing now. Every
capture prints which renderer ran, and the file explains that it falls back SILENTLY to a
software rasteriser if any of three environment variables is missing — so a slow capture
means reading that line rather than shrinking the frame. Still be considerate when other
sessions are rendering.

## Captures must go in public/shots/ to reach him

Writing a PNG to a scratch directory and describing it does **not** get the image in front
of Sahil, and neither does handing it to the agent tooling. The dev server serves
`public/shots/` at `http://localhost:4321/shots/<name>.png`, so captures belong there and
he gets a URL he can open. The directory is gitignored.
