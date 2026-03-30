# Keybindings
bindkey -e  # emacs keymap (^A, ^E, ^R, ^K, etc.)

# Word navigation
bindkey "^[[1;3C" forward-word       # Alt+Right
bindkey "^[[1;3D" backward-word      # Alt+Left
bindkey "^[^?" backward-kill-word    # Alt+Backspace
bindkey "^[[3;3~" kill-word          # Alt+Delete

# Delete keys (re-assert after plugins may override)
bindkey "^?" backward-delete-char    # Backspace
bindkey "^H" backward-delete-char    # Ctrl+Backspace
bindkey "^[[3~" delete-char          # Delete
