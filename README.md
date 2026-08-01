# Image Generator Prompt Builder

AI skill untuk mengubah prompt gambar mentah menjadi prompt yang lebih rapi, detail, dan siap dipakai di image generator.

Skill utama ada di folder [`image-prompt-builder/`](image-prompt-builder/). Repository README ini dibuat supaya halaman utama GitHub langsung menampilkan cara kerja skill, bukan hanya judul repo.

## Model yang didukung

Skill ini mendukung optimasi prompt untuk:

- **GPT Image 2** (`gpt-image-2`)
- **Nano Banana Pro** (`gemini-3-pro-image`)
- **Nano Banana 2** (`gemini-3.1-flash-image`)
- **Z-Image**
- **SDXL**
- **FLUX**

## Install

Pilih salah satu cara install berikut. Default target Codex akan memasang skill ke `${CODEX_HOME:-~/.codex}/skills/image-prompt-builder`.

### Install via curl

```bash
curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash
```

Target lain:

```bash
# Claude Code
curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash -s -- --target claude

# Cursor
curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash -s -- --target cursor

# Install ke Codex, Claude Code, dan Cursor sekaligus
curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash -s -- --target all --force
```

### Install via npx

Kalau package sudah tersedia lewat npm atau dijalankan langsung dari GitHub, gunakan:

```bash
# Codex
npx github:Bulldogshot10/image-generator-prompt-builder --target codex

# Claude Code
npx github:Bulldogshot10/image-generator-prompt-builder --target claude

# Cursor
npx github:Bulldogshot10/image-generator-prompt-builder --target cursor

# Semua target
npx github:Bulldogshot10/image-generator-prompt-builder --target all --force
```

### Install manual untuk Codex

```bash
git clone https://github.com/Bulldogshot10/image-generator-prompt-builder.git
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R image-generator-prompt-builder/image-prompt-builder "${CODEX_HOME:-$HOME/.codex}/skills/"
```

Restart Codex setelah install supaya skill baru terdeteksi.

### Install manual untuk Claude Code

```bash
git clone https://github.com/Bulldogshot10/image-generator-prompt-builder.git
mkdir -p "$HOME/.claude/skills"
cp -R image-generator-prompt-builder/image-prompt-builder "$HOME/.claude/skills/"
```

Restart Claude Code setelah install supaya skill baru terdeteksi.

### Install manual untuk Cursor

```bash
git clone https://github.com/Bulldogshot10/image-generator-prompt-builder.git
mkdir -p "$HOME/.cursor/skills"
cp -R image-generator-prompt-builder/image-prompt-builder "$HOME/.cursor/skills/"
```

Kalau konfigurasi Cursor kamu memakai folder skill/custom instructions lain, gunakan installer dengan `--dir`:

```bash
curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash -s -- --dir /path/to/skills
```

## Cara kerja utama

Setiap kali user memberikan prompt atau ide gambar, skill wajib menanyakan target model terlebih dahulu jika model belum disebutkan:

> Mau dioptimasi untuk model apa: **GPT Image 2**, **Nano Banana Pro**, **Nano Banana 2**, **Z-Image**, **SDXL**, atau **FLUX**?

Setelah model dipilih, skill akan:

1. Mengidentifikasi tipe pekerjaan: text-to-image, edit gambar, style transfer, composition dengan reference image, typography, infographic, iklan, logo, brand asset, atau consistency workflow.
2. Membaca guideline model yang relevan di folder `image-prompt-builder/references/`.
3. Mempertahankan inti ide, subject, mood, dan constraint dari user.
4. Merapikan prompt menjadi creative brief yang jelas dan model-specific.
5. Menghasilkan prompt final siap tempel plus suggested settings jika diperlukan.

## Mode detail

Skill punya tiga mode output:

- **basic**: satu paragraf prompt yang sudah dirapikan plus setting singkat.
- **pro**: creative brief berlabel, constraints, dan suggested settings. Ini default.
- **steroid**: prompt production-ready super detail dengan model-specific hacks, negative constraints, reference strategy, optional variants, revision prompt, atau output diffusion-local dengan positive/negative prompt dan settings.

Gunakan kata seperti `on steroid`, `maksimal`, `super detail`, `production-ready`, `iklan profesional`, atau `brand asset` untuk memicu steroid mode.

## Model tambahan

Selain GPT Image 2 dan Nano Banana, skill juga mendukung model open/local modern:

- **Z-Image**: cocok untuk photorealistic/cinematic prompt, portrait, fashion/editorial, product visuals, dan Z-Image Turbo/local workflows. Skill akan memakai formula subject → scene → lighting → camera → material/detail → style/color grade → constraints.
- **SDXL**: cocok untuk Stable Diffusion XL, ComfyUI, Automatic1111/Forge, LoRA, ControlNet, IP-Adapter, img2img, dan inpainting. Output SDXL akan memakai `Positive prompt`, `Negative prompt`, dan `Recommended settings`.
- **FLUX**: cocok untuk high prompt adherence, modern photorealism, natural-language prompts, FLUX Pro/Dev/Schnell, serta FLUX Kontext untuk edit/reference workflows.

Contoh request SDXL:

```text
bikin prompt SDXL buat product photo sepatu, lengkap positive negative dan settings
```

Output akan mencakup positive prompt, negative prompt, setting ukuran/aspect ratio, steps/guidance/sampler placeholder, seed notes, dan optional workflow notes.

## Advanced use cases

Skill sekarang punya prompt packs untuk use case populer:

- Poster, flyer, album cover, dan event visual.
- Product ad, ecommerce image, packaging shot, dan hero banner.
- Logo, app icon, dan brand identity concept.
- Infographic, diagram, timeline, dan visual explainer.
- Character consistency, avatar, portrait, dan mascot.
- Photo edit, object removal, retouching, dan style transfer.
- UI mockup, landing page, dashboard, dan mobile screen.
- Multi-reference composition untuk menggabungkan beberapa image reference.

## Contoh steroid mode

User:

```text
bikin prompt on steroid buat iklan parfum futuristik, target Nano Banana Pro
```

Assistant:

```markdown
**Model:** Nano Banana Pro

**Final prompt:**
Create a premium 9:16 futuristic perfume advertisement for a luxury fragrance campaign aimed at Gen Z and young professionals. Show a transparent glass perfume bottle floating above a reflective obsidian platform inside a neon botanical lab, surrounded by holographic petals, soft vapor, and precise cyan-magenta rim lighting. Use a high-end editorial product photography style with realistic glass caustics, clean negative space for copy, sharp product geometry, and a cinematic dark-luxury color grade.

Render exactly once: "AURA//2099" as the main headline near the top, and "Future scent. Human pulse." as a smaller tagline near the bottom. Keep typography clean, modern, and legible.

**Negative constraints / guards:**
- No extra text, no watermark, no unrelated logos.
- Do not warp the bottle, label, cap, or glass reflections.
- Keep product centered and fully visible.

**Suggested settings:**
- Aspect ratio / size: 9:16 vertical ad
- Resolution: 2K or 4K if available
- Notes: prioritize text accuracy and product geometry

**Optional variants:**
1. More minimalist luxury with white marble and soft gold lighting.
2. More cyberpunk with rain, chrome, and neon reflections.

**Revision prompt:**
Change only the incorrect text or product distortion. Keep composition, bottle geometry, lighting, reflections, and approved typography unchanged.
```

## Troubleshooting hasil gambar

Kalau hasil gambar belum pas, kirim feedback singkat seperti:

- `teksnya salah`
- `wajahnya berubah`
- `kurang realistis`
- `hapus objek ini aja`
- `buat versi 9:16 dan 1:1`
- `produk jadi melengkung, benerin tanpa ubah background`

## Struktur repository

```text
image-generator-prompt-builder/
├── README.md
└── image-prompt-builder/
    ├── SKILL.md
    ├── agents/
    │   └── openai.yaml
    └── references/
        ├── constraints.md
        ├── gpt-image-2.md
        ├── nano-banana-pro.md
        ├── nano-banana-2.md
        ├── z-image.md
        ├── sdxl.md
        ├── flux.md
        └── prompt-packs/
            ├── poster.md
            ├── product-ad.md
            ├── logo-brand.md
            ├── infographic.md
            ├── character-consistency.md
            ├── photo-edit.md
            ├── ui-mockup.md
            └── reference-composition.md
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

- [`image-prompt-builder/SKILL.md`](image-prompt-builder/SKILL.md): aturan utama skill, model router, detail modes, steroid mode, revision loop, dan workflow prompt packs.
- [`constraints.md`](image-prompt-builder/references/constraints.md): library constraints untuk text accuracy, identity, product, brand, layout, realism, factual visuals, dan edit scope.
- [`prompt-packs/`](image-prompt-builder/references/prompt-packs/): template use case untuk poster, product ad, logo/brand, infographic, character consistency, photo edit, UI mockup, dan multi-reference composition.
- [`z-image.md`](image-prompt-builder/references/z-image.md): guideline Z-Image untuk photoreal/cinematic prompt formula dan Turbo/local workflows.
- [`sdxl.md`](image-prompt-builder/references/sdxl.md): guideline SDXL untuk positive prompt, negative prompt, LoRA/ControlNet, dan recommended settings.
- [`flux.md`](image-prompt-builder/references/flux.md): guideline FLUX untuk natural-language prompting, FLUX variants, dan Kontext edit/reference workflows.
- [`gpt-image-2.md`](image-prompt-builder/references/gpt-image-2.md): guideline untuk GPT Image 2, termasuk quality, size, text rendering, ads, logos, diagrams, edits, advanced hacks, dan consistency.
- [`nano-banana-pro.md`](image-prompt-builder/references/nano-banana-pro.md): guideline untuk Nano Banana Pro / Gemini 3 Pro Image, termasuk advanced creative control, localization, brand consistency, text, references, dan edits.
- [`nano-banana-2.md`](image-prompt-builder/references/nano-banana-2.md): guideline untuk Nano Banana 2 / Gemini 3.1 Flash Image, termasuk general prompting, references, text rendering, creative direction, dan search-aware visuals.

## Sumber guideline

Guideline diringkas dari sumber resmi berikut, dicek pada 29 Juli 2026:

- OpenAI GPT Image Generation Models Prompting Guide
- Google AI Gemini image generation docs
- Google Blog: Nano Banana Pro prompt tips
- Google Cloud: Ultimate prompting guide for Nano Banana
