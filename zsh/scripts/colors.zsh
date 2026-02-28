# Only set TERM to screen-256color if inside tmux/screen
# Otherwise, let the terminal emulator set TERM correctly
if [[ -n "$TMUX" ]] || [[ "$TERM" == "screen"* ]]; then
export TERM=screen-256color
fi

# Enable colored ls output
alias ls='ls --color=auto'

# # Remove ls highlight color
# _ls_colors=":ow=01;33" 
# zstyle ':completion:*:default' list-colors "${(s.:.)_ls_colors}"
# LS_COLORS+=$_ls_colors
