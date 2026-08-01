# Poster prompt pack

Use for posters, flyers, album covers, movie-style key art, event visuals, and social announcements.

Extract: headline, subtitle, event/product, audience, mood, aspect ratio, brand colors, visual metaphor, required text, and forbidden text.

Model adjustments:
- GPT Image 2: use exact text blocks and `quality: high` for dense typography.
- Nano Banana Pro: use for multilingual posters, premium layouts, and brand/localization accuracy.
- Nano Banana 2: use for quick poster variations and social content.


Additional model adjustments:
- Z-Image: use photographic subject/scene/lighting/camera/material specificity; fold critical constraints into the positive prompt if negative prompts are unsupported.
- SDXL: return positive prompt, negative prompt, and recommended settings; include LoRA/ControlNet/IP-Adapter only if user provides or requests them.
- FLUX: use coherent natural language with strong composition and reference-role clarity; use Kontext-style change-only wording for edits.

Template:

```text
Create a <aspect ratio> poster for <purpose/audience>.
Visual concept: <main metaphor/story>.
Subject and scene: <subject, action, setting>.
Composition: <hierarchy, subject placement, text safe area, negative space>.
Style: <medium, mood, color palette, texture>.
Typography: Render exactly: "<headline>" and "<subtitle>". Place <placement>. Use <type style>.
Constraints: no extra text, no watermark, no unrelated logos, preserve brand colors.
```
