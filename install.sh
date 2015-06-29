#!/bin/bash 

## vimrc
PATH=`pwd`
/bin/ln -s $PATH/vim/dot_vimrc ~/.vimrc 
/bin/mkdir -p ~/.vim/bundle
/usr/local/bin/git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
/bin/mkdir -p ~/.vim/colors
/bin/mkdir -p ~/.vim/vim-snippets
## zshrc
/bin/mkdir -p ~/.zsh/functions
/usr/local/bin/git clone git://github.com/zsh-users/zaw.git ~/.zsh/functions/zaw
/usr/local/bin/git clone git://github.com/mollifier/cd-gitroot.git ~/.zsh/functions/cd-gitroot

/bin/ln -s $PATH/zshrc/dot_zshrc ~/.zshrc 

## font
/bin/cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
