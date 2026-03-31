# dotfiles

General dotfiles managed with [yadm](https://yadm.io/). Supports Arch Linux and macOS.

## CI Jobs

| CI Job | Description |
|--------|-------------|
| **Lint** — bash/zsh syntax validation | [![Lint](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/lint.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/lint.yml) |
| **Config Validation** — verify packages in pacman, TOML, gitconfig | [![Config Validation](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/config-validation.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/config-validation.yml) |
| **Bootstrap** — dry-run bootstrap test | [![Bootstrap](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/bootstrap.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/bootstrap.yml) |
| **Test Arch** — deploy & integration | [![Test Arch](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-arch.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-arch.yml) |
| **Test Ubuntu** — deploy & integration | [![Test Ubuntu](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-ubuntu.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-ubuntu.yml) |
| **Test macOS** — deploy & integration | [![Test macOS](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-macos.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-macos.yml) |

## Setup

```bash
yadm clone git@github.com:stivce-devops-dude/dotfiles.git
yadm bootstrap
```

The bootstrap script automatically detects your OS and clones the appropriate OS-specific repo.

## Branch Usage

For Arch Linux, the bootstrap uses `minimal` branch by default, and optionally applies gaming on top:

| Branch/Option | Description |
|---------------|-------------|
| `minimal` (default) | Base Arch config (Hyprland, kitty, dev tools) |
| `DOTFILES_INCLUDE_GAMING=1` | Adds gaming packages on top |

```bash
# Default (minimal - no gaming)
yadm bootstrap

# With gaming
DOTFILES_INCLUDE_GAMING=1 yadm bootstrap
```

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

## Adding New Configs

```bash
yadm add ~/.config/foo/bar
yadm commit -m "add foo config"
yadm push
```
