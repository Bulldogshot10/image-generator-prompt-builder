# Photo edit prompt pack

Use for editing uploaded images, retouching, object removal, background changes, color correction, and style transfer.

Extract: exact change, protected elements, background, identity/product constraints, desired realism, and output size.

Model adjustments:
- GPT Image 2: use direct edit scope plus invariants for high-fidelity preservation.
- Nano Banana Pro: use for complex edits with multiple references or localized text.
- Nano Banana 2: use for conversational iterative edits.

Template:

```text
Edit the image by changing only <requested change>.
Keep unchanged: <identity/product/layout/background/lighting/text/logo/style>.
Blend the edit naturally with existing perspective, lighting, shadows, reflections, and material texture.
Do not alter any other part of the image.
Avoid: artifacts, over-retouching, warped geometry, extra objects, extra text.
```
