#!/usr/bin/env zsh

SCRIPT_PATH=$(realpath ${(%):-%x})
SCRIPT_NAME=${SCRIPT_PATH:t}
SCRIPT_DIR=${SCRIPT_PATH:h}

CONFIG_PATH=$HOME/.config/tmux
INSTALL_PATH=$CONFIG_PATH/plugins/tpm

# Check the installation status
_check_path() {
    # Check the installation path
    if [[ -e $INSTALL_PATH ]]; then
        echo "[$SCRIPT_NAME] (WARN) - $INSTALL_PATH is not empty"
        echo "[$SCRIPT_NAME] Existing files will be removed if you proceed."
        read "reply?[$SCRIPT_NAME] Proceed? [y/N]: "
        if [[ $reply == [yY] ]]; then
            echo "[$SCRIPT_NAME] Proceeding"
            sudo rm -rf $INSTALL_PATH
        else
            exit 1
        fi
    else
        echo "[$SCRIPT_NAME] (OK) - Installation path $INSTALL_PATH is empty"
    fi
}

_install() {
    echo $INSTALL_PATH
    sudo mkdir -p $INSTALL_PATH
    sudo git clone https://github.com/tmux-plugins/tpm $INSTALL_PATH
    echo "(OK) TPM installed to ${INSTALL_PATH}"
}

_check_path
_install

echo "(OK) Type Leader+I to install tmux plugins"
