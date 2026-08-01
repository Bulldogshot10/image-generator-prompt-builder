# Product ad prompt pack

Use for product renders, ecommerce images, campaign visuals, packaging shots, and hero banners.

Extract: product, audience, key benefit, campaign channel, angle, background, props, brand assets, claims, text, and aspect ratio.

Model adjustments:
- GPT Image 2: strong for high-fidelity ads and product text; use `quality: high`.
- Nano Banana Pro: best for brand systems, localization, and complex multi-reference ads.
- Nano Banana 2: best for quick variants and lightweight social ads.

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
