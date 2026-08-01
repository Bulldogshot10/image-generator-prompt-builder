# Reference composition prompt pack

Use when the user uploads or describes multiple references that must be combined.

Extract: reference list, role of each reference, new scenario, elements to preserve, elements to ignore, style, and output ratio.

Model adjustments:
- GPT Image 2: keep references simple and explicit; restate invariants.
- Nano Banana Pro: best for many references and professional multi-source composition.
- Nano Banana 2: good for quick blended variations with clear roles.

Template:

```text
Use the references with these roles:
- Image A: <role>
- Image B: <role>
- Image C: <role>

Create a new image showing <new scenario>.
Blend references naturally while preserving <invariants>.
Ignore <unwanted reference aspects>.
Composition: <layout/framing>.
Style and lighting: <style>.
Constraints: do not mix identities incorrectly, do not copy unwanted backgrounds, no extra text/logos.
```
