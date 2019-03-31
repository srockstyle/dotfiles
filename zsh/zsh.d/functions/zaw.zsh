##　前準備
if [ ! -e $HOME/.zsh/functions/zaw/zaw.zsh ];then
  git clone git://github.com/zsh-users/zaw.git $HOME/.zsh/functions
fi

## zaw.zsh
source $HOME/.zsh/functions/zaw/zaw.zsh
# ## Ctrl -hで履歴起動。
bindkey '^h' zaw-history
# ## その他設定
setopt hist_expand
setopt inc_append_history
setopt hist_no_store
setopt hist_save_no_dups
setopt hist_verify
setopt hist_reduce_blanks
