# 🏡 Dotfiles (Managed with yadm)

This repository contains my personal dotfiles and system configuration managed with **yadm** — *Yet Another Dotfiles Manager*.

These files define my shell, editor, environment, and other preferences so I can quickly bootstrap any new machine.

---

## 📦 What’s in this repo

Dotfiles stored here are automatically placed in your home directory when using **yadm**. Some examples include:

- ⚙️ **Shell config:** `.zshrc`, plugins and custom aliases  
- 💻 **App configs:** `.config` (Neovim, tmux, etc.)  
- 🔐 **SSH config:** `.ssh`  
- 🍺 **Brewfile for macOS** (`Brewfile##os.Darwin`)  
- …and other tooling configs  

> Files with `##os.*` suffix are *alternate files* that only apply on specific platforms (e.g., macOS).

---

## 🚀 Getting started

### Prerequisites

- `git`
- `yadm` (https://yadm.io)

---

## 🔁 Clone & bootstrap

```sh
yadm clone git@github.com:stivce-devops-dude/dotfiles.git
yadm reset --hard HEAD
yadm alt
```

---

## 🔧 Usage

```sh
yadm status
yadm add .zshrc
yadm commit -m "Update shell config"
yadm push
```

---

## 🌐 OS-specific configuration

This repo uses **yadm alternate files**:

- `Brewfile##os.Darwin` → macOS only
- Add more using `##os.Linux`, `##hostname`, etc.

---

## 🔐 Secrets

Use `yadm encrypt` / `yadm decrypt` for sensitive data.  
Never commit secrets unencrypted.

---

## ❤️ Notes

These dotfiles are opinionated and personal. Feel free to fork or adapt.

---

## 📜 License

Provided as-is. Add a license if you plan to share publicly.
