---
name: todos-md-never-committed
description: "job-hunter's todos.md is a private working file that is never committed, so closed-repo notes there are fine"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 5bd2fb1a-6bb7-4569-8867-f4b966f2be3f
  modified: 2026-09-30T05:16:46.765Z
---

In the public job-hunter repo, `todos.md` is the user's private working list and is never committed. The user said so directly: "todos will never be committed."

It's therefore acceptable to put closed-repo follow-ups there (for example, "remove `--dry-run` from the closed repo's scripts"), even though closed-repo detail must otherwise never reach the public repo. Don't flag its closed-repo content as a leak. Do still make sure it never gets staged: stage explicit paths only.
