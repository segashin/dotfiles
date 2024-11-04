inoremap <silent> jj <ESC>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
""" Highlight word by pressing space twice
"nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nnoremap <silent> <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
""" Highlight word and replace
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
""" Insert datetime
inoremap <F2> <C-R>=strftime("%c")<CR><Esc>

nnoremap x "_x
nnoremap s "_s
xnoremap p "_xP

nnoremap ;ww :<C-u>w<CR>
nnoremap ;qq :<C-u>q<CR>
nnoremap ;wa :<C-u>wa<CR>
nnoremap ;wqa :<C-u>wqa<CR>
nnoremap ;wo :<C-u>only<CR>

"""" Multi window mappings
nnoremap ;j :<C-u>wincmd j<CR>
nnoremap ;k :<C-u>wincmd k<CR>
nnoremap ;h :<C-u>wincmd h<CR>
nnoremap ;l :<C-u>wincmd l<CR>

nnoremap ( :<C-u>vertical resize -5<CR>
nnoremap ) :<C-u>vertical resize +5<CR>
nnoremap + :<C-u>res +5<CR>
nnoremap _ :<C-u>res -5<CR>


