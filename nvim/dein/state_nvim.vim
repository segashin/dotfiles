if g:dein#_cache_version !=# 410 || g:dein#_init_runtimepath !=# '/home/segas/.config/nvim,/etc/xdg/nvim,/home/segas/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/usr/share/nvim/runtime,/usr/lib/nvim,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/segas/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/segas/.config/nvim/after,/home/segas/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [s:plugins, s:ftplugin] = dein#min#_load_cache_raw(['/home/segas/.config/nvim/init.vim', '/home/segas/dotfiles/nvim/dein/dein.toml', '/home/segas/dotfiles/nvim/dein/dein_lazy.toml'])
if empty(s:plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = s:plugins
let g:dein#_ftplugin = s:ftplugin
let g:dein#_base_path = '/home/segas/dotfiles/nvim/dein'
let g:dein#_runtime_path = '/home/segas/dotfiles/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/segas/dotfiles/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/segas/.config/nvim,/etc/xdg/nvim,/home/segas/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/home/segas/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim,/home/segas/dotfiles/nvim/dein/repos/github.com/neoclide/coc.nvim_release,/home/segas/dotfiles/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/segas/dotfiles/nvim/dein/.cache/init.vim/.dein/after,/usr/lib/nvim,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/segas/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/segas/.config/nvim/after'
filetype off
