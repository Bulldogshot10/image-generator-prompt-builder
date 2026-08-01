# Constraint library

Use these snippets only when they protect the user's intent. Prefer positive instructions first, then add constraints for common failure modes.

## Text accuracy

- Render only this exact text: `"<TEXT>"`.
- The text must appear exactly once, spelled exactly as written.
- No extra text, no duplicate words, no pseudo-letters, no watermark, no signature.
- Preserve line breaks, capitalization, punctuation, and language.

## Identity preservation

- Preserve the person's face shape, age, skin tone, hairstyle, expression, body proportions, pose, and clothing unless explicitly changed.
- Use the reference image only for identity, not for copying background or lighting unless requested.
- Do not beautify, age-change, gender-change, or stylize the identity beyond the requested style.

## Product preservation

- Preserve product geometry, label placement, packaging dimensions, color, logo, material, and scale.
- Do not invent extra labels, certification marks, ingredients, or claims.
- Keep reflections physically plausible and avoid warped packaging.

## Logo and brand control

- Use only the supplied brand/logo if provided.
- No unrelated logos, no fake brand names, no trademark-like marks unless supplied by the user.
- Keep the brand palette, typography style, spacing, and layout hierarchy consistent.

## Layout preservation

- Preserve composition, margins, spacing, hierarchy, and text placement unless explicitly changed.
- Keep enough negative space for copy and avoid clutter.
- Do not crop critical subject, text, product, hands, or logo.

## Photorealism

- Use physically plausible lighting, shadows, reflections, materials, and scale.
- Include subtle natural imperfections: fabric texture, pores, dust, fingerprints, small asymmetry, lens softness.
- Avoid plastic skin, uncanny eyes, oversmoothing, impossible reflections, and over-sharpened HDR.

## Factual visuals

- Use only user-provided facts or clearly requested source/date information.
- Do not invent statistics, labels, maps, flags, dates, or citations.
- If facts are missing, ask for the data or create a clearly fictional/conceptual visual.

## Edit scope

- Change only the requested element.
- Keep all other visual elements unchanged: identity, pose, composition, background, lighting, camera angle, text, logo, style, and color palette.

## Diffusion negative prompt library

Use these for SDXL or local diffusion workflows when relevant:

- Quality/artifacts: low quality, blurry, jpeg artifacts, noisy, over-sharpened, oversaturated, bad lighting.
- Anatomy: bad anatomy, deformed hands, extra fingers, missing fingers, malformed face, asymmetrical eyes, broken limbs.
- Text/logos: bad text, gibberish text, misspelled text, extra text, watermark, signature, username, unrelated logo.
- Products: warped product, distorted label, duplicated object, broken logo, incorrect packaging, impossible reflections.
- Layout: cropped subject, cropped text, cluttered composition, unreadable layout, cut-off hands.

## Positive constraint fallback

Use when a model or pipeline ignores negative prompts, especially some Turbo/local workflows:

- Instead of only `bad hands`, write `clean natural hands with five correctly shaped fingers`.
- Instead of only `no extra text`, write `the only visible text is exactly "<TEXT>"`.
- Instead of only `warped product`, write `straight product edges, accurate label placement, symmetrical packaging geometry`.
- Instead of only `blurry`, write `sharp subject focus with clean details and natural texture`.

## Local workflow settings notes

- Keep seed fixed for revisions and change one variable at a time.
- Randomize seed only for exploration/variants.
- Use img2img, inpainting, ControlNet, IP-Adapter, or Kontext/reference tools when identity, pose, layout, or product geometry must be preserved.
- Do not invent LoRA names, trigger words, or checkpoint-specific settings.
