#!/bin/sh

# ---- Cd to this file's dir ----
CURRENT_DIR=$(pwd)
SCRIPTS_DIR=$(dirname $(realpath "$0"))

cd $SCRIPTS_DIR

# ---- Check nvim ----
if command -v nvim &>/dev/null; then
  echo "[OK] Neovim is already installed"
else
  echo "[MSG] Neovim not installed"
  echo "[MSG] Installing nvim"
  INSTALL_DIR="/usr/local/lib/nvim"
  EXECUTABLE_PATH="/usr/local/bin/nvim"
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
  rm -rf $INSTALL_DIR
  mkdir -p $INSTALL_DIR
  tar xzvf nvim-linux64.tar.gz
  sudo mv nvim-linux64 $INSTALL_DIR
  rm -rf nvim-linux64 nvim-linux64.tar.gz
  sudo ln -s "$INSTALL_DIR/bin/nvim" "$EXECUTABLE_PATH"
fi

# ---- Check xclip ----
if command -v xclip &>/dev/null; then
  echo "[OK] xclip is already installed"
else
  echo "[MSG] xclip not installed"
  echo "[MSG] Installing xclip"
  sudo apt install -y xclip
fi

# ---- Check ripgrep ----
if command -v rg &>/dev/null; then
  echo "[OK] ripgrep is already installed"
else
  echo "[MSG] ripgrep not installed"
  echo "[MSG] Installing ripgrep"
  sudo apt install -y ripgrep
fi

# ---- Cd back to the original dir ----
cd $CURRENT_DIR
