# GPT Image 2 prompt guidelines

Sources checked July 29, 2026:
- OpenAI GPT Image Generation Models Prompting Guide: https://developers.openai.com/cookbook/examples/multimodal/image-gen-models-prompting-guide

## Model facts

- Use `gpt-image-2` as the default OpenAI image model for high-quality generation and editing, especially text-heavy images, photorealism, compositing, identity-sensitive edits, and workflows where fewer retries matter.
- Supported `quality`: `low`, `medium`, `high`.
- `input_fidelity` is disabled for `gpt-image-2` because output is high fidelity by default.
- Size constraints: max edge below 3840 px, both edges multiples of 16, long/short ratio at most 3:1, total pixels 655,360 to 8,294,400. Treat outputs above 2560x1440 as more variable.
- Useful sizes: `1024x1024`, `1024x1536`, `1536x1024`, `2560x1440`; near-4K is experimental.

## Prompting principles

- Structure prompts in a consistent order: background/scene → subject → key details → constraints.
- Include the intended use: ad, UI mockup, infographic, product render, editorial image, etc.
- For complex requests, use labeled sections or line breaks.
- Be concrete about material, shape, texture, visual medium, layout, typography, and mood.
- For photorealism, explicitly use “photorealistic” and write as if a real photo is being captured; include natural imperfections, real textures, framing, lighting, and lens only as high-level visual cues.
- For dense text, infographics, close-up portraits, identity-sensitive edits, and high-resolution outputs, suggest `quality: high` or at least compare `medium`/`high`.
- For latency-sensitive drafts, suggest `quality: low`.

## Text, ads, logos, and diagrams

- For in-image text, quote exact copy and say it should appear exactly once, clearly and legibly.
- Add “No extra text, no watermarks, no unrelated logos” when text accuracy matters.
- For ads, write like a creative brief: brand, target audience, cultural context, scene, concept, composition, copy, and desired vibe.
- For logos, specify original/non-infringing, simple, scalable, vector-like shapes, balanced negative space, centered mark, plain background.
- For infographics, specify audience, hierarchy, labels, layout, and factual scope; suggest `quality: high` for dense layouts.

## Edits and consistency

- Separate what changes from what must remain unchanged.
- Restate invariants every time: identity, facial features, proportions, pose, product details, brand assets, typography, layout, lighting, and background when applicable.
- For translation/localization edits, preserve layout, typography style, placement, spacing, hierarchy, logos, icons, and imagery; translate only the specified text.

## Advanced hacks

- Use `EXACT TEXT:` blocks for typography-heavy images.
- Repeat critical text constraints in both `Text / layout` and `Constraints`.
- Add “exactly once”, “no duplicate text”, “no extra words”, and “no watermark” when rendering text.
- For photorealism, request real-world imperfections: subtle asymmetry, natural skin texture, dust, imperfect fabric, lens softness, realistic reflections.
- For product/ad images, include target audience, channel, campaign goal, product angle, visual hierarchy, and CTA copy.
- For edits, state `Change only:` and `Preserve:` as separate lines.
- For complex layouts, describe canvas regions: top headline zone, center hero subject, lower CTA area, safe margins, and negative space.

## Quality selection cheatsheet

- `low`: thumbnails, rough ideation, fast drafts.
- `medium`: general polished output and everyday content.
- `high`: text-heavy posters, diagrams, close portraits, ads, product renders, identity-sensitive edits, and outputs where reruns are expensive.

## Failure-mode guards

- Text hallucination: quote exact copy, say exactly once, and forbid extra text.
- Over-polished skin: request natural texture, small imperfections, and realistic lighting.
- Extra logos/watermarks: forbid unrelated marks and preserve supplied logos only.
- Identity drift: list protected facial/body traits and reference-image role.
- Cropped hands/products/text: specify safe framing and complete visible subject.
- Product warping: preserve geometry, label placement, dimensions, and material.

## Steroid template

```text
Goal:
Create <asset type> for <use case/audience/channel>.

Scene:
<environment, subject, action, story moment, visual metaphor>

Composition:
<aspect ratio, subject placement, foreground/background, negative space, safe text areas>

Visual direction:
<style/medium, lighting, color palette, materials/textures, camera/framing, realism level>

Text / layout:
EXACT TEXT: "<copy>"
Render the text exactly once, clearly legible, with <typography> at <placement>.

Preserve:
<identity/product/logo/layout elements that must not change>

Avoid:
<no extra text, no watermark, no unrelated logos, no cropped subject, no warped product>

Suggested settings: size=<size>, quality=<low|medium|high>
```

## Template

```text
Create <intended asset type> for <use case/audience>.

Scene:
<environment, subject, action, composition>

Visual direction:
<style/medium, lighting, color palette, materials/textures, camera/framing>

Text / layout:
<exact quoted copy, placement, hierarchy, typography>

Constraints:
<what to avoid and what must remain invariant>

Suggested settings: size=<size>, quality=<low|medium|high>
```
