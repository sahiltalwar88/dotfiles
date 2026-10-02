---
name: cap-capture-size-host-ram-not-gpu
description: "Cap pwep headless captures at roughly 900px wide and never run them in batches — the binding limit is host RAM shared with many Claude sessions, not GPU speed, and a large batch crashed Sahil's IDE"
metadata: 
  node_type: memory
  originSessionId: 9f6908d0-85c6-4955-b42b-5ea6ab02629f
  modified: 2026-09-21T04:15:12.084Z
---

# Capture size is limited by the machine, not the GPU

Sahil's IDE crashed while I was running **four headless captures back to back at
1854x1340** — about six times the pixels of the ~700px frames I had used all day.
He told me afterwards that one of the sessions had caused it and asked me to be
careful. Nothing else I had run came close to that footprint, so it is the
overwhelming likely cause.

The rule: **keep a capture viewport around 700-900px wide, and take them one at a
time.** If a question genuinely needs his exact buffer size, take a single frame at
that size, deliberately, and say why — never a batch.

## Why the obvious reading of CLAUDE.md is wrong

`CLAUDE.md` says the old "keep captures tiny" advice is largely obsolete because the
renderer moved from CPU SwiftShader to the real GPU, and that "a 900x560 frame costs
less than a 480x300 one did on the CPU". That is true and it is about **GPU render
time**. It is not a licence to raise the buffer size, because the binding constraint
is somewhere else: this machine routinely has **seven or more Claude Code sessions
alive at 260-340 MB each**, plus whatever those sessions are running, and a headless
Chromium holding a large drawing buffer on top of that is what tips the host over.

So the two facts sit side by side without contradicting: a big frame is cheap in GPU
time and expensive in host memory, and it is host memory that falls over.

## Practical form

- One capture at a time. Do not loop over a list of variants at full size.
- Prefer answering a question with a URL Sahil can click over a capture at all — he
  answers in under a minute and it costs the machine nothing.
- Matching his buffer exactly matters only for questions about screen derivatives and
  filter widths, where resolution genuinely changes the answer. Everything else —
  what colour something is, where a surface is, whether a mode is live — is answerable
  small.
