""""""""""""""""""""""""""""""
" ツリー表示
""""""""""""""""""""""""""""""
" autocmd VimEnter * execute 'NERDTree'
nnoremap <C-t> :NERDTree<CR>
nnoremap nb :Bookmark<CR>



"親ディレクトリ
" let g:NERDTreeMapUpdir=''

" 表示幅
let g:NERDTreeWinSize=50


" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1

" 隠しファイルを表示
let g:NERDTreeShowHidden=1

" 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']

" NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

