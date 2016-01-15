#!/bin/bash
## rvm
RVM_ST=`which rvm`
if [ $? -ne 0 ]; then
  curl -sSL https://get.rvm.io | bash -s stable
  rvm install
fi

## brewでいれるやつ
sudo yum -y install git-core
sudo yum -y install zsh
sudo yum -y install vim-common
sudo yum -y install vim-enhanced


CURRENT_PATH=`pwd`
VIM_BIN=`which vim`
## vimrc
rm -rf ~/.vimrc
rm -rf ~/.vim
ln -s VIM_BIN /usr/local/bin/vim
ln -s $CURRENT_PATH/vim/dot_vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/autoload
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/vim-snippets

## zshrc
rm -rf ~/.zshrc
rm -rf ~/.zsh
mkdir -p ~/.zsh/functions
git clone git://github.com/zsh-users/zaw.git ~/.zsh/functions/zaw
git clone git://github.com/mollifier/cd-gitroot.git ~/.zsh/functions/cd-gitroot
ln -s $CURRENT_PATH/zshrc/dot_zshrc ~/.zshrc
