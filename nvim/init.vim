"Dein Template
if &compatible
  set nocompatible
endif

let s:dein_dir = $HOME . "/dotfiles/nvim/dein"
"'/.config/nvim/bundle'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " Load and cached toml
  " all plugins listed in toml
  call dein#load_toml('~/dotfiles/nvim/dein/dein.toml', {'lazy': 0}) 
  call dein#load_toml('~/dotfiles/nvim/dein/dein_lazy.toml', {'lazy': 1}) 
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


source ~/dotfiles/nvim/config_files/coc-init.vim "coc.vim
source ~/dotfiles/nvim/config_files/defx-init.vim "defx.vim
source ~/dotfiles/nvim/config_files/basics.vim
source ~/dotfiles/nvim/config_files/keymaps.vim

"""" Auto Command
"augroup HTMLANDXML
"  autocmd!
"  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"	autocmd Filetype html inoremap <buffer> </ </<C-x><C-o><ESC>F<i
"augroup END


"""VISUAL ---------------------------------------------------------------
colorscheme pablo
