"""DEIN
if &compatible
  set nocompatible
endif

"dein.vimディレクトリをruntimepathに追加する
set runtimepath+=~/vimfiles/bundles/repos/github.com/Shougo/dein.vim

"以下定型文
if dein#load_state("~/vimfiles/bundles")
  call dein#begin("~/vimfiles/bundles")
    call dein#add("~/vimfiles/bundles/repos/github.com/Shougo/dein.vim")
    
      "好きなプラグインを dein#add() 追加していく
      "call dein#add('好きなプラグイン')
      call dein#add('vim-airline/vim-airline')
      call dein#add('tpope/vim-surround')
			"call dein#add('ryanoasis/vim-devicons')

			"遅延プラグイン
      call dein#add('w0rp/ale')

    call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	let g:dein#install_process_timeout =  600
  call dein#install()
endif


"""VISUAL
colorscheme delek

"""BASICS
syntax enable "syntax highlight
set fenc=utf-8	""encode utf8
set nobackup	""does not create backup file
set noswapfile	""does not create swap file
set autoread	""reload automatically when the editing file was modified
set hidden	""let you open other files while you have opened unsaved files
set showcmd	""shows the current command on the status
set smartindent ""smart indent
set number	""line number visible
set virtualedit=onemore ""you can move your cursor to one more letter behind the last letter
set visualbell	""visible beep sound
"set cursorline	""highlights the current line
"highlight CursorLine ctermbg=black
"set cursorcolumn	""highlights the current column
set showmatch	""highlights the corresponding {[("'
set laststatus=2	""status line visible
set wildmode=list:longest ""command line auto fill	
""set expandtab	""tab is space
set tabstop=2	""tab = 2 spaces except beginning of line
set shiftwidth=2	""tab = 2 spaces at beginning of line
set ignorecase	""ignores cases when searached by all lower case letters
set smartcase	""case sensitive when searched by mixed cases
set incsearch	""search as you type
set wrapscan	""goes back to the top when you reach the bottom
set hlsearch	""highlight the serch words
set backspace=indent,eol,start
set wildmenu	""extended cmd autofill
nmap <Esc><Esc> :nohlsearch<CR><Esc>	""disable highlight on search words when you press Esc many times
set scrolloff=8		""starts scrolling at
set sidescrolloff=16	""starts side-scrolling at


"""ALE
"let g:ale_linters = {
"\  'python': ['pylint'],
"\}
"let g:ale_python_pylint_executable = 'pylint3'
" 保存時のみ実行する
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
"let g:ale_echo_msg_format = '[%linter%]%code: %%s'
let b:ale_warn_about_trailing_whitespace = 0
"highlight link ALEErrorSign Tag
"highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

