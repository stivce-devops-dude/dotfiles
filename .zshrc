# ~/.zshrc

# ----- Safety -----
# Don't run in non-interactive shells
[[ -o interactive ]] || return

# ----- History -----
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# ----- XDG paths -----
export XDG_CONFIG_HOME="$HOME/.config"

# ----- Source modular configs -----
ZSHRC_D="$XDG_CONFIG_HOME/zshrc.d"

if [[ -d "$ZSHRC_D" ]]; then
  for file in "$ZSHRC_D"/*.zsh; do
    [[ -r "$file" ]] && source "$file"
  done
fi

