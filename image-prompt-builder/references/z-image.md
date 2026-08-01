# Z-Image prompt guidelines

Sources checked August 1, 2026:
- Tongyi-MAI Z-Image GitHub: https://github.com/Tongyi-MAI/Z-Image
- Z-Image docs: https://zimage.net/docs
- LTX Z-Image Prompt Guide: https://ltx.io/blog/z-image-prompt-guide

## Model positioning

Use Z-Image for photorealistic and cinematic images, portraits, product/fashion/editorial visuals, fast local/Turbo workflows, and creative image-to-image/edit tasks when the user names Z-Image or Z-Image Turbo.

Z-Image works best with prompts that are specific, visually grounded, and production-oriented. Avoid vague mood-only prompts.

## Prompt formula

Structure prompts in this order:

1. Subject and context.
2. Scene/environment.
3. Lighting and time of day.
4. Camera/composition.
5. Material, texture, and micro-detail.
6. Style, color grade, or film stock.
7. Constraints and preservation rules.

## Z-Image Turbo notes

- Keep prompts concise but detailed; 80–250 focused words is often a good range.
- If the target pipeline ignores or weakens negative prompts, rewrite critical negatives as positive constraints.
- Prefer precise visual nouns and concrete lighting/camera instructions over poetic filler.
- For edits, use explicit change-only wording and restate what must remain unchanged.

## Text rendering

- Quote exact text.
- Specify language, placement, typography style, size/weight, and contrast.
- Add no-extra-text constraints in the positive prompt if negative prompts are unsupported.

## Template

```text
Positive prompt:
<subject/context>, <scene/environment>, <lighting/time>, <camera/composition>, <materials/textures>, <style/color grade>, with <positive constraints such as clean text, preserved identity/product geometry, no extra words>.

Optional negative prompt if pipeline supports it:
<watermark, extra text, warped product, deformed hands, bad anatomy, blurry, low quality, artifacts>

Suggested settings:
- Aspect ratio / resolution: <target>
- Guidance / steps: <pipeline defaults unless user asks>
- Seed: keep fixed for revisions
```

## Failure guards

- Do not rely only on negative prompts for critical requirements.
- Avoid contradictory lighting/camera instructions.
- Preserve product geometry, label placement, and identity traits in edits.
- Keep typography instructions short, exact, and visible.
