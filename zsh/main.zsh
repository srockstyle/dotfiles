# UTF-8と日本語
export LANG=ja_JP.UTF-8
export EDITOR=vim
# bindkey -v '^?' backward-delete-char
## 色
autoload colors
colors

## 通常のプロンプト
PROMPT="%{${fg[yellow]}%}%~%{${reset_color}%}
%K{green}%n%k %% "

## forやwhile/複数行入力時などに表示されるプロンプト
PROMPT2="%_%% "

## SPROMPTは入力ミスを確認する場合に表示されるプロンプト
SPROMPT="%r is correct? [n,y,a,e]: "

## zcompletionsの設定。setup.shを実行しておくこと。
fpath=(/usr/local/share/zsh-completions $fpath)

## コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

## Emacs風キーバインドにする
bindkey -e

## 履歴検索機能のショートカット
# コマンドだけ売ってCtrl + p連打
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## 補完で大文字も小文字も
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## ターミナルのホスト名
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
esac

# 自動CD
# ディレクトリと解釈すればそのままCD
setopt AUTO_CD
cdpath=(.. ~ ~/src)

# 単語の区切り文字を指定する
# export WORDCHARS="*?_-.[]~&;=!#$%^(){}<>"
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
# zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-chars " /*?_-.[]~&;=!#$%^(){}<>"
zstyle ':zle:*' word-style unspecified

## 補完機能
autoload -U compinit -u
zstyle ':completion:*' list-colors ''

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# フローコントロールを無効にする
# cmd + sとかqとか
setopt no_flow_control
# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments
# = 以降も補完する
setopt magic_equal_subst
# 単語の途中でもカーソル一で補完
# setopt complete_in_word
#カーソル位置はそのままカーソル位置で補完
# setopt always_last_prompt
setopt globdots # .ファイルでも.なしでマッチできる
# setopt list_packed # リストを詰めて表示
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
## ディレクトリ名だけで移動
setopt auto_cd
## 今まで移動したディレクトリを記憶
# cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd
## コマンドを間違っていれば修正
setopt correct
## 補完機能をつめて表示
setopt list_packed
## 音はならさない
setopt nolistbeep
## 先方予測機能
autoload predict-on
predict-on
## # 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
## スペースで始まるコマンドは履歴にのせない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 高機能なワイルドカード展開を使用する
setopt extended_glob
## tabでパス名の補完候補表示後、続けてTab押して候補からパス名の選択。
# 候補選択はTab
zstyle ':completion:*:default' menu select=1

# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
fi

# LS_COLORSを設定しておく
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'
# # 2つ上、3つ上にも移動できるようにする
export PATH="/usr/local/bin:$PATH"

# cdするときに今いるディレクトリを補完先から外す
zstyle ':completion:*' ignore-parents parent pwd ..

##--------------------------------------------
# キーバインド
##---------------------------------------------
## Ctr + 矢印で単語移動
bindkey ";5C" forward-word
bindkey ";5D" backward-word
# function delete-region() {
#     zle kill-region
#     CUTBUFFER=$killring[1]
#     shift killring
# }
# zle -N delete-region

## 毎回削除が走るので、単語の一部として扱われる文字のセット指定。
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
ZSHHOME="${HOME}/.zsh/functions"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
