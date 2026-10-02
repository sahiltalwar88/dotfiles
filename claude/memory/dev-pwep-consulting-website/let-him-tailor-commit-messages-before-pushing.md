---
name: let-him-tailor-commit-messages-before-pushing
description: "Show Sahil commit messages and let him reword them before any push, including in repos where he has already authorised pushing"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: b9d27580-221c-4b5e-980b-fa4078df6843
  modified: 2026-09-20T06:27:11.717Z
---

# He rewords commit messages before they leave the machine

Sahil treats a pushed commit message as published writing, and he wants to edit
it himself first. While work was in flight on the version archive he said:

> "also, before you push, let me tailor the commit messages please"

This extends two things already known about him — that he controls what leaves
this machine, and that he has opinions about commit message scope and wording —
into a specific procedural rule: **commit freely, but before pushing, show him
the messages and give him the chance to rewrite them.**

It applies even where pushing has already been authorised. He had explicitly told
me to create and push a new repository, and the rule still applies to later pushes
to it; the earlier authorisation covered the push, not the prose. Treat "you can
push this" as permission for the transfer and not as sign-off on the words.

In practice: commit as work proceeds so nothing is lost, then before `git push`
print the messages for the commits that are about to go, in full, and wait. If he
reworks them, amend or reword and push what he approved.
