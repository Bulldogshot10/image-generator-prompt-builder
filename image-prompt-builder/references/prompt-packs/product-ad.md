# Product ad prompt pack

Use for product renders, ecommerce images, campaign visuals, packaging shots, and hero banners.

Extract: product, audience, key benefit, campaign channel, angle, background, props, brand assets, claims, text, and aspect ratio.

Model adjustments:
- GPT Image 2: strong for high-fidelity ads and product text; use `quality: high`.
- Nano Banana Pro: best for brand systems, localization, and complex multi-reference ads.
- Nano Banana 2: best for quick variants and lightweight social ads.


Additional model adjustments:
- Z-Image: use photographic subject/scene/lighting/camera/material specificity; fold critical constraints into the positive prompt if negative prompts are unsupported.
- SDXL: return positive prompt, negative prompt, and recommended settings; include LoRA/ControlNet/IP-Adapter only if user provides or requests them.
- FLUX: use coherent natural language with strong composition and reference-role clarity; use Kontext-style change-only wording for edits.

Template:

```text
Create a premium product advertisement for <product> aimed at <audience>.
Hero product: <shape, material, label, angle, scale>.
Scene: <environment, props, mood>.
Lighting: <studio setup/reflections/shadows>.
Composition: <hero placement, negative space, copy area>.
Copy: Render exactly "<copy>" <placement>.
Brand consistency: preserve <logo/palette/type style>.
Constraints: no invented claims, no warped packaging, no extra logos, no watermark.
```
