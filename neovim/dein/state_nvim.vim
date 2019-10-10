if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/Users/srockstyle/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/Users/srockstyle/.config/nvim,/etc/xdg/nvim,/Users/srockstyle/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.4.2/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/srockstyle/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/srockstyle/.config/nvim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/srockstyle/Documents/develop/github/srockstyle/dotfiles/neovim/rc/plugins.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/srockstyle/.config/nvim/dein'
let g:dein#_runtime_path = '/Users/srockstyle/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/srockstyle/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/Users/srockstyle/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/Users/srockstyle/.config/nvim,/etc/xdg/nvim,/Users/srockstyle/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/srockstyle/.config/nvim/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.4.2/share/nvim/runtime,/Users/srockstyle/.config/nvim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/srockstyle/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/srockstyle/.config/nvim/after'
filetype off
