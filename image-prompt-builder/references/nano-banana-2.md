# Nano Banana 2 prompt guidelines

Sources checked July 29, 2026:
- Google AI Gemini image generation docs: https://ai.google.dev/gemini-api/docs/image-generation
- Google Cloud, “Ultimate prompting guide for Nano Banana”: https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-nano-banana

## Model facts

- Nano Banana 2 is Gemini 3.1 Flash Image (`gemini-3.1-flash-image`).
- It is the best all-around Nano Banana image model for performance, intelligence, cost, and latency balance.
- It supports 4K generation, world knowledge, reliable text rendering, multiple reference images, and consistency.
- Prefer Nano Banana 2 for general image generation/editing unless the user needs Pro-level brand, localization, or highly complex production control.

## Prompting principles

- Use clear natural language and full-sentence creative direction.
- Include subject, scene, action, composition, style, lighting, and intended output.
- For generated images with references, follow: `[Reference images] + [Relationship instruction] + [New scenario]`.
- For edits, focus on what changes and what stays the same.
- For real-time information/search-capable surfaces, use: `[Source/search request] + [Analytical task] + [Visual translation]`.

## Text rendering

- Quote exact text.
- Specify font or typography style, placement, hierarchy, color, and language.
- For best typography, develop the text/copy first, then ask for the image containing that exact text.
- Add “No extra text” when text must be controlled.

## Creative direction details

- Lighting: specify studio setup, golden hour, chiaroscuro, softbox, backlight, etc.
- Camera/focus: specify shot type and focus feel (wide shot, close-up, low angle, shallow depth of field).
- Materials/textures: specify tactile details like brushed steel, velvet, matte plastic, aged paper, skin pores, fabric wear.
- Layout: specify aspect ratio, centered subject, negative space, panel count, diagram hierarchy, or poster grid.

## Template

```text
Generate <asset type> showing <subject/action> in <setting>.

Composition:
<framing, aspect ratio, layout, foreground/background>

Style:
<medium/aesthetic, mood, color palette, materials/textures>

Lighting and camera:
<lighting direction/setup, camera angle, focus/depth>

Text:
<exact quoted text, typography, placement, language>

References / search:
<reference roles or search/data instructions if needed>

Constraints:
<what not to change/add; no extra text/watermark; preserve specified elements>
```
