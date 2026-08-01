#!/usr/bin/env bash
set -euo pipefail

REPO_SLUG="${IMAGE_PROMPT_BUILDER_REPO:-Bulldogshot10/image-generator-prompt-builder}"
REF="${IMAGE_PROMPT_BUILDER_REF:-main}"
TARGET="codex"
CUSTOM_DIR=""
FORCE="false"

usage() {
  cat <<'HELP'
Image Prompt Builder installer

Usage:
  curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash
  curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash -s -- --target claude
  curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash -s -- --target cursor
  curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash -s -- --target all --force
  curl -fsSL https://raw.githubusercontent.com/Bulldogshot10/image-generator-prompt-builder/main/install.sh | bash -s -- --dir ~/.codex/skills

Options:
  --target <codex|claude|cursor|all>  Install into a known local skills directory. Default: codex
  --dir <path>                       Install into a custom skills directory
  --force                            Replace an existing image-prompt-builder skill
  --help                             Show this help
HELP
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET="$2"
      shift 2
      ;;
    --target=*)
      TARGET="${1#--target=}"
      shift
      ;;
    --dir)
      CUSTOM_DIR="$2"
      shift 2
      ;;
    --dir=*)
      CUSTOM_DIR="${1#--dir=}"
      shift
      ;;
    --force)
      FORCE="true"
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

expand_path() {
  local input="$1"
  case "$input" in
    ~) printf '%s\n' "$HOME" ;;
    ~/*) printf '%s/%s\n' "$HOME" "${input#~/}" ;;
    *) printf '%s\n' "$input" ;;
  esac
}

skill_dir_for_target() {
  case "$1" in
    codex) printf '%s\n' "${CODEX_HOME:-$HOME/.codex}/skills" ;;
    claude) printf '%s\n' "$HOME/.claude/skills" ;;
    cursor) printf '%s\n' "$HOME/.cursor/skills" ;;
    *) return 1 ;;
  esac
}

TMP_DIR="$(mktemp -d)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

if [[ -d "image-prompt-builder" && -f "image-prompt-builder/SKILL.md" ]]; then
  SOURCE_DIR="$(pwd)/image-prompt-builder"
else
  ARCHIVE_URL="https://github.com/${REPO_SLUG}/archive/refs/heads/${REF}.tar.gz"
  curl -fsSL "$ARCHIVE_URL" -o "$TMP_DIR/repo.tar.gz"
  tar -xzf "$TMP_DIR/repo.tar.gz" -C "$TMP_DIR"
  SOURCE_DIR="$(find "$TMP_DIR" -maxdepth 2 -type d -name image-prompt-builder | head -n 1)"
fi

if [[ -z "${SOURCE_DIR:-}" || ! -f "$SOURCE_DIR/SKILL.md" ]]; then
  echo "Could not find image-prompt-builder/SKILL.md" >&2
  exit 1
fi

install_into() {
  local skills_dir
  skills_dir="$(expand_path "$1")"
  local destination="$skills_dir/image-prompt-builder"

  mkdir -p "$skills_dir"
  if [[ -e "$destination" ]]; then
    if [[ "$FORCE" != "true" ]]; then
      echo "Already installed at $destination. Re-run with --force to replace it." >&2
      exit 1
    fi
    rm -rf "$destination"
  fi

  cp -R "$SOURCE_DIR" "$destination"
  echo "Installed image-prompt-builder to $destination"
}

if [[ -n "$CUSTOM_DIR" ]]; then
  install_into "$CUSTOM_DIR"
elif [[ "$TARGET" == "all" ]]; then
  install_into "$(skill_dir_for_target codex)"
  install_into "$(skill_dir_for_target claude)"
  install_into "$(skill_dir_for_target cursor)"
elif skill_dir="$(skill_dir_for_target "$TARGET")"; then
  install_into "$skill_dir"
else
  echo "Invalid target: $TARGET. Use codex, claude, cursor, all, or --dir." >&2
  exit 1
fi
