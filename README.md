# dotfiles

General dotfiles managed with [yadm](https://yadm.io/). Supports Arch Linux and macOS.

## Setup

```bash
yadm clone git@github.com:stivce-devops-dude/dotfiles.git
yadm bootstrap
```

The bootstrap script automatically detects your OS and clones the appropriate OS-specific repo.

## What's Included

- **Shell**: zsh config (`.zshrc`, `.config/zshrc.d/`)
- **Terminal**: kitty config
- **Editor**: neovim (`init.lua`)
- **Prompt**: starship
- **Yadm**: bootstrap scripts and package lists

## Adding New Configs

```bash
yadm add ~/.config/foo/bar
yadm commit -m "add foo config"
yadm push
```
