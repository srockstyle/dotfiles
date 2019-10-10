#!/bin/bash
## homebrew

BREW_ST=`which brew`
if [ $? -ne 0 ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
export PATH=$PATH:/usr/local/bin
CURRENT_PATH=`pwd`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## rvm
RVM_ST=`which rvm`
if [ $? -ne 0 ]; then
  curl -sSL https://get.rvm.io | bash -s stable
fi

## brewでいれるやつ
brew install git
brew install zsh
brew install ghq
brew install peco
brew install hub
brew install lua
brew install pyithon3
brew install vim
brew install ctags
brew install yarn --ignore-dependencies
# brew install node
# ctags -R

##-------------
## vim
##-------------
# ディレクトリ
rm -rf ~/.vimrc
rm -rf ~/.vim
mkdir -p ~/.vim/dein
mkdir -p ~/.vim/dictionaries/
ln -s $CURRENT_PATH/vim/userconfig ~/.vim/dein/userconfig
ln -s $CURRENT_PATH/vim/dot_vimrc ~/.vimrc
ln -s $CURRENT_PATH/vim/colors ~/.vim/colors/
# パッケージ管理
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.vim/installer.sh
/bin/sh ~/.vim/installer.sh ~/.cache/dein
# 設定ファイル
## 補完系
git clone https://github.com/pocke/dicts ~/.vim/dictionaries/
# Ruby
gem install solargraph

##-------------
## neovim
##-------i------
rm -rf ~/.config

brew install neovim
brew install the_silver_searcher
brew install fzf

/usr/local/bin/pip3 install neovim

## 設定ファイル
mkdir -p ~/.config
mkdir ~/.config/neovim/dictionaries
ln -s $CURRENT_PATH/neovim ~/config/neovim
## ディレクトリ
# パッケージ管理
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.config/nvim/installer.sh
/bin/sh ~/.config/nvim/installer.sh ~/.cache_nvim/dein
# 設定ファイル
## 補完系
git clone https://github.com/pocke/dicts ~/.config/nvim/dictionaries/
# Ruby
gem install solargraph



## zshrc
rm -rf ~/.zshrc
rm -rf ~/.zsh
mkdir ~/.zsh
mkdir ~/.cache/shell
ln -s $CURRENT_PATH/zsh/main.zsh ~/.zshrc
ln -s $CURRENT_PATH/zsh/zsh.d ~/.zsh/functions
git clone git://github.com/zsh-users/zaw.git ~/.zsh/functions/zaw
git clone git://github.com/mollifier/cd-gitroot.git ~/.zsh/functions/cd-gitroot
git clone git://github.com/yyuu/pyenv.git ~/.pyenv

## font
brew tap sanemat/font
brew install Caskroom/cask/xquartz
brew install ricty
cp -rf /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/

## git
git config --global user.name srockstyle
git config --global user.email kobayashi_shohei@srockstyle.com
git config --global alias.tree 'log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'

## Brewでいれるやつ2
brew install wget
brew install tree
brew install go
brew install wget
brew install htop
brew install nkf
brew install ansible
brew install watch
brew install which
brew install rsense
ruby /usr/local/Cellar/rsense/*/libexec/etc/config.rb > ~/.rsense
brew install tree
brew install imagemagick
brew install q
brew install homebrew/completions/vagrant-completion
brew install kitchen-completion
brew install ruby-completion
brew install gem-completion
brew install bundler-completion
brew install rake-completion
brew install rails-completion
brew install grunt-completion
brew install django-completion
brew install pip-completion
gem install ec2ssh
ec2ssh init
ec2ssh update
gem install kitchen-vagrant
brew cask install cheatsheet
brew cask install evernote
