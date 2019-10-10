"-----------------------------------
" タブ設定
"-----------------------------------
augroup fileTypeIndent
    " 言語ごと
    autocmd!
    " Python
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    " PHP
    autocmd BufNewFile,BufRead *.php setlocal tabstop=4 softtabstop=4 shiftwidth=4
    " Ruby
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2

    "フレームワークごとの設定
    " CakePHP
    autocmd BufNewFile,BufRead *.ctp setlocal tabstop=4 softtabstop=4 shiftwidth=4

augroup END

"-----------------------------------
