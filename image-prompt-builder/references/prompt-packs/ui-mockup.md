# UI mockup prompt pack

Use for app screens, website hero sections, dashboards, landing pages, and product mockups.

Extract: product, platform, screen type, target users, key components, copy, layout, brand style, and resolution/aspect ratio.

Model adjustments:
- GPT Image 2: strong for clean UI mockups with controlled text.
- Nano Banana Pro: use for complex dashboards, localization, and brand systems.
- Nano Banana 2: use for rapid visual directions.


Additional model adjustments:
- Z-Image: use photographic subject/scene/lighting/camera/material specificity; fold critical constraints into the positive prompt if negative prompts are unsupported.
- SDXL: return positive prompt, negative prompt, and recommended settings; include LoRA/ControlNet/IP-Adapter only if user provides or requests them.
- FLUX: use coherent natural language with strong composition and reference-role clarity; use Kontext-style change-only wording for edits.

Template:

```text
Create a polished <platform> UI mockup for <product/use case>.
Screen: <landing page/dashboard/mobile screen>.
Layout: <grid, nav, hero, cards, charts, CTA placement>.
Visual system: <palette, typography, spacing, component style>.
Text: Render exactly <copy snippets>.
Data: Use only placeholder values unless user provided real data.
Constraints: no lorem ipsum unless requested, no random brand logos, readable UI text, consistent spacing.
```
