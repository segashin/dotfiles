#!/usr/bin/env zsh

_symlink() {
    local config_path="$1"
    local target_path="$2"
    if [[ -e "$config_path" ]]; then
        echo "[$SCRIPT_NAME] (WARN) $config_path already exists."
        echo "[$SCRIPT_NAME] Existing the path will be removed if you proceed."
        read "reply?[$SCRIPT_NAME] Proceed? [y/N]: "
        if [[ $reply == [yY] ]]; then
            echo "[$SCRIPT_NAME] Proceeding"
        else
            exit 1
        fi
  	    rm -rf "$config_path"
    fi

    mkdir -p ${config_path:h}
    ln -s $target_path $config_path
}
