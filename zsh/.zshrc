source ~/dotfiles/zsh/scripts/zinit.zsh
source ~/dotfiles/zsh/scripts/history.zsh
source ~/dotfiles/zsh/scripts/completions.zsh
source ~/dotfiles/zsh/scripts/tmux.zsh
source ~/dotfiles/zsh/scripts/colors.zsh
source ~/dotfiles/zsh/scripts/git.zsh
source ~/dotfiles/zsh/scripts/bindkey.zsh

# Source all files in local folder
for f in ~/dotfiles/zsh/local/*.zsh; do
  [[ -r "$f" ]] && source "$f"
done
