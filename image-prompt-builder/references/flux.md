# FLUX prompt guidelines

Sources checked August 1, 2026:
- Black Forest Labs prompting guide: https://docs.bfl.ml/guides/prompting_summary
- Black Forest Labs documentation: https://docs.bfl.ml/quick_start/introduction
- FLUX.2 announcement: https://bfl.ai/blog/flux-2
- FLUX.1 Kontext announcement: https://bfl.ai/blog/flux-1-kontext

## Model positioning

Use FLUX for high prompt adherence, modern photorealism, natural-language prompting, strong visual consistency, typography-aware workflows, and reference/edit tasks when the user mentions FLUX Kontext.

## Variant notes

- FLUX Pro/Flex/API: use instruction-hosted output with final prompt and settings.
- FLUX Dev: use for local high-quality experimentation and ComfyUI-style workflows.
- FLUX Schnell/Klein: use for fast/open workflows where speed matters.
- FLUX Kontext: use for image editing, reference-guided changes, identity/style transfer, and in-context image generation.
- FLUX.2: use for structured prompts, complex text, brand guidelines, multiple references, and consistency-heavy work when available.

## Prompt style

- Prefer coherent natural language over SDXL-style tag soup.
- Specify subject, action, environment, composition, lighting, camera, material, mood, style, and text.
- Keep critical constraints explicit and non-contradictory.
- For exact text, quote the text and specify placement, typography, and no-extra-text constraints.
- For references, label each image role and state what to ignore.

## Kontext/edit template

```text
Using the reference image, change only <specific element>.
Preserve <identity/composition/text/style/product geometry>.
Match perspective, lighting, shadows, reflections, and material.
Do not add unrelated objects, logos, or text.
```

## Hosted template

```text
Create <asset type> showing <subject/action> in <scene>.
Composition: <framing, aspect ratio, hierarchy, negative space>.
Visual style: <photoreal/editorial/illustration/etc>, <lighting>, <camera>, <materials>, <mood>.
Text: render exactly "<copy>" at <placement> in <typography>.
Constraints: <preserve references, no extra text, no watermark, no unrelated logos>.
```

## Local workflow template

```text
Prompt:
<natural-language FLUX prompt with subject, scene, composition, lighting, style, text, constraints>

Recommended settings:
- Aspect ratio / resolution: <target>
- Guidance / steps: <workflow defaults unless user asks>
- Seed: keep fixed for revisions
- Workflow notes: <Kontext/reference/img2img notes if needed>
```

## Failure guards

- Avoid contradictory style terms and overstuffed tag lists.
- Preserve reference roles and identity/product invariants.
- Keep exact text quoted and limit extra typography requests.
- Use local diffusion settings only when the user asks for local workflow output.
