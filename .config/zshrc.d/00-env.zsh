# Environment variables
export EDITOR="nvim"
export PAGER="less"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export PATH="$HOME/.local/bin:$PATH"

# Go
if [[ -d /usr/local/go/bin ]]; then export PATH="$PATH:/usr/local/go/bin"; fi
