#!/bin/sh

if command -v tmux &>/dev/null; then
    echo "[OK] Tmux is already installed"
else
    apt install tmux
fi
