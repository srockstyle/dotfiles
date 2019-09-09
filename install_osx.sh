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
brew install vim --with-python3 --with-lua
brew install ctags
brew install node
ctags -R

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

## zshrc
rm -rf ~/.zshrc
rm -rf ~/.zsh
mkdir ~/.zsh
ln -s $CURRENT_PATH/zshrc/main.zsh ~/.zshrc
ln -s $CURRENT_PATH/zshrc/zsh.d ~/.zsh/functions
git clone git://github.com/zsh-users/zaw.git ~/.zsh/functions/zaw
git clone git://github.com/mollifier/cd-gitroot.git ~/.zsh/functions/cd-gitroot


## font
brew tap sanemat/font
brew install Caskroom/cask/xquartz
brew install ricty
cp -rf /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/

## git
git config --global user.name srockstyle
git config --global user.email kobayashi_shohei@srockstyle.com
git log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"

## Brewでいれるやつ2
brew install wget
brew install tree
brew install go

# インフラ・ネットワーク系
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

## 開発環境
# brew cask install virtualbox
# brew cask install vagrant
# brew cask install chefdk

#brew cask install evernote
#brew cask install skitch

## 開発環境もろもろ
gem install ec2ssh
ec2ssh init
ec2ssh update
gem install kitchen-vagrant

## Atom
apm install rsense
apm install japanese-menu
apm install autocomplete-plus

# desktop apps via cask
brew cask install cheatsheet
brew cask install google-chrome
brew cask install iterm2
brew cask install slack
