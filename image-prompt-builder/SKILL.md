---
name: image-prompt-builder
description: Refine raw user image prompts into polished, model-specific generation or editing prompts for GPT Image 2, Nano Banana Pro, or Nano Banana 2. Use when a user gives an image idea/prompt and wants it rewritten, optimized, clarified, translated into a better creative brief, or adapted to one of these image generator models.
---

# Image Prompt Builder

## Mandatory first step

When the user provides an image prompt or image idea, ask which target model to optimize for before rewriting it, unless the target model is already explicit.

Ask in Indonesian by default if the user writes Indonesian:

> Mau dioptimasi untuk model apa: **GPT Image 2**, **Nano Banana Pro**, atau **Nano Banana 2**?

If the user has already named the model, proceed without asking.

## Workflow

1. Identify whether the task is **text-to-image**, **image edit**, **style transfer**, **composition with references**, **text/typography**, **infographic/diagram**, **ad/product visual**, **logo/brand**, or **character/identity consistency**.
2. Read the relevant reference file before rewriting:
   - `references/gpt-image-2.md` for GPT Image 2.
   - `references/nano-banana-pro.md` for Nano Banana Pro.
   - `references/nano-banana-2.md` for Nano Banana 2.
3. Preserve the user's core intent, subject, mood, and constraints. Do not invent brand names, copyrighted characters, or factual claims unless the user supplied them.
4. Convert vague or keyword-only prompts into a clear creative brief using the target model's structure.
5. If essential details are missing, infer safe defaults and mark them as adjustable. Ask follow-up questions only when the missing detail would materially change the image.
6. Output only the improved prompt plus a compact settings block when useful. Do not over-explain unless asked.

## Universal prompt structure

Use short labeled sections for complex prompts:

```text
Goal:
Subject:
Scene / environment:
Composition:
Style / medium:
Lighting / camera:
Text to render:
Reference handling:
Must preserve:
Constraints:
Suggested settings:
```

For simple prompts, a polished paragraph is enough.

## Output format

Return:

```markdown
**Model:** <target model>

**Prompt:**
<final prompt ready to paste>

**Suggested settings:**
- Aspect ratio / size: <if relevant>
- Quality / resolution: <if relevant>
- Notes: <short, optional>
```

For edits, include explicit invariants:

```text
Change only: ...
Keep unchanged: identity, pose, composition, background, lighting, logos, typography, and all other visual elements not mentioned.
```

## Quality rules

- Prefer natural-language creative direction over dense tag stuffing.
- Specify subject, action, setting, composition, style, lighting, materials/textures, mood, and final use case.
- Quote exact text that must appear in the image.
- Add negative constraints only when they prevent common failure modes: no extra text, no watermark, no unrelated logos, no changed identity, no over-retouching.
- For factual or time-sensitive images, state the exact date/source requirement or instruct Nano Banana models to use search when available.
- For character consistency or edits, restate what must stay invariant on every iteration.
