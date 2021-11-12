if g:dein#_cache_version !=# 410 || g:dein#_init_runtimepath !=# '/home/sssegawa/.config/nvim,/etc/xdg/nvim,/home/sssegawa/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/usr/share/nvim/runtime,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/sssegawa/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/sssegawa/.config/nvim/after,/home/sssegawa/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#min#_load_cache_raw(['/home/sssegawa/.config/nvim/init.vim', '/home/sssegawa/dotfiles/nvim/dein/dein.toml', '/home/sssegawa/dotfiles/nvim/dein/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/sssegawa/dotfiles/nvim/dein'
let g:dein#_runtime_path = '/home/sssegawa/dotfiles/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/sssegawa/dotfiles/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/sssegawa/.config/nvim,/etc/xdg/nvim,/home/sssegawa/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/home/sssegawa/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim,/home/sssegawa/dotfiles/nvim/dein/repos/github.com/neoclide/coc.nvim_release,/home/sssegawa/dotfiles/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/sssegawa/dotfiles/nvim/dein/.cache/init.vim/.dein/after,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/sssegawa/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/sssegawa/.config/nvim/after'
filetype off
