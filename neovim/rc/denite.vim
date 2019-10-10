""""""""""""""""""""""""""""""
" denite
""""""""""""""""""""""""""""""
" denite
let g:denite_enable_start_insert=-3
let g:denite_source_history_yank_enable =1
let g:denite_source_file_mru_limit = 200
"
" 開始
augroup denite_filter
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
  endfunction
augroup END
" use floating
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'prompt': '$ ',
    \ 'start_filter': v:true,
    \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
" call denite#custom#option('default', s:denite_default_options)
"
" call denite#custom#var('file/rec', 'command',
"     \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" call denite#custom#filter('matcher/ignor_globs', 'ignore_globs',
"     \ [ '.git/', '.ropeproject/', '__pycache__/',
"     \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
" " nmap <C-d> :Denite Ag command on grep source
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
" grep
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=grep-buffer-denite grep -path='.a:1)
  else
    execute(':Denite -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').' grep')
  endif
endfunction
" show Denite grep results
command! Dresume execute(':Denite -resume -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').'')
" next Denite grep result
command! Dnext execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=+1 -immediately '.join(s:denite_option_array, ' ').'')
" previous Denite grep result
command! Dprev execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=-1 -immediately '.join(s:denite_option_array, ' ').'')
" keymap
" call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" Define mappings
" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>
"   \ denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> d
"   \ denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p
"   \ denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> q
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> i
"   \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <Space>
"   \ denite#do_map('toggle_select').'j'
" endfunction
" "
" " "現在開いているファイルのディレクトリ下のファイル一覧。
" nnoremap <silent> [denite]f :<C-u>DeniteBufferDir
"       \ -direction=topleft -cursor-wrap=true file file:new<CR>
" "バッファ一覧
" nnoremap <silent> [denite]b :<C-u>Denite -direction=topleft -cursor-wrap=true buffer<CR>
" "レジスタ一覧
" nnoremap <silent> [denite]r :<C-u>Denite -direction=topleft -cursor-wrap=true -buffer-name=register register<CR>
" "最近使用したファイル一覧
" nnoremap <silent> [denite]m :<C-u>Denite -direction=topleft -cursor-wrap=true file_mru<CR>
" "ブックマーク一覧
" nnoremap <silent> [denite]c :<C-u>Denite -direction=topleft -cursor-wrap=true bookmark<CR>
" "ブックマークに追加
" nnoremap <silent> [denite]a :<C-u>DeniteBookmarkAdd<CR>
"
" ".git以下のディレクトリ検索
" nnoremap <silent> [denite]k :<C-u>Denite -direction=topleft -cursor-wrap=true
"       \ -path=`substitute(finddir('.git', './;'), '.git', '', 'g')`
"       \ file_rec/git<CR>
"
" call denite#custom#source('file'    , 'matchers', ['matcher_cpsm', 'matcher_fuzzy'])
"
" call denite#custom#source('buffer'  , 'matchers', ['matcher_regexp'])
" call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])
"
" call denite#custom#alias('source', 'file_rec/git', 'file_rec')
" call denite#custom#var('file_rec/git', 'command',
"   \ ['git', 'ls-files', '-co', '--exclude-standard'])
"
" call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', '<C-W>', '<denite:move_up_path>', 'noremap')

" 基本操作
" nnoremap <C-t> :Denite buffer<CR>
" denite/insert モードのときは，UpDownで移動できるようにする
" call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>')
" call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>')
"git
"deniteじゃないものもあるけどここにまとめる
nnoremap gl :Glog<CR>
nnoremap gd :Gdiff<CR>
nnoremap gb :Denite gitbranch<CR>
nnoremap gs :Denite gitstatus<CR>
nnoremap gadd :Gwrite<CR>
nnoremap gcommit :Gcommit<CR>

"Rails
nnoremap drc :<C-u>Denite file_rec:app/controllers/<CR><Space>
nnoremap drm :<C-u>Denite file_rec:app/models/ <CR><Space>
nnoremap drv :<C-u>Denite file_rec:app/views/ <CR><Space>
nnoremap drs :<C-u>Denite file_rec:app/assets/stylesheets/ <CR>
nnoremap drj :<C-u>Denite file_rec:app/assets/javascripts/ <CR>


