""""""""""""""""""""""""""""""
"タグジャンプ
""""""""""""""""""""""""""""""
" タグファイル作成は以下のコマンドで
" $ ctags -R -f .tags
"
"タグファイル読み込み
set tags=.tags;$HOME

" @aratana_tamutomo
" https://qiita.com/aratana_tamutomo/items/59fb4c377863a385e032
function! s:execute_ctags() abort
  " 探すタグファイル名
  let tag_name = '.tags'
  " ディレクトリを遡り、タグファイルを探し、パス取得
  let tags_path = findfile(tag_name, '.;')
  " タグファイルパスが見つからなかった場合
  if tags_path ==# ''
    return
  endif

  " タグファイルのディレクトリパスを取得
  " `:p:h`の部分は、:h filename-modifiersで確認
  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  " 見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction
" タグファイル作成
augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END

"キーマップ
nnoremap <C-g> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
