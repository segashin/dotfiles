if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# 'C:\Users\segas/vimfiles,C:\Softwares\vim/vimfiles,C:\Softwares\vim\vim81,C:\Softwares\vim/vimfiles/after,C:\Users\segas/vimfiles/after,C:\Users\segas/vimfiles/bundles/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['C:/Users/segas/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = 'C:/Users/segas/vimfiles/bundles'
let g:dein#_runtime_path = 'C:/Users/segas/vimfiles/bundles/.cache/.vimrc/.dein'
let g:dein#_cache_path = 'C:/Users/segas/vimfiles/bundles/.cache/.vimrc'
let &runtimepath = 'C:\Users\segas/vimfiles,C:\Softwares\vim/vimfiles,C:/Users/segas/vimfiles/bundles/repos/github.com/Shougo/dein.vim,C:/Users/segas/vimfiles/bundles/.cache/.vimrc/.dein,C:\Softwares\vim\vim81,C:/Users/segas/vimfiles/bundles/.cache/.vimrc/.dein/after,C:\Softwares\vim/vimfiles/after,C:\Users\segas/vimfiles/after,C:\Users\segas/vimfiles/bundles/repos/github.com/Shougo/dein.vim'
