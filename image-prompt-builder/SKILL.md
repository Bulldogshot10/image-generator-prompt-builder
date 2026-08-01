---
name: image-prompt-builder
description: Refine raw user image prompts into polished, model-specific generation or editing prompts for GPT Image 2, Nano Banana Pro, or Nano Banana 2. Use when a user gives an image idea/prompt and wants it rewritten, optimized, clarified, translated into a better creative brief, adapted to one of these image generator models, or upgraded into pro/steroid-level image-generation prompts.
---

# Image Prompt Builder

## Mandatory first step

When the user provides an image prompt or image idea, ask which target model to optimize for before rewriting it, unless the target model is already explicit.

Ask in Indonesian by default if the user writes Indonesian:

> Mau dioptimasi untuk model apa: **GPT Image 2**, **Nano Banana Pro**, atau **Nano Banana 2**?

If the user has already named the model, proceed without asking.

## If the user asks you to choose the model

- Choose **GPT Image 2** for OpenAI workflows, high-fidelity edits, product/ad images, text-heavy images, photorealism, and identity-sensitive preservation.
- Choose **Nano Banana Pro** for complex brand assets, multilingual/localized text, dense diagrams, premium creative control, many references, real-world knowledge, and professional production output.
- Choose **Nano Banana 2** for fast general generation, cost/latency-sensitive drafts, social content, quick variations, and iterative edits.
- If two models fit, ask one short clarifying question: `Prioritasnya kualitas maksimal, teks/brand paling akurat, atau cepat banyak variasi?`
- If the user says “terserah”, pick the most suitable model and state the reason in one sentence before returning the prompt.

## Detail modes

Default to **pro** unless the user asks otherwise.

- **basic**: one polished paragraph plus minimal settings.
- **pro**: labeled creative brief, constraints, and settings.
- **steroid**: full creative direction, model-specific hacks, negative constraints, reference strategy, variant suggestions, and a follow-up revision prompt.

Use **steroid** when the user says “on steroid”, “maksimal”, “super detail”, “production-ready”, “iklan profesional”, “brand asset”, “premium”, “komplit”, “lengkap”, or similar.

## Workflow

1. Identify whether the task is **text-to-image**, **image edit**, **style transfer**, **composition with references**, **text/typography**, **infographic/diagram**, **ad/product visual**, **logo/brand**, **UI mockup**, or **character/identity consistency**.
2. Read the relevant model reference before rewriting:
   - `references/gpt-image-2.md` for GPT Image 2.
   - `references/nano-banana-pro.md` for Nano Banana Pro.
   - `references/nano-banana-2.md` for Nano Banana 2.
3. Read `references/constraints.md` for edits, text-heavy prompts, product visuals, factual diagrams, brand assets, or identity-sensitive prompts.
4. If the task matches a prompt pack, read the relevant file from `references/prompt-packs/`:
   - `poster.md`, `product-ad.md`, `logo-brand.md`, `infographic.md`, `character-consistency.md`, `photo-edit.md`, `ui-mockup.md`, or `reference-composition.md`.
5. Preserve the user's core intent, subject, mood, and constraints. Do not invent brand names, copyrighted characters, factual claims, or source data unless the user supplied them.
6. Convert vague or keyword-only prompts into a clear creative brief using the target model's structure.
7. If essential details are missing, infer safe defaults and mark them as adjustable. Ask follow-up questions only when the missing detail would materially change the image.
8. Output only the improved prompt plus a compact settings block unless the user asked for explanation.

## Prompt enhancement pipeline

Run these passes internally before answering:

1. **Intent extraction**: capture subject, action, scene, output use case, mood, style, text, references, constraints, and target aspect ratio.
2. **Gap filling**: add safe defaults for lighting, composition, material, and camera only when they support the user's intent.
3. **Model strategy**: choose model-specific strengths and failure guards from the selected reference file.
4. **Prompt rewrite**: write natural-language creative direction, not tag soup.
5. **Quality hardening**: add exact text instructions, preservation rules, negative constraints, factual guards, and settings.
6. **Variant planning**: in steroid mode, include 2–3 short variant directions if useful.
7. **Revision readiness**: in steroid mode or edit workflows, include one follow-up prompt template for fixing the most likely failure.

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

For **basic** mode:

```markdown
**Model:** <target model>

**Prompt:**
<polished ready-to-paste prompt>

**Suggested settings:** <short settings line>
```

For **pro** mode:

```markdown
**Model:** <target model>

**Prompt:**
<final prompt ready to paste>

**Suggested settings:**
- Aspect ratio / size: <if relevant>
- Quality / resolution: <if relevant>
- Notes: <short, optional>
```

For **steroid** mode:

```markdown
**Model:** <target model>

**Final prompt:**
<production-ready prompt>

**Negative constraints / guards:**
- <guard>

**Suggested settings:**
- <setting>

**Optional variants:**
1. <variant direction>
2. <variant direction>

**Revision prompt:**
<short follow-up edit prompt template>
```

For edits, always include explicit invariants:

```text
Change only: ...
Keep unchanged: identity, pose, composition, background, lighting, logos, typography, and all other visual elements not mentioned.
```

## After generation / revision workflow

When the user reports a generated image problem:

1. Classify the failure: text, identity drift, composition, style mismatch, realism, artifacts, factual error, unwanted object, or crop/format issue.
2. Ask for the generated image only if visual inspection is needed.
3. Produce a revision prompt: `Change only <problem>. Keep <approved elements> unchanged.`
4. For text failures, quote the exact corrected text and add no-extra-text constraints.
5. For identity drift, restate identity invariants and reference image role.
6. For clutter, simplify composition and add negative space constraints.
7. For realism, add physically plausible lighting, materials, scale, and natural imperfections.

## Quality rules

- Prefer natural-language creative direction over dense tag stuffing.
- Specify subject, action, setting, composition, style, lighting, materials/textures, mood, and final use case.
- Quote exact text that must appear in the image.
- Add negative constraints only when they prevent common failure modes: no extra text, no watermark, no unrelated logos, no changed identity, no over-retouching.
- For factual or time-sensitive images, state the exact date/source requirement or instruct Nano Banana models to use search when available.
- For character consistency or edits, restate what must stay invariant on every iteration.
