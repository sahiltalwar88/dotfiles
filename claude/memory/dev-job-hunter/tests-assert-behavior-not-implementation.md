---
name: tests-assert-behavior-not-implementation
description: "Tests must assert the intended, documented behavior of a unit — never pin an implementation heuristic or quirk as if it were a requirement"
metadata:
  node_type: memory
  pinned: true
  originSessionId: ad7481b4-8ef2-4bbb-8afe-807d24dfbe79
  modified: 2026-09-29T23:27:57.201Z
---

The user wants tests to check expected behavior — the contract a unit promises (e.g. "the final answer is YES or NO; reasoning before it is fine; no answer raises") — not the incidental details of how the current implementation happens to work.

The user called out, as wrong and bad, tests that locked in a parsing heuristic: tests asserting that a YES/NO glued onto the end of a prose sentence is accepted, and that a later glued answer overrides an earlier exact one. Those tests made a fragile fallback look like required behavior, so fixing the design (a structured JSON answer field) would have looked like breaking the spec.

How to apply: before writing or keeping a test, ask whether it describes what callers or the prompt contract require. If a test only exists to document what a heuristic currently does with ambiguous input, don't write it; if the behavior is genuinely required, say why in the test's docstring. When porting or reviewing existing tests, flag and remove implementation-coupled ones.
