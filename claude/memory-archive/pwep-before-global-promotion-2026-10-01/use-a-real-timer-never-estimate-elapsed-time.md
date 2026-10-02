---
name: use-a-real-timer-never-estimate-elapsed-time
description: When Sahil gives work a time box, set an actual clock-based timer and check the real time — never estimate how much has elapsed
metadata:
    pinned: false
---

# When there is a deadline, put it on a real timer

Sahil gave a task a twenty-minute box and then had to tell me:

> "make sure it is on a TIMER - don't GUESS how long 20 minutes is"

An agent has no sense of elapsed wall-clock time. Turns take wildly varying real time,
and a subjective impression of "about fifteen minutes have passed" can be off by a
factor of two in either direction. Estimating it silently is a way to blow a deadline
while believing there is time left.

What to do instead, every time a deadline is named:

- Run `date` to get the real current time, compute the deadline as an absolute
  clock time, and write it somewhere durable.
- Start an actual timer — a backgrounded `sleep` until the deadline, which re-invokes
  the session when it fires — rather than intending to check later.
- Check the clock with `date` before each decision about whether there is time for
  another step. Never reason from a feeling about how long something took.
- Anchor the deadline to **Sahil's** number, not to when the work happened to start.
  When he says "16 minutes left", that is ground truth and overrides any window
  computed from a task's own start time.

The same rule applies to any subagent given a time box: hand it an absolute wall-clock
commit-by time and tell it explicitly to run `date` rather than estimate, because it has
exactly the same blind spot. Also tell it to commit something small early rather than
something larger late, since uncommitted work at the deadline is simply lost.
