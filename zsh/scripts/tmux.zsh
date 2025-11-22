# Automatically start tmux if not already in a tmux session
if command -v tmux >/dev/null 2>&1; then
  # Check if inside a tmux session
  if [ -z "$TMUX" ]; then
    # Start a new tmux session or attach to an existing one
    tmux new
  fi
fi
