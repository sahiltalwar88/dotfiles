---
name: urls-belong-in-reply-text
description: "Never put a URL Sahil is meant to open inside an AskUserQuestion dialog — he cannot see, highlight or copy it there; URLs go in the reply text"
metadata: 
  node_type: memory
  pinned: false
  originSessionId: 9f6908d0-85c6-4955-b42b-5ea6ab02629f
  modified: 2026-09-19T20:02:59.388Z
---

# Put every URL in the reply text, never in a question dialog

Sahil cannot read or copy a URL that is inside an `AskUserQuestion` option or
question body. He said so directly when I embedded two test URLs in a question:

> "i cannot see the full url nor highlight it in this AskUserQuestion dialogue,
> could you please give it to me after we finish this session so i can click it
> or copy paste it?"

The dialog truncates long strings and offers no selection, so a URL placed there
is effectively invisible. This matters constantly on the pwep world, where the
whole diagnostic loop is me handing him a URL with knobs set and him reporting
what his browser shows — the URL *is* the deliverable of that message.

So: any URL he is meant to click goes in the plain reply text, on its own line,
where the terminal renders it as a clickable, copyable link. A question dialog may
ask him *about* a test ("did it still scramble?"), but the address itself must
already be in the prose above it. The same applies to any other long literal he
needs to copy — a command line, a file path, a seed.
