# dotfiles

Shared dotfiles for macOS and Arch Linux. Managed as a bare git repo.

## Setup

```bash
git clone --bare git@github.com:stivce-devops-dude/dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
```

Add to your shell profile:

```bash
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dot config status.showUntrackedFiles no
```

## What's included

- **Shell** — `.zshrc`, `.config/zshrc.d/` (env, keybindings, aliases, functions, starship, fzf)
- **Terminal** — `.config/kitty/` (base config, colors)
- **Editor** — `.config/nvim/init.lua`
- **Prompt** — `.config/starship/starship.toml`
- **Git** — `.gitconfig`

## Usage

```bash
dot add ~/.config/nvim/init.lua
dot commit -m "update nvim config"
dot push
```

## Related repos

- [dotfiles-arch](https://github.com/stivce-devops-dude/dotfiles-arch) — Arch-specific configs (Hyprland, Waybar, GTK, Qt)
- [dotfiles-mac](https://github.com/stivce-devops-dude/dotfiles-mac) — macOS-specific configs (Aerospace, SSH)
- [os-configuration](https://github.com/stivce-devops-dude/os-configuration) — Ansible playbook for package management and system setup
