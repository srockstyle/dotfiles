set background=dark
colorscheme hybrid
set number "行番号を表示する
set cursorline "カーソル行のハイライト
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set shell=/usr/local/bin/zsh
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
"ビープ音を消す
set belloff=all
"オートインデント
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
set smartindent
"スワップファイル使わない
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
"エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
"現在のGitブランチ
set statusline+=%{fugitive#statusline()}
"ファイルパス
set title
"コマンドラインでTabによるファイル名変換
set wildmenu
"コマンド履歴
set history=500
"入力中のコマンド
set showcmd
" deleteの有効か
set backspace=indent,eol,start
"vi互換をオフする
" set nocompatible
"小文字検索で大文字検索
set smartcase
" 検索結果をハイライト表示する
set hlsearch
"多分を空白文字に
" set expandtab
" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" タブと行の続きを可視化する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 対応する括弧やブレースを表示する
set showmatch
" スワップファイル用のパス
set directory=$HOME/.config/nvim/backup
" %で対応するかっこへ移動
" source $VIMRUNTIME/macros/matchit.config/vim
"インクリメンタルサーチ
set incsearch
"かっこをいれたら対応するかっこを表示
set showmatch
"補完ポップアップの高さ
set pumheight=5
"ヤンクした内容が消えないようにする
inoremap PP "0p
" set smarttab
"新しい行を作った時に高度な自動インデントを行う
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^a
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^a
" インタラクティブに置換する
set inccommand=split
" ノーマルモード移行で保存
inoremap <silent> jj <ESC>:<C-u>w<CR>


map <C-T> :table

" 貼り付けやっても自動インデントされない
" set pasteやらなくてもよくなった！
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function! XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


" call pathogen#infect()


" vimのファイルタイプによる設定
filetype plugin indent on
" " 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" スペース + pとyでコピーペースト
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
noremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" カーソル移動をキーボードで
" 矢印キー禁止令 ごめんなさい無理でした
" map <Up> <Nop>
" map <Down> <Nop>
" map <Left> <Nop>
" map <Right> <Nop>
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
"20行ずつ移動
nnoremap <C-n> 5j
vnoremap <C-n> 5j
nnoremap <C-p> 5k
vnoremap <C-p> 5k

"
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
"画面最後の行をできる限り表示する。
set display+=lastline
" ファイルエンコーディングの表示
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\


""""""""""""""""""""""""""""""
" 画面分割
""""""""""""""""""""""""""""""
nnoremap sp :<C-u>sp<CR>
nnoremap vs :<C-u>vs<CR>

""""""""""""""""""""""""""""""
" 面分割間移動
""""""""""""""""""""""""""""""
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l
nnoremap wh <C-w>h

"""""""""""""""""""""""""""""
" シェル使いたい
""""""""""""""""""""""""""""""
nnoremap ds :Deol<CR>

""""""""""""""""""""""""""""""
"終了、保存周り
""""""""""""""""""""""""""""""
nnoremap wq :<C-u>:wq!<CR>


""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

""""""""""""""""""""""""""""""
" 行頭から前行の行末への移動
""""""""""""""""""""""""""""""
set whichwrap=b,s,h,l,<,>,[,]


"------------------------------------
" vimrc自動再読み込み
"-----------------------------------
" autocmd  sourc $MYGVIMRC
" Set augroup.
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC


" タブリファクタリング
nnoremap tab :set expandtab<Enter>:retab<Enter>:w<Enter>


"上スライド
nnoremap MM ddkkp
"下スライド
nnoremap mm ddp


"------------------------------------
" 外部設定ファイル読み込み
"-----------------------------------
runtime! rc/*.vim

