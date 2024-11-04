#!/bin/sh

# ---- Check python ----
if command -v nvim &>/dev/null; then
  echo "[OK] Neovim is already installed"
else
  echo "[MSG] Neovim not installed"
  echo "[MSG] Installing nvim"
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
  rm -rf /usr/local/nvim
  tar -C /usr/local -xzf nvim-linux64.tar.gz
  ln -s /usr/local/
fi

if command -v xclip &>/dev/null; then
  echo "[OK] xclip is already installed"
else
  echo "[MSG] xclip not installed"
  echo "[MSG] Installing xclip"
  sudo apt install -y xclip
fi
