---
name: brand-name-is-lowercase
description: "The consulting brand is written \"pwep consulting\" in lower case, never \"PWEP Consulting\""
metadata: 
  node_type: memory
  pinned: false
  originSessionId: a2c7992d-43a6-40c7-922b-2eb63e3ef138
  modified: 2026-09-14T19:28:19.504Z
---

# The brand is "pwep consulting", in lower case

Sahil's consulting business is named **`pwep consulting`** — all lower case, in
running text and in headings alike. It is not "PWEP Consulting", not "PWEP
consulting", and not "Pwep Consulting". He stated it plainly when asking for a
sweep of the site: *"change `PWEP Consulting` to `pwep consulting` everywhere -
it is supposed to be lower case."*

The lower case is the brand, not a typo, so it survives contexts that would
normally force capitalisation: the start of a sentence, a page title, a nav
label, a `<title>` tag, an `aria-label`, alt text, a meta description. Do not
"fix" it back to title case, and do not let a CSS `text-transform: capitalize`
or `uppercase` rule undo it either — if a heading needs to read as lower case,
the rule has to allow that.

This is separate from the identifiers built around the name, which are not the
brand and should be left alone: the repository `pwep-consulting-website`, the
Cloudflare project `pwepconsulting`, the `PUBLIC_CONSULTING_URL` environment
variable, and the `consulting` value of `PUBLIC_SITE`. Only the human-readable
name of the business is being spelled here.

The general lesson is that on this project the display name of the business is
Sahil's to set and is deliberately unconventional; when a name looks like it
has a casing mistake in it, assume it is intentional and ask rather than
normalising it.
