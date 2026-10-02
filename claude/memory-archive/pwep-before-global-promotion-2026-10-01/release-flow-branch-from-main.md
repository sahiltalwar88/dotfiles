---
name: release-flow-branch-from-main
description: "On pwep-consulting-website a pull request to prod ALWAYS comes from main, never from a work branch — and a new round must be branched from main after the previous round is squash-merged, or the next merge conflicts on every shared file"
metadata:
  node_type: memory
  pinned: false
  originSessionId: e9992ae1-c104-4373-b637-f5b53db31550
  modified: 2026-09-24T06:36:12.874Z
---

# Prod comes from main, and each round starts from main

Sahil's rule, stated plainly on 2026-09-24 after I worked it out from the history
and proposed it:

> "ah - yes, prod prs always come from main as a rule in my mind"

So the release path is **work branch → main → prod**. A pull request to `prod` is
opened from `main`, never from a `world-round-N` branch, even when that branch is
the thing being released and is byte-identical to main. The prod branch's own
history shows the pattern — its commits are "Merge pull request #N from
sahiltalwar88/main".

## Why it also matters where the next round starts

The same evening we spent a long time untangling a merge with 55 conflicts, many
of them add/add on files both sides had created. The cause:

- `world-round-14` was branched from `world-round-13`'s tip, while round 13 was
  still unmerged.
- Round 13 was then **squash**-merged into `main`, which compressed its nine
  commits into one new commit with a different SHA.
- Git then held two unrelated representations of the same work — main's single
  squashed commit, and the branch's nine individual ones. The last genuinely
  shared commit was weeks older, so every file both sides touched conflicted.

The check that proves this shape, and is worth running before any such merge, is
whether the old branch's tip is an ancestor of main:
`git merge-base --is-ancestor origin/world-round-13 origin/main` answered NO —
main had the content but none of the commits.

Because the branch genuinely contained everything main had squashed, the correct
resolution was to take OUR side for every conflict, and the proof it was right was
that the merged tree came out byte-identical to the branch's tip before the merge.
Watch for files the newer round deliberately DELETED, though: a naive merge
resurrects them, and seven retired handoff documents nearly came back that way.

**So when a round is squash-merged to main, start the next round by pulling main
and branching from it** — not from the previous round's branch. Otherwise the same
conflict storm recurs, and it gets worse as the round grows.
