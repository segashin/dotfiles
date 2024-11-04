#!/bin/bash

# ---- Cd to this file's dir ----
CURRENT_DIR=$(pwd)
SCRIPTS_DIR=$(dirname $(realpath "$0"))

cd $SCRIPTS_DIR

if command -v nvim &>/dev/null; then
  # link config
  CONFIG_DIR=$HOME/.config/nvim
  TARGET_DIR=$(realpath "$SCRIPTS_DIR/../nvim_lua")
  if [ -d "$CONFIG_DIR" ]; then
	  echo "[OK] $CONFIG_DIR already exists. Removing"
	  rm -rf "$CONFIG_DIR"
  fi
  
  ln -s $TARGET_DIR $CONFIG_DIR 
  echo "[OK] Created symlink"
else
  echo "[OK] Neovim is not installed"
fi

# ---- Cd back to the original dir ----
cd $CURRENT_DIR
