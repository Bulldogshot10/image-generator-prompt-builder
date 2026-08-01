# Character consistency prompt pack

Use for recurring characters, avatars, portraits, comic panels, mascots, and identity-preserving edits.

Extract: identity reference, face/body traits, outfit, pose, expression, setting, style, and what must remain unchanged.

Model adjustments:
- GPT Image 2: strong for identity-sensitive edits and close portraits.
- Nano Banana Pro: use for multi-reference character systems and professional sheets.
- Nano Banana 2: use for fast iterations while restating invariants.


Additional model adjustments:
- Z-Image: use photographic subject/scene/lighting/camera/material specificity; fold critical constraints into the positive prompt if negative prompts are unsupported.
- SDXL: return positive prompt, negative prompt, and recommended settings; include LoRA/ControlNet/IP-Adapter only if user provides or requests them.
- FLUX: use coherent natural language with strong composition and reference-role clarity; use Kontext-style change-only wording for edits.

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
