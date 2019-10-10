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

"------------------------------------
" vim-rails
"------------------------------------
""{{{
"有効化
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END
"}}}

" rubocop
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ }

