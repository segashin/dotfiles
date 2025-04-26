#!/usr/bin/env zsh

SCRIPT_PATH=$(realpath ${(%):-%x})
echo $SCRIPT_PATH
SCRIPT_NAME=${SCRIPT_PATH:t}
SCRIPT_DIR=${SCRIPT_PATH:h}

INSTALL_PATH="/usr/local/lib/nvim"
BIN_PATH="/usr/local/bin/nvim"

DOWNLOAD_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
DOWNLOAD_PATH="/tmp/${DOWNLOAD_URL:t}"

# Check the installation status
_check_path() {
    # Check the installation path
    if [[ -e $INSTALL_PATH ]]; then
        echo "[$SCRIPT_NAME] (WARN) - $INSTALL_PATH is not empty"
        echo "[$SCRIPT_NAME] Existing files will be removed if you proceed."
        read "reply?[$SCRIPT_NAME] Proceed? [y/N]: "
        if [[ $reply == [yY] ]]; then
            echo "[$SCRIPT_NAME] Proceeding"
        else
            exit 1
        fi
    else
        echo "[$SCRIPT_NAME] (OK) - Installation path $INSTALL_PATH is empty"
    fi

    # Check the bin path
    if [[ -e $BIN_PATH ]]; then
        echo "[$SCRIPT_NAME] (WARN) - $BIN_PATH is not empty"
        echo "[$SCRIPT_NAME] Existing files will be removed if you proceed."
        read "reply?[$SCRIPT_NAME] Proceed? [y/N]: "
        if [[ $reply == [yY] ]]; then
            echo "[$SCRIPT_NAME] Proceeding"
        else
            exit 1
        fi
    else
        echo "[$SCRIPT_NAME] (OK) - Bin path $BIN_PATH is empty"
    fi
}

_install() {
    sudo rm -rf $INSTALL_PATH
    sudo rm -rf $BIN_PATH
    sudo mkdir -p $INSTALL_PATH

    curl -Lo $DOWNLOAD_PATH $DOWNLOAD_URL
    EXTRACT_PATH=${DOWNLOAD_PATH:r}
    sudo tar -xzvf $DOWNLOAD_PATH -C $INSTALL_PATH --strip-components=1
    rm $DOWNLOAD_PATH
    sudo ln -s "$INSTALL_PATH/bin/nvim" $BIN_PATH
}

_check_path
_install
echo "[$SCRIPT_NAME] Done"
