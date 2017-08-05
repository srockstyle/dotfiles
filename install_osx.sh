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
#brew install mysql
#brew install node

## vimrc
ln -s $CURRENT_PATH/vim/dot_vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/vim-snippets
vim +PluginInstall +qall


## zshrc
mkdir -p ~/.zsh/functions
git clone git://github.com/zsh-users/zaw.git ~/.zsh/functions/zaw
git clone git://github.com/mollifier/cd-gitroot.git ~/.zsh/functions/cd-gitroot
ln -s $CURRENT_PATH/zshrc/dot_zshrc ~/.zshrc

## font
brew tap sanemat/font
brew install Caskroom/cask/xquartz
brew install ricty
cp -rf /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/

## Brewでいれるやつ2
brew install wget
brew install tree
brew install go
# rmコマンドの代わりにtrashを使って、削除時にはゴミ箱に入れる
#brew install trash
#echo 'alias rm="trash"' >> ~/.bash_profile

# インフラ・ネットワーク系
brew install wget
brew install htop
brew install nkf
brew install ansible

brew install watch
brew install which
#brew install rsense
#ruby /usr/local/Cellar/rsense/*/libexec/etc/config.rb > ~/.rsense
brew install tree
# brew install imagemagick
# brew install q
# brew install homebrew/completions/vagrant-completion
# brew install kitchen-completion
# brew install ruby-completion
# brew install gem-completion
# brew install bundler-completion
# brew install rake-completion
# brew install rails-completion
# brew install grunt-completion
# brew install django-completion
# brew install pip-completion

## 開発環境
brew cask install virtualbox
brew cask install vagrant
# vagrant plugin install sahara
# vagrant plugin install vagrant-cachier
# vagrant plugin install vagrant-global-status
# vagrant plugin install vagrant-omnibus
# vagrant plugin install vagrant-vbguest
# vagrant plugin install vagrant-berkshelf
# vagrant plugin install vagrant-hostmanager
# vagrant plugin install vagrant-aws
# vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
#brew cask install chefdk
brew cask install atom

## r
# brew cask install r
# brew cask install rstudio
#
# ## 電子書籍
# brew cask install kindle
# brew cask install kindle-previewer # epub -> mobi変換
# brew cask install calibre
#
# ## Android（あれば
# brew cask install android-studio
# brew cask install caffeine
#
# # flash player(safari)
# brew cask install flash
#
# evernote

#brew cask install evernote
#brew cask install skitch

## 開発環境もろもろ
#gem install ec2ssh
#rbenv rehash
#ec2ssh init
#ec2ssh update
#gem install kitchen-vagrant

## Atom
apm install rsense
apm install japanese-menu
apm install autocomplete-plus

## SNS
#brew cask install twitter


# desktop apps via cask
#export HOMEBREW_CASK_OPTS="--appdir=/Applications"
#brew cask install cheatsheet
#brew cask install dash
#brew cask install dropbox
brew cask install google-chrome
#brew cask install iterm2
#brew cask install slack
#brew cask install skype
