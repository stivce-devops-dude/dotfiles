#!/usr/bin/env bash
# deploy-dotfiles.sh — simulates yadm alt for CI environments
# Usage: deploy-dotfiles.sh <platform>
# platform: linux-arch | linux-ubuntu | macos
set -euo pipefail
shopt -s nullglob nocaseglob

PLATFORM="${1:?Usage: deploy-dotfiles.sh <linux-arch|linux-ubuntu|macos>}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

case "$PLATFORM" in
  linux-arch)   OS_TOKEN="Linux"; DISTRO_TOKEN="arch" ;;
  linux-ubuntu) OS_TOKEN="Linux"; DISTRO_TOKEN="ubuntu" ;;
  macos)        OS_TOKEN="Darwin"; DISTRO_TOKEN="" ;;
  *) echo "Unknown platform: $PLATFORM" >&2; exit 1 ;;
esac

# Pick the most-specific alternate for a given base path:
# ##distro.X > ##os.X > plain file
pick_variant() {
  local base="$1"
  if [[ -n "$DISTRO_TOKEN" && -f "${base}##distro.${DISTRO_TOKEN}" ]]; then
    echo "${base}##distro.${DISTRO_TOKEN}"
  elif [[ -f "${base}##os.${OS_TOKEN}" ]]; then
    echo "${base}##os.${OS_TOKEN}"
  elif [[ -f "$base" ]]; then
    echo "$base"
  fi
}

deploy() {
  local src="$1" dest="$2"
  [[ -z "$src" ]] && return 0
  # Skip if source and destination are the same file (e.g. when running locally)
  [[ "$src" -ef "$dest" ]] && return 0
  # Skip realpath validation in CI (HOME may not exist)
  if [[ -d "$HOME" ]]; then
    local real_dest
    real_dest=$(realpath -m "$dest" 2>/dev/null) || true
    if [[ -n "$real_dest" && "$real_dest" != "$HOME"* ]]; then
      echo "ERROR: Destination outside HOME: $dest" >&2
      return 1
    fi
  fi
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "  deployed: $dest"
}

echo "==> Deploying dotfiles for platform: $PLATFORM"

# .zshrc
deploy "$(pick_variant "$REPO_ROOT/.zshrc")" "$HOME/.zshrc"

# .config/zshrc.d — walk all files, skip raw alternate variants
mkdir -p "$HOME/.config/zshrc.d"
for f in "$REPO_ROOT/.config/zshrc.d/"*; do
  fname="$(basename "$f")"
  [[ "$fname" == *"##"* ]] && continue   # skip alternates, handled via pick_variant
  deploy "$(pick_variant "$REPO_ROOT/.config/zshrc.d/$fname")" "$HOME/.config/zshrc.d/$fname"
done

# Also deploy files that exist ONLY as alternates (e.g. 10-aliases-linux.zsh##os.Linux)
for f in "$REPO_ROOT/.config/zshrc.d/"*"##os.${OS_TOKEN}"; do
  [[ -f "$f" ]] || continue
  fname="$(basename "${f%%##*}")"
  dest="$HOME/.config/zshrc.d/$fname"
  [[ -f "$dest" ]] && continue   # already deployed by plain variant above
  deploy "$f" "$dest"
done
if [[ -n "$DISTRO_TOKEN" ]]; then
  for f in "$REPO_ROOT/.config/zshrc.d/"*"##distro.${DISTRO_TOKEN}"; do
    [[ -f "$f" ]] || continue
    fname="$(basename "${f%%##*}")"
    dest="$HOME/.config/zshrc.d/$fname"
    [[ -f "$dest" ]] && continue
    deploy "$f" "$dest"
  done
fi

# .config/starship/starship.toml
mkdir -p "$HOME/.config/starship"
deploy "$(pick_variant "$REPO_ROOT/.config/starship/starship.toml")" \
  "$HOME/.config/starship/starship.toml"

echo "==> Deploy complete"
