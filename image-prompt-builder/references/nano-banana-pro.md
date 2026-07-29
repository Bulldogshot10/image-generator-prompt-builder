# Nano Banana Pro prompt guidelines

Sources checked July 29, 2026:
- Google Blog, “7 tips to get the most out of Nano Banana Pro”: https://blog.google/products-and-platforms/products/gemini/prompting-tips-nano-banana-pro/
- Google AI Gemini image generation docs: https://ai.google.dev/gemini-api/docs/image-generation
- Google Cloud, “Ultimate prompting guide for Nano Banana”: https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-nano-banana

## Model facts

- Nano Banana Pro is Gemini 3 Pro Image (`gemini-3-pro-image`).
- It is the premium choice for complex visual tasks, professional asset production, highest world knowledge, advanced localization, brand consistency, and precision creative control.
- It supports advanced text rendering, creative controls, real-world grounding/search in supported surfaces, up to 4K generation, and multiple reference images depending on surface.

## Prompting principles

- Prompt like a creative director, not a keyword list.
- Include: subject, composition, action, location, style, and explicit editing instructions when editing.
- Add advanced details for professional results: aspect ratio, camera angle, lens/focus feel, lighting setup, color grading, material textures, and output format.
- For diagrams and factual visuals, include factual constraints and say the inputs must be accurate.
- For brand work, state brand personality, colors, logo/reference role, typography, and what must stay consistent.

## Text and localization

- Quote exact text that should appear.
- Specify typography style/font, size/weight, placement, hierarchy, spacing, and language.
- For localization, say exactly what language to render or translate into and what should remain unchanged.
- Use Nano Banana Pro for multilingual text, posters, diagrams, packaging, UI, and brand assets.

## Reference images

When using references, assign roles clearly:

```text
Use Image A for the character identity and facial features.
Use Image B for the outfit material and color palette.
Use Image C for the background architecture.
Blend them into <new scenario> while preserving <invariants>.
```

For multiple references, follow: `[Reference images] + [Relationship instruction] + [New scenario]`.

## Editing

- State what changes and what remains exactly the same.
- Use semantic masking in words: “change only the sky,” “remove only the car in the background,” etc.
- For style transfer, ask to preserve exact content/pose/composition while changing only the artistic style.

## Template

```text
Create a <asset type> for <purpose/audience>.

Story / goal:
<why this image exists and what it should communicate>

Subject and action:
<who/what, pose/action, key details>

Scene and composition:
<location, framing, aspect ratio, camera angle, layout>

Style and production direction:
<aesthetic, lighting, color grading, textures, medium>

Text / localization:
<exact quoted text, typography, language, placement>

References / brand consistency:
<role of each uploaded image or brand element>

Constraints:
<no extra text, no watermark, preserve identity/brand/layout, factual accuracy>
```
