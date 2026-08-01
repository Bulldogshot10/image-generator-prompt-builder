# Infographic prompt pack

Use for diagrams, educational explainers, data visuals, timelines, process charts, and comparison graphics.

Extract: topic, audience, facts/data, labels, hierarchy, sections, language, orientation, and source/date requirements.

Model adjustments:
- GPT Image 2: use `quality: high` for text-heavy diagrams.
- Nano Banana Pro: best for real-world knowledge, localization, and dense explainers.
- Nano Banana 2: good for concise educational diagrams and quick visual summaries.


Additional model adjustments:
- Z-Image: use photographic subject/scene/lighting/camera/material specificity; fold critical constraints into the positive prompt if negative prompts are unsupported.
- SDXL: return positive prompt, negative prompt, and recommended settings; include LoRA/ControlNet/IP-Adapter only if user provides or requests them.
- FLUX: use coherent natural language with strong composition and reference-role clarity; use Kontext-style change-only wording for edits.

Template:

```text
Create a clear <aspect ratio> infographic for <audience> explaining <topic>.
Use only these facts: <facts/data>.
Layout: <number of panels/flow/hierarchy>.
Labels: Render exactly these labels: <labels>.
Style: <clean editorial / scientific / playful / corporate>.
Accessibility: strong contrast, readable labels, logical arrows, uncluttered spacing.
Constraints: do not invent data, no extra labels, no watermark, preserve exact language.
```
