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
