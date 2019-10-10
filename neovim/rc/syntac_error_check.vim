""""""""""""""""""""""""""""""
" 構文エラーチェック
""""""""""""""""""""""""""""""
"----------------------------------------------------------
" Syntasticの設定
"----------------------------------------------------------
" 設定頑張れなかった
" 構文エラー行に「>>」を表示
"let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
"let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
"let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
"let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
"let g:syntastic_check_on_wq = 1

" 保存時にエラーがあれば表示
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_ruby_checkers=['rubocop', 'mri']
