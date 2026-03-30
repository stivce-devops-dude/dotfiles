# ----- Common aliases (all platforms) -----

# Safer file operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Directory listing
alias l='ls -CF'
alias ll='ls -lh'
alias lll='ls -alh'
alias la='ls -la'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# Tools
alias grep='grep --color=auto'
alias c='clear'
alias cls='clear'
alias df='df -hT'
alias v='nvim'
alias vim='nvim'
alias vi='nvim'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'

# Shell
alias sz='source $HOME/.zshrc && clear && echo "sourced zsh"'
alias p3server='python3 -m http.server 8000'
alias ff='clear && fastfetch'
