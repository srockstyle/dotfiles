let s:dein_dir = expand('~/.config/nvim/dein')

" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache_nvim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache_nvim/dein')
  call dein#begin('~/.cache_nvim/dein')
  call dein#add('~/.cache_nvim/dein/repos/github.com/Shougo/dein.vim')
  let g:rc_dir    = expand('~/.config/nvim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let g:config_dir  = expand('~/.config/nvim/dein/userconfig')
  let s:toml = [
        \ {'name': 'default'},
        \ {'name': 'lazy',          'lazy': 1},
        \ {'name': 'defx_lazy',     'lazy': 1},
        \ {'name': 'denite_lazy',   'lazy': 1},
        \ {'name': 'deoplete_lazy', 'lazy': 1},
        \ ]
  let s:path = {name -> $HOME . '~/.config/nvim/dein/userconfig/' . name . '.toml'}
  let s:load_toml = {name, lazy -> dein#load_toml(s:path(name), {'lazy': lazy})}

  " call dein#begin(s:dein_dir, map(deepcopy(s:toml), {_, t -> t['name']}))
  " call map(s:toml, {_, t -> s:load_toml(t['name'], get(t, 'lazy', 0))})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" インストールされていないプラグインがあればインストールする
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
