# dotfiles

General dotfiles managed with [yadm](https://yadm.io/). Contains configs shared between Arch Linux and macOS.

## Repos

- **General**: https://github.com/stivce-devops-dude/dotfiles (this repo)
- **Arch-specific**: https://github.com/stivce-devops-dude/dotfiles-arch
- **macOS-specific**: https://github.com/stivce-devops-dude/dotfiles-macos

## Setup

```bash
# Clone general + arch repos
yadm clone git@github.com:stivce-devops-dude/dotfiles.git
cd ~/.dotfiles-archive 2>/dev/null || true
git clone git@github.com:stivce-devops-dude/dotfiles-arch.git ../dotfiles-arch

# Bootstrap
yadm bootstrap
```

## What's Included

- **Shell**: zsh config (`.zshrc`, `.config/zshrc.d/`)
- **Terminal**: kitty config
- **Editor**: neovim (`init.lua`)
- **Prompt**: starship
- **Yadm**: bootstrap scripts and package lists

## What's NOT Included

OS-specific configs (Hyprland, gaming, etc.) are in separate repos:
- Arch: `dotfiles-arch`
- macOS: `dotfiles-macos`

## Adding New General Configs

```bash
yadm add ~/.config/foo/bar
yadm commit -m "add foo config"
yadm push
```
