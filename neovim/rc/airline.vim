" vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_branch_prefix = '⭠ '
let g:airline#extensions#readonly#symbol = '⭤ '
set laststatus=2

" タブを使う
nmap <silent> <C-t> :tabnew<CR>
nmap <C-l> gT
nmap <C-r> gt

