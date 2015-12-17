#!/bin/bash
## homebrew

BREW_ST=`which brew`
if [ $? -ne 0 ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


## rvm
RVM_ST=`which rvm`
if [ $? -ne 0 ]; then
  curl -sSL https://get.rvm.io | bash -s stable
fi

## brewでいれるやつ
/usr/local/bin/brew install git
/usr/local/bin/brew install zsh
/usr/local/bin/brew install vim
/usr/local/bin/brew install mysql
/usr/local/bin/brew install node

## vimrc
VIMARC_ST=`ls ~/.vimrc`
if [ $? -ne 0 ]; then
  PATH=`pwd`
  /bin/ln -s $PATH/vim/dot_vimrc ~/.vimrc
  /bin/mkdir -p ~/.vim/bundle
  /usr/local/bin/git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  /bin/mkdir -p ~/.vim/colors
  /bin/mkdir -p ~/.vim/vim-snippets
fi

## zshrc
VIMARC_ST=`ls ~/.zshrc`
if [ $? -ne 0 ]; then
  /bin/mkdir -p ~/.zsh/functions
  /usr/local/bin/git clone git://github.com/zsh-users/zaw.git ~/.zsh/functions/zaw
  /usr/local/bin/git clone git://github.com/mollifier/cd-gitroot.git ~/.zsh/functions/cd-gitroot
  /bin/ln -s $PATH/zshrc/dot_zshrc ~/.zshrc
fi

## font
/usr/local/bin/brew tap sanemat/font
/usr/local/bin/brew install Caskroom/cask/xquartz
/usr/local/bin/brew install ricty
/bin/cp -f /usr/local/Cellar/ricty/3.2.4/share/fonts/Ricty*.ttf ~/Library/Fonts/
