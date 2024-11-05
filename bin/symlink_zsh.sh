#!/bin/bash

# ---- Cd to this file's dir ----
CURRENT_DIR=$(pwd)
SCRIPTS_DIR=$(dirname $(realpath "$0"))

cd $SCRIPTS_DIR

if command -v zsh &>/dev/null; then
  # link config
  CONFIG_PATH=$HOME/.zshrc
  TARGET_PATH=$(realpath "$SCRIPTS_DIR/../zsh/.zshrc")
  if [ -e "$CONFIG_PATH" ]; then
	  echo "[OK] $CONFIG_PATH already exists. Removing"
	  rm -rf "$CONFIG_PATH"
  fi
  
  ln -s $TARGET_PATH $CONFIG_PATH 
  echo "[OK] Created symlink"
else
  echo "[OK] zsh is not installed"
fi

# ---- Cd back to the original dir ----
cd $CURRENT_DIR
