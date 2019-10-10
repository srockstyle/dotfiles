""""""""""""""""""""""""""""""
" denite
""""""""""""""""""""""""""""""
" denite
let g:denite_enable_start_insert=1
let g:denite_source_history_yank_enable =1
let g:denite_source_file_mru_limit = 200

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


