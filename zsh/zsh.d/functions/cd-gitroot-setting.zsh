##---------------------------------------------
## git-cdrootの設定
##---------------------------------------------
# https://github.com/mollifier/cd-gitroot
# $ cduでgitのrootフォルダに一発移動。
# cd ~/.zsh/functions/cd-gitroot
# git clone https://github.com/mollifier/cd-gitroot.git
fpath=(~/.zsh/functions/cd-gitroot(N-/) $fpath)
autoload -Uz cd-gitroot
alias cdu='cd-gitroot'
