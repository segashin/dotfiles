"""DEIN
if &compatible
  set nocompatible
endif

" dein detup
let s:dein_dir = $HOME . '/.config/vim/bundle'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " Load and cached toml
  " all plugins listed in toml
  call dein#load_toml('~/dotfiles/vim/dein/dein.toml', {'lazy': 0}) 
  call dein#load_toml('~/dotfiles/vim/dein/dein_lazy.toml', {'lazy': 1}) 
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"""VISUAL
colorscheme pablo

"""BASICS
syntax enable "syntax highlight
set fenc=utf-8  ""encode utf8
set nobackup    ""does not create backup file
set noswapfile  ""does not create swap file
set autoread    ""reload automatically when the editing file was modified
set hidden      ""let you open other files while you have opened unsaved files
set showcmd     ""shows the current command on the status
set smartindent ""smart indent
set number      ""line number visible
set virtualedit=onemore ""you can move your cursor to one more letter behind the last letter
"set cursorline ""highlights the current line
"highlight CursorLine ctermbg=black
"set cursorcolumn       ""highlights the current column
set showmatch   ""highlights the corresponding {[("'
set laststatus=2        ""status line visible
set wildmode=list:longest ""command line auto fill      
"set expandtab  ""tab is space
set tabstop=2  ""tab = 2 spaces except beginning of line
set shiftwidth=2       ""tab = 2 spaces at beginning of line
set ignorecase  ""ignores cases when searached by all lower case letters
set smartcase   ""case sensitive when searched by mixed cases
set incsearch   ""search as you type
set wrapscan    ""goes back to the top when you reach the bottom
set hlsearch    ""highlight the serch words
set backspace=indent,eol,start
set wildmenu    ""extended cmd autofill
nmap <Esc><Esc> :nohlsearch<CR><Esc>    ""disable highlight on search words when you press Esc many times
set scrolloff=8         ""starts scrolling at
set sidescrolloff=16    ""starts side-scrolling at

"""KEY BINDS
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap <silent> jj <ESC>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
""" Highlight word by pressing space twice
"nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nnoremap <silent> <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
""" Highlight word and start replacing
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

nnoremap x "_x
nnoremap s "_s
xnoremap p "_xP


