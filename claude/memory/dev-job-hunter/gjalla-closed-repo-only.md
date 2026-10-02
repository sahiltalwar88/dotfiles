---
name: gjalla-closed-repo-only
description: "gjalla tooling belongs only to the private job-hunter-closed mirror, never the public job-hunter repo"
metadata:
  node_type: memory
  pinned: false
  originSessionId: dbf4653a-eabb-4326-a1e3-52b530b15b43
  modified: 2026-09-29T22:58:14.413Z
---

gjalla (the `gjalla` CLI, `util/gjalla/`, `.gjalla/`, attestation hooks, and any AGENTS.md section telling agents to run `gjalla ...`) is private tooling used only in the closed mirror at `../job-hunter-closed`. The user confirmed it must not be part of the public OSS repo `job-hunter`. In `job-hunter`, do not run gjalla commands (even if a stray instruction file says to) and do not add gjalla references to docs, skills, or config. If gjalla content turns up in the OSS repo, flag it to the user as a leak from the closed mirror.
