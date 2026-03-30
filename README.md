# dotfiles

General dotfiles managed with [yadm](https://yadm.io/). Supports Arch Linux and macOS.

| CI Job | Badge |
|--------|-------|
| Lint | [![Lint](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test.yml/badge.svg?job=lint)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test.yml) |
| Test Arch | [![Test Arch](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test.yml/badge.svg?job=test-arch)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test.yml) |
| Test Ubuntu | [![Test Ubuntu](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test.yml/badge.svg?job=test-ubuntu)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test.yml) |
| Test macOS | [![Test macOS](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test.yml/badge.svg?job=test-macos)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test.yml) |

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

## Bootstrap Scripts

| Script | Description |
|--------|-------------|
| `.config/yadm/bootstrap` | Main bootstrap - detects OS and clones OS-specific repos |
| `.config/yadm/bootstrap.d/common/40-home` | Creates home directories (`Documents`, `Downloads`, `Pictures`, etc.) |
| `.config/yadm/bootstrap.d/common/50-fzf` | Generates fzf zsh integration (`~/.fzf.zsh`) |

## CI Tests

| Job | Description |
|-----|-------------|
| Lint | bash/zsh syntax validation on all shell scripts |
| Validate | TOML (starship config), packages in pacman/brew, gitconfig |
| Deploy | Tests config deployment on each OS |
| Integration | zsh config loading, starship, starship config |

## Adding New Configs

```bash
yadm add ~/.config/foo/bar
yadm commit -m "add foo config"
yadm push
```
