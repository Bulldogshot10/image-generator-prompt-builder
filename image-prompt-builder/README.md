# Image Prompt Builder Skill

`image-prompt-builder` adalah AI skill untuk mengubah prompt gambar mentah dari user menjadi prompt yang lebih rapi, jelas, dan siap ditempel ke image generator.

Skill ini mendukung optimasi prompt untuk:

- **GPT Image 2** (`gpt-image-2`)
- **Nano Banana Pro** (`gemini-3-pro-image`)
- **Nano Banana 2** (`gemini-3.1-flash-image`)

## Perilaku utama

Setiap kali user memberikan prompt/ide gambar, skill wajib menanyakan target model terlebih dahulu jika belum disebutkan:

> Mau dioptimasi untuk model apa: **GPT Image 2**, **Nano Banana Pro**, atau **Nano Banana 2**?

Setelah model dipilih, skill akan:

1. Mengidentifikasi tipe pekerjaan: text-to-image, edit gambar, style transfer, typography, infographic, iklan, logo, brand asset, atau consistency workflow.
2. Membaca guideline model yang relevan di folder `references/`.
3. Mempertahankan inti ide user.
4. Menambahkan struktur prompt yang jelas: subject, scene, composition, style, lighting, camera, text, constraints, dan suggested settings.
5. Menghasilkan prompt final yang siap dipakai.

## Struktur folder

```text
image-prompt-builder/
├── SKILL.md
├── README.md
├── agents/
│   └── openai.yaml
└── references/
    ├── gpt-image-2.md
    ├── nano-banana-pro.md
    └── nano-banana-2.md
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

Assistant akan mengembalikan prompt dengan format seperti:

```markdown
**Model:** Nano Banana Pro

**Prompt:**
Create a vertical 9:16 cyberpunk coffee poster for a premium late-night cafe campaign...
Render the exact headline "NIGHT BREW" once, in bold neon sans-serif typography...

**Suggested settings:**
- Aspect ratio / size: 9:16 vertical poster
- Quality / resolution: 2K or 4K if available
- Notes: Keep text exact; no extra words or watermark.
```

## Sumber guideline

Guideline diringkas dari sumber resmi berikut, dicek pada 29 Juli 2026:

- OpenAI GPT Image Generation Models Prompting Guide
- Google AI Gemini image generation docs
- Google Blog: Nano Banana Pro prompt tips
- Google Cloud: Ultimate prompting guide for Nano Banana

Detail ringkasan tiap model tersedia di file referensi masing-masing.
