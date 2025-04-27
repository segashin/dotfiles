#!/usr/bin/env zsh

SCRIPT_PATH=$(realpath ${(%):-%x})
SCRIPT_NAME=${SCRIPT_PATH:t}
SCRIPT_DIR=${SCRIPT_PATH:h}

CONFIG_PATH=$HOME/.config/tmux
TARGET_PATH=$(realpath "$SCRIPT_DIR/../tmux")

source $SCRIPT_DIR/_symlink.zsh

_symlink $CONFIG_PATH $TARGET_PATH
echo "[$SCRIPT_NAME] Done"
