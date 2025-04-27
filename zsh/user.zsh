# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PATH=$PATH:/snap/bin
export PATH=$PATH:$HOME/.local/bin

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

export ANDROID_HOME=$HOME/library/android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/build-tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export FLUTTER_ROOT=$HOME/library/flutter
export PATH=$PATH:$FLUTTER_ROOT/bin

# Remove ls highlight color
_ls_colors=":ow=01;33" 
zstyle ':completion:*:default' list-colors "${(s.:.)_ls_colors}"
LS_COLORS+=$_ls_colors

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Automatically start tmux if not already in a tmux session
if command -v tmux >/dev/null 2>&1; then
  # Check if inside a tmux session
  if [ -z "$TMUX" ]; then
    # Start a new tmux session or attach to an existing one
    tmux new
  fi
fi
