""""""""""""""""""""""""""""""
" ツリー表示
""""""""""""""""""""""""""""""
" 起動時に動く
"autocmd VimEnter * execute 'NERDTree'

" C-t で開いたり閉じたり
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap nb :Bookmark<CR>
" "親ディレクトリ
let g:NERDTreeMapUpdir=''
" " 表示幅
let g:NERDTreeWinSize=25
" " ファイルを開いたらNERDTreeを閉じる
" let g:NERDTreeQuitOnOpen=1
" " 隠しファイルを表示
let g:NERDTreeShowHidden=1
" " 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']
" " NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
  \ }
