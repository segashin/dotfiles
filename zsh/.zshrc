# Source all files in scripts folder
for f in ~/dotfiles/zsh/scripts/*.zsh; do
  [[ -r "$f" ]] && source "$f"
done

# Source all files in scripts folder
for f in ~/dotfiles/zsh/optional/*.zsh; do
  [[ -r "$f" ]] && source "$f"
done

# Source all files in local folder
for f in ~/dotfiles/zsh/local/*.zsh; do
  [[ -r "$f" ]] && source "$f"
done
