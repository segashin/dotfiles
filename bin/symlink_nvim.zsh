#!/usr/bin/env zsh

SCRIPT_PATH=$(realpath ${(%):-%x})
SCRIPT_NAME=${SCRIPT_PATH:t}
SCRIPT_DIR=${SCRIPT_PATH:h}

CONFIG_PATH=$HOME/.config/nvim
TARGET_PATH=$(realpath "$SCRIPT_DIR/../nvim")

_symlink_nvim() {
    if [[ -e "$CONFIG_PATH" ]]; then
        echo "[$SCRIPT_NAME] (WARN) $CONFIG_PATH already exists."
        echo "[$SCRIPT_NAME] Existing the path will be removed if you proceed."
        read "reply?[$SCRIPT_NAME] Proceed? [y/N]: "
        if [[ $reply == [yY] ]]; then
            echo "[$SCRIPT_NAME] Proceeding"
        else
            exit 1
        fi
  	    rm -rf "$CONFIG_PATH"
    fi

    mkdir -p ${CONFIG_PATH:h}
    ln -s $TARGET_PATH $CONFIG_PATH
}

_symlink_nvim
echo "[$SCRIPT_NAME] Done"
