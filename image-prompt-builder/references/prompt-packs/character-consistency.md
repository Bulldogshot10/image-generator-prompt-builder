# Character consistency prompt pack

Use for recurring characters, avatars, portraits, comic panels, mascots, and identity-preserving edits.

Extract: identity reference, face/body traits, outfit, pose, expression, setting, style, and what must remain unchanged.

Model adjustments:
- GPT Image 2: strong for identity-sensitive edits and close portraits.
- Nano Banana Pro: use for multi-reference character systems and professional sheets.
- Nano Banana 2: use for fast iterations while restating invariants.

Template:

```text
Create <image type> featuring the same character as the reference.
Identity to preserve: face shape, age, skin tone, hairstyle, body proportions, expression style.
New scene/action: <scene/action>.
Outfit/props: <details>.
Style: <visual style>.
Composition: <framing/camera>.
Must preserve: identity, proportions, recognizable facial features, and approved outfit details.
Constraints: no age change, no face swap, no changed ethnicity, no extra characters unless requested.
```
