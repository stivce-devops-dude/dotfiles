# dotfiles

General dotfiles managed with [yadm](https://yadm.io/). Supports Arch Linux, Ubuntu, and macOS.

## CI Jobs

| CI Job | Description |
|--------|-------------|
| **Lint** — bash/zsh syntax + shellcheck | [![Lint](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/lint.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/lint.yml) |
| **Config Validation** — verify TOML, packages | [![Config Validation](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/config-validation.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/config-validation.yml) |
| **Bootstrap** — dry-run bootstrap test | [![Bootstrap](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/bootstrap.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/bootstrap.yml) |
| **Bootstrap Test (Arch)** — test bootstrap on Arch | |
| **Bootstrap Test (macOS)** — test bootstrap on macOS | |
| **Test Arch** — deploy & integration | [![Test Arch](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-arch.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-arch.yml) |
| **Test Ubuntu** — deploy & integration | [![Test Ubuntu](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-ubuntu.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-ubuntu.yml) |
| **Test macOS** — deploy & integration | [![Test macOS](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-macos.yml/badge.svg)](https://github.com/stivce-devops-dude/dotfiles/actions/workflows/test-macos.yml) |
| **Package Availability** — verify packages in pacman/brew | |

## Setup

```bash
yadm clone git@github.com:stivce-devops-dude/dotfiles.git
yadm bootstrap
```

The bootstrap script automatically detects your OS and clones the appropriate OS-specific repo.

## Branch / Setup Options

| OS | Default | With Gaming |
|----|---------|-------------|
| **Arch Linux** | minimal (base only) | `DOTFILES_INCLUDE_GAMING=1` |
| **Ubuntu** | main | - |
| **macOS** | main | - |

```bash
# Arch Linux - minimal (no gaming)
yadm bootstrap

# Arch Linux - with gaming
DOTFILES_INCLUDE_GAMING=1 yadm bootstrap
```

## What's Included

- **Shell**: zsh config (`.zshrc`, `.config/zshrc.d/`)
- **Terminal**: kitty config
- **Editor**: neovim (`init.lua`)
- **Prompt**: starship
- **Package Lists**: `.config/yadm/packages/core.txt`

## Bootstrap Scripts

| Script | Description |
|--------|-------------|
| `.config/yadm/bootstrap` | Main bootstrap - detects OS and clones OS-specific repos |
| `.config/yadm/bootstrap.d/common/40-home` | Creates home directories |
| `.config/yadm/bootstrap.d/common/50-fzf` | Generates fzf zsh integration |

## Adding New Configs

```bash
yadm add ~/.config/foo/bar
yadm commit -m "add foo config"
yadm push
```
