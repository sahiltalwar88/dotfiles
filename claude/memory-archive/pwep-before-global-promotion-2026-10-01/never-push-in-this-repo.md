---
name: never-push-in-this-repo
description: "On pwep-consulting-website, commit freely but NEVER push — Sahil controls what leaves the machine and has emphasised this"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 29ae9fee-e603-4d13-a426-f13d659a3572
  modified: 2026-09-16T03:43:06.083Z
---

# Commit, but never push

On the `pwep-consulting-website` repo Sahil is happy for a session to commit its own work as
it goes — one commit per reviewable stage, staging only the files that session changed, by
explicit path. He is not happy for anything to be pushed. Authorising a night of unattended
work, he answered the question about committing with "rec, and emphasis on do not push".

So `git push` is off the table unless he asks for it in that moment, and authorisation to
commit is never authorisation to push. The same goes for anything else that sends work off
the machine — opening a pull request, or publishing a branch.

The reason fits how he works: several Claude sessions share this repo at once, he reviews the
world by eye in a browser before he considers anything finished, and the branch is his to
move. A local commit is recoverable and private; a push is neither.
