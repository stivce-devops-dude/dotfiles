# ~/.zshrc

# Don't run in non-interactive shells
[[ -o interactive ]] || return

# ----- History -----
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# ----- XDG -----
export XDG_CONFIG_HOME="$HOME/.config"

# ----- Completion -----
autoload -Uz compinit
compinit

# ----- Source modular configs -----
ZSHRC_D="$XDG_CONFIG_HOME/zshrc.d"
if [[ -d "$ZSHRC_D" ]]; then
  for _f in "$ZSHRC_D"/*.zsh; do
    [[ -r "$_f" ]] && source "$_f"
  done
  unset _f
fi

# opencode (if exists)
[[ -d "$HOME/.opencode/bin" ]] && export PATH="$HOME/.opencode/bin:$PATH"
