" Ruby
" solargraphをインストールすると使える
" $ gem install solargraph
let g:monster#completion#backend = 'solargraph'
" async completion
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:neocomplete#sources#omni#input_patterns = {
  \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

let g:neosnippet#snippets_directory='~/.vim/dictionaries'
let s:neco_dicts_dir = '~/.vim/dictionaries'
if isdirectory(s:neco_dicts_dir)
  let g:neocomplete#sources#dictionary#dictionaries = {
  \   'javascript': s:neco_dicts_dir . '/jquery.dict',
  \ }
endif


" スニペットなんだけど使えてるか微妙
autocmd User Rails.view*                 NeoSnippetSource ~/.config/nvim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.config/nvim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.config/nvim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.config/nvim/snippet/ruby.rails.route.snip

