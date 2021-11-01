"""Coc.nvim --------------------------------------------------------------
let g:coc_confing_home = '~/dotfiles/nvim/config_files/coc-settings.json'

"" ;; to refresh
inoremap <silent><expr> ;; coc#refresh()
"" Enter to select
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"" Tab to go down in the suggestion
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"" Shift+Tab to go up in the suggestion
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

