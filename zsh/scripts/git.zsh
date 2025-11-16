_glol_helper() {
  git --no-pager log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" "$@"
}

glol() {
    _glol_helper -n "${1:-40}"
}

glola() {
    _glol_helper --all -n "${1:-40}"
}

alias gpul="git pull origin"
