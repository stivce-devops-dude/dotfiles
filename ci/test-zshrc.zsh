#!/usr/bin/env zsh
# test-zshrc.zsh — assert that the deployed shell config works correctly
# Run after deploy-dotfiles.sh has populated $HOME.

errors=0
pass() { print -P "%F{green}PASS%f $1"; }
fail() { print -P "%F{red}FAIL%f $1"; (( errors++ )); }

export XDG_CONFIG_HOME="$HOME/.config"
ZSHRC_D="$XDG_CONFIG_HOME/zshrc.d"

# Source all zshrc.d files directly (bypasses the [[ -o interactive ]] guard in .zshrc)
for _f in "$ZSHRC_D"/*.zsh(N); do
  source "$_f" 2>/dev/null && true  # `&& true` prevents set -e from firing on non-zero returns
done

# ---- Environment ----
[[ "${EDITOR:-}" == "nvim" ]] && pass "EDITOR=nvim"  || fail "EDITOR not nvim (got: ${EDITOR:-unset})"
[[ "${PAGER:-}"  == "less" ]] && pass "PAGER=less"   || fail "PAGER not less (got: ${PAGER:-unset})"

# ---- Functions ----
typeset -f mkcd >/dev/null && pass "mkcd defined" || fail "mkcd not defined"

# ---- Aliases ----
for a in v gs ll c; do
  alias "$a" >/dev/null 2>&1 && pass "alias '$a' exists" || fail "alias '$a' missing"
done

# ---- Keybindings ----
check_key() {
  local key="$1" expected="$2" label="$3"
  local actual
  actual=$(bindkey "$key" 2>/dev/null | awk '{print $2}')
  [[ "$actual" == "$expected" ]] \
    && pass "bindkey $label = $expected" \
    || fail "bindkey $label: expected '$expected', got '$actual'"
}

check_key "^A"    "beginning-of-line"    "^A"
check_key "^E"    "end-of-line"          "^E"
check_key "^?"    "backward-delete-char" "^? (Backspace)"
check_key "^[[3~" "delete-char"          "Delete"

# ^R: either fzf-history-widget (fzf loaded) or history-incremental-search-backward (fallback)
actual_r=$(bindkey "^R" 2>/dev/null | awk '{print $2}')
if [[ "$actual_r" == "fzf-history-widget" || "$actual_r" == "history-incremental-search-backward" ]]; then
  pass "bindkey ^R = $actual_r"
else
  fail "bindkey ^R: unexpected widget '$actual_r'"
fi

# ---- Result ----
print ""
if (( errors > 0 )); then
  print "$errors test(s) failed."
  exit 1
else
  print "All tests passed."
fi
