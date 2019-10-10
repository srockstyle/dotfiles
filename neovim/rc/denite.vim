""""""""""""""""""""""""""""""
" denite
""""""""""""""""""""""""""""""
" denite
let g:denite_enable_start_insert=-3
let g:denite_source_history_yank_enable =1
let g:denite_source_file_mru_limit = 200

"
" Dgrep
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
      nnoremap <silent><buffer><expr> o
    \ denite#do_map('do_action')
      " 【s】 ウィンドウを水平分割してファイルを開く
      nnoremap <silent><buffer><expr> s
    \ denite#do_map('do_action', 'split')
      " 【v】 ウィンドウを垂直分割してファイルを開く
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


"ファイル関連
nmap <silent> <C-u><C-]> :<C-u>DeniteCursorWord grep<CR>
nmap <silent> <C-u><C-y> :<C-u>Denite neoyank<CR>
nmap <silent> <C-u><C-d> :<C-u>Denite directory_rec<CR>
" nmap <silent> <C-u><C-j> :<C-u>Denite line<CR>
" nnmap <silent> <C-u>- :<C-u>Denite -resume -immediately -select=-1<CR>
" nmap <silent> <C-u><C-t> :<C-u>Denite filetype<CR>
" map <silent> <C-u><C-p> :<C-u>Denite file_rec<CR>
" nmap <silent> <C-u><C-u> :<C-u>Denite file_mru<CR>
" nmap <silent> <C-u><C-r> :<C-u>Denite -resume<CR>
" nmap <silent> <C-u>; :<C-u>Denite -resume -immediately -select=+1<CR>
" nmap <silent> <C-u>- :<C-u>Denite -resume -immediately -select=-1<CR>

"deniteじゃないものもあるけどここにまとめる
nnoremap gd :Gdiff<CR>
nnoremap gb :Denite gitbranch<CR>
nnoremap gs :Denite gitstatus<CR>
nnoremap gadd :Gwrite<CR>
nnoremap gcommit :Gcommit<CR>
" 【Ctrl + o】 float windowでターミナルを表示
nnoremap <silent><C-o> :<C-u>Deol -split=floating<CR>
" 【ESC】 ターミナルモードから抜ける
tnoremap <ESC>   <C-\><C-n>
"Rails
nnoremap drc :<C-u>Denite file_rec:app/controllers/<CR><Space>
nnoremap drm :<C-u>Denite file_rec:app/models/ <CR><Space>
nnoremap drv :<C-u>Denite file_rec:app/views/ <CR><Space>
nnoremap drs :<C-u>Denite file_rec:app/assets/stylesheets/ <CR>
nnoremap drj :<C-u>Denite file_rec:app/assets/javascripts/ <CR>


