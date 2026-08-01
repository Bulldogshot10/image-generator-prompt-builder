# Logo and brand prompt pack

Use for original logos, marks, brand identity concepts, app icons, and visual systems.

Extract: brand name, industry, audience, personality, symbol ideas, colors, typography direction, usage context, and constraints.

Model adjustments:
- GPT Image 2: ask for vector-like simplicity and clean centered layout.
- Nano Banana Pro: use for complete brand systems, mockups, and localization.
- Nano Banana 2: use for ideation and multiple quick directions.


Additional model adjustments:
- Z-Image: use photographic subject/scene/lighting/camera/material specificity; fold critical constraints into the positive prompt if negative prompts are unsupported.
- SDXL: return positive prompt, negative prompt, and recommended settings; include LoRA/ControlNet/IP-Adapter only if user provides or requests them.
- FLUX: use coherent natural language with strong composition and reference-role clarity; use Kontext-style change-only wording for edits.

Template:

```text
Create an original, non-infringing logo concept for <brand>.
Brand personality: <traits>.
Symbol direction: <metaphor/shape>.
Style: simple, scalable, vector-like, balanced negative space.
Typography: <font style>; render exact brand name "<name>" if text is required.
Color palette: <colors>.
Presentation: centered on plain background, no mockup unless requested.
Constraints: no copyrighted/trademark-like marks, no extra text, no watermark.
```
