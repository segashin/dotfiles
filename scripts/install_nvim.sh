#!/bin/sh
CURRENT_DIR=$(pwd)
SCRIPTS_DIR=$(dirname $(realpath "$0"))

cd $SCRIPTS_DIR

# ---- Check nvim ----
if command -v nvim &>/dev/null; then
  echo "[OK] Neovim is already installed"
else
  echo "[MSG] Neovim not installed"
  echo "[MSG] Installing nvim"
  INSTALL_DIR="/usr/local/bin"
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
  rm -rf $INSTALL_DIR
  mkdir -p $INSTALL_DIR
  tar xzvf nvim-linux64.tar.gz
  sudo mv nvim-linux64/bin/nvim $INSTALL_DIR
  rm -rf nvim-linux64 nvim-linux64.tar.gz

  # link config
  mkdir -p $HOME/.config/nvim 
  ln -s ../nvim_lua $HOME/.config/nvim 
fi

if command -v xclip &>/dev/null; then
  echo "[OK] xclip is already installed"
else
  echo "[MSG] xclip not installed"
  echo "[MSG] Installing xclip"
  sudo apt install -y xclip
fi

cd $CURRENT_DIR
