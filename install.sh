#!/usr/bin/bash 

## vimrc
PATH=`pwd`
ln -s $PATH/vim/dot_vimrc ~/.vimrc 
mkdir -r ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

## zshrc
ln -s $PATH/zshrc/dot_zshrc ~/.zshrc 


