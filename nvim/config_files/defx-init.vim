nnoremap <silent> ;f :<C-u>Defx -listed -resume -buffer-name=tab`tabpagenr()`<CR>
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()
" Setting for defx-icons
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
call defx#custom#option('_', {
		\ 'split':'vertical',
		\ 'direction': 'topleft',
		\ 'show_ignored_files': 1,
		\ 'columns': 'mark:indent:icons:filename:type:size:time',
		\ 'toggle':1,
		\ 'resume':1
		\ })
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
	" Define mappings
	  nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
	  nnoremap <silent><buffer><expr> c defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m defx#do_action('move')
	  nnoremap <silent><buffer><expr> p defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l defx#do_action('open')
	  nnoremap <silent><buffer><expr> e defx#do_action('multi', ['quit', 'open'])
	  nnoremap <silent><buffer><expr> E defx#do_action('drop')
	  nnoremap <silent><buffer><expr> t defx#do_action('multi', ['quit', ['drop', 'tabnew']])
	  nnoremap <silent><buffer><expr> T defx#do_action('open', 'tabnew')
	  nnoremap <silent><buffer><expr> v defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
	  nnoremap <silent><buffer><expr> V defx#do_action('drop', 'vsplit')
	  nnoremap <silent><buffer><expr> b defx#do_action('multi', [['drop', 'split'], 'quit'])
	  nnoremap <silent><buffer><expr> B defx#do_action('open', 'split')
	  nnoremap <silent><buffer><expr> P defx#do_action('preview')
	  nnoremap <silent><buffer><expr> o defx#do_action('open_tree', 'toggle')
	  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns','mark:indent:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r defx#do_action('rename')
	  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

"" Close nvim if there is only defx window remaining
function! s:previewWindowOpened() abort
    for nr in range(1, winnr('$'))
        if getwinvar(nr, "&pvw") == 1
            return 1
        endif
    endfor
    return 0
endfunction

autocmd WinEnter \[defx\]* if winnr('$') == 1 || winnr('$') == 2 && <SID>previewWindowOpened() | quit | endif


