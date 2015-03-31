#!/bin/bash 

## vimrc
PATH=`pwd`
/bin/ln -s $PATH/vim/dot_vimrc ~/.vimrc 
/bin/mkdir -p ~/.vim/bundle
/usr/local/bin/git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

## zshrc
/bin/mkdir -p ~/.zshrc/functions
/usr/local/bin/git clone git://github.com/zsh-users/zaw.git ~/.zsh/functions/zaw
/usr/local/bin/git clone git://github.com/mollifier/cd-gitroot.git ~/.zsh/functions/cd-gitroot

/bin/ln -s $PATH/zshrc/dot_zshrc ~/.zshrc 


