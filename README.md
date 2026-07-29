# Image Generator Prompt Builder

AI skill untuk mengubah prompt gambar mentah menjadi prompt yang lebih rapi, detail, dan siap dipakai di image generator.

Skill utama ada di folder [`image-prompt-builder/`](image-prompt-builder/). Repository README ini dibuat supaya halaman utama GitHub langsung menampilkan cara kerja skill, bukan hanya judul repo.

## Model yang didukung

Skill ini mendukung optimasi prompt untuk:

- **GPT Image 2** (`gpt-image-2`)
- **Nano Banana Pro** (`gemini-3-pro-image`)
- **Nano Banana 2** (`gemini-3.1-flash-image`)

## Cara kerja utama

Setiap kali user memberikan prompt atau ide gambar, skill wajib menanyakan target model terlebih dahulu jika model belum disebutkan:

> Mau dioptimasi untuk model apa: **GPT Image 2**, **Nano Banana Pro**, atau **Nano Banana 2**?

Setelah model dipilih, skill akan:

1. Mengidentifikasi tipe pekerjaan: text-to-image, edit gambar, style transfer, composition dengan reference image, typography, infographic, iklan, logo, brand asset, atau consistency workflow.
2. Membaca guideline model yang relevan di folder `image-prompt-builder/references/`.
3. Mempertahankan inti ide, subject, mood, dan constraint dari user.
4. Merapikan prompt menjadi creative brief yang jelas dan model-specific.
5. Menghasilkan prompt final siap tempel plus suggested settings jika diperlukan.

## Struktur repository

```text
image-generator-prompt-builder/
├── README.md
└── image-prompt-builder/
    ├── SKILL.md
    ├── README.md
    ├── agents/
    │   └── openai.yaml
    └── references/
        ├── gpt-image-2.md
        ├── nano-banana-pro.md
        └── nano-banana-2.md
```

## Format output skill

Untuk prompt baru, skill akan mengembalikan format seperti ini:

```markdown
**Model:** <target model>

**Prompt:**
<final prompt ready to paste>

**Suggested settings:**
- Aspect ratio / size: <if relevant>
- Quality / resolution: <if relevant>
- Notes: <short, optional>
```

Untuk edit gambar, skill akan menambahkan invariant agar elemen penting tidak berubah:

```text
Change only: ...
Keep unchanged: identity, pose, composition, background, lighting, logos, typography, and all other visual elements not mentioned.
```

## Contoh penggunaan

User:

```text
bikin poster kopi cyberpunk, ada tulisan NIGHT BREW
```

Assistant:

```text
Mau dioptimasi untuk model apa: GPT Image 2, Nano Banana Pro, atau Nano Banana 2?
```

User:

```text
Nano Banana Pro
```

Assistant:

```markdown
**Model:** Nano Banana Pro

**Prompt:**
Create a vertical 9:16 cyberpunk coffee poster for a premium late-night cafe campaign. Show a glossy black coffee cup on a rain-soaked neon street table, surrounded by purple and cyan holographic reflections, subtle steam rising in the shape of circuit traces, cinematic depth, premium editorial composition, high contrast, polished commercial poster style.

Render the exact headline "NIGHT BREW" once, large and clearly legible at the top, in bold neon sans-serif typography with cyan glow. Keep the rest of the poster free of additional words.

**Suggested settings:**
- Aspect ratio / size: 9:16 vertical poster
- Quality / resolution: 2K or 4K if available
- Notes: Keep text exact; no extra words, no watermark, no unrelated logo.
```

## Isi guideline per model

- [`gpt-image-2.md`](image-prompt-builder/references/gpt-image-2.md): guideline untuk GPT Image 2, termasuk quality, size, text rendering, ads, logos, diagrams, edits, dan consistency.
- [`nano-banana-pro.md`](image-prompt-builder/references/nano-banana-pro.md): guideline untuk Nano Banana Pro / Gemini 3 Pro Image, termasuk advanced creative control, localization, brand consistency, text, references, dan edits.
- [`nano-banana-2.md`](image-prompt-builder/references/nano-banana-2.md): guideline untuk Nano Banana 2 / Gemini 3.1 Flash Image, termasuk general prompting, references, text rendering, creative direction, dan search-aware visuals.

## Sumber guideline

Guideline diringkas dari sumber resmi berikut, dicek pada 29 Juli 2026:

- OpenAI GPT Image Generation Models Prompting Guide
- Google AI Gemini image generation docs
- Google Blog: Nano Banana Pro prompt tips
- Google Cloud: Ultimate prompting guide for Nano Banana
