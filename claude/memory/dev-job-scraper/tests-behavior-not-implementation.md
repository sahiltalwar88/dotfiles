---
name: tests-behavior-not-implementation
description: "When adding tests for fixes, test expected behavior rather than implementation details"
metadata:
  node_type: memory
  pinned: false
  originSessionId: 85033945-0a98-45e3-8731-d6df062e9705
  modified: 2026-09-29T22:56:36.456Z
---

When adding tests for bugs found and fixed (for example after a code review), the user wants tests that check expected behavior — what a user or caller observes, such as outputs, exit codes, files written, or what gets pushed — rather than tests coupled to the implementation (asserting on specific code strings, internal helper names, or exact wiring). Behavior-level tests survive refactors and actually prove the fix works; implementation-coupled tests break on harmless changes and can pass while the behavior is still wrong.
