---
name: code-is-a-liability-prefer-boring-tools
description: Sahil's standing bar for solutions — functionality is the asset, code is the liability; reach for a boring proven tool before writing or adding anything
metadata:
    pinned: false
---

# Functionality is the asset; the code you add is the liability

Sahil pointed to Ted Dziuba's "Taco Bell Programming" as guidance he wants followed,
alongside the DRY article. Its argument: Taco Bell builds its whole menu out of about
eight ingredients, and most programming problems are the same — they want existing,
battle-tested pieces combined, not a new system. The line to keep is **"functionality
is an asset, but code is a liability."** Every line added is another thing that can
fail, another thing to operate, another thing someone has to understand later.

His worked examples are deliberately unglamorous: a distributed web crawler that is
`xargs` and `wget` in about ten lines of shell instead of a Clojure service with a
message queue, and thirty-two-way parallel data processing as
`find crawl_dir/ -type f -print0 | xargs -n1 -0 -P32 ./process` instead of standing up
Hadoop. The point is not shell specifically — it is preferring the mature, boring,
already-proven tool over the novel one, because that is what stops the pager going off.

In practice on Sahil's projects this means: before writing a new abstraction, a
generator, a framework or a dependency, ask whether an existing tool or a much smaller
piece of plain code does the job. Prefer the version that deletes code over the version
that adds it. A twenty-line test that fails when two lists disagree beats a machine that
generates one list from the other. This sits naturally beside his rule that third-party
code should be the smallest thing that works, extracted rather than depended on.
