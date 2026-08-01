# SDXL prompt guidelines

Sources checked August 1, 2026:
- Stability AI model page: https://stability.ai/stable-image
- SDXL paper: https://arxiv.org/abs/2307.01952
- Stable Diffusion prompt guide: https://stable-diffusion-art.com/prompt-guide/

## Model positioning

Use SDXL for Stable Diffusion XL, local generation, ComfyUI, Automatic1111, Forge, LoRA, ControlNet, IP-Adapter, img2img, inpainting, and workflows where the user expects positive/negative prompts plus sampler/settings.

SDXL is a diffusion workflow model. Do not return only prose unless the user explicitly asks for a natural-language draft.

## Prompt anatomy

Positive prompt should include:

- Subject and action.
- Medium/style and genre.
- Composition and camera/framing.
- Lighting and atmosphere.
- Materials/textures and key details.
- Quality/style tokens only when useful.
- LoRA trigger words only if the user provides them.

Negative prompt should include only relevant failure guards:

- low quality, blurry, jpeg artifacts, watermark, signature, username.
- bad anatomy, deformed hands, extra fingers, missing fingers, malformed face.
- bad text, gibberish text, misspelled text, extra text.
- warped product, duplicated object, broken logo, distorted label.

## Recommended settings

- Native SDXL base resolution is commonly 1024-class; adapt aspect ratio to the user.
- Steps: use the user's workflow defaults; otherwise suggest a moderate range such as 25–40 for quality workflows.
- CFG/guidance: use workflow defaults; otherwise suggest moderate guidance and avoid overcooking.
- Sampler: ask if the user has a preferred sampler; otherwise provide a placeholder.
- Seed: keep fixed for revisions; randomize for exploration.
- Hi-res fix/upscale: suggest only for final polish, not initial ideation.

## LoRA, ControlNet, and references

- Do not invent LoRA names or trigger words.
- If the user supplies LoRA triggers, include them in the positive prompt exactly.
- Use ControlNet/IP-Adapter/reference notes only when the user needs pose, layout, depth, identity, or product geometry preservation.

## Template

```text
Positive prompt:
<subject>, <action>, <environment>, <composition/camera>, <lighting>, <style/medium>, <materials/textures>, <quality details>, <LoRA triggers if provided>

Negative prompt:
<relevant artifacts/anatomy/text/watermark/product guards>

Recommended settings:
- Size/aspect ratio: <target>
- Steps: <range or workflow default>
- CFG/guidance: <range or workflow default>
- Sampler: <user preference or placeholder>
- Seed: <fixed for revisions / random for variants>
- Optional workflow notes: <ControlNet/IP-Adapter/img2img/upscale if needed>
```
