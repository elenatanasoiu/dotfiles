#!/bin/sh

set -e

echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting

echo "Installing tmux and tmuxinator"
brew install tmux
brew install tmuxinator
tmuxinator doctor

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing plugins for zsh"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/horosgrisa/mysql-colorize $ZSH_CUSTOM/plugins/mysql-colorize
git clone https://github.com/amstrad/oh-my-matrix $ZSH_CUSTOM/plugins/oh-my-matrix

echo "Linking dotfiles into ~..."
cd ~
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
mkdir ~/.zsh && cd .zsh
ln -s ~/dotfiles/zsh/aliases.zsh ~/.zsh/aliases.zsh
ln -s ~/dotfiles/zsh/history.zsh ~/.zsh/history.zsh
ln -s ~/dotfiles/zsh/plugins.zsh ~/.zsh/plugins.zsh
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

echo "Adding global gitignore"
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "Reloading zsh"
source ~/.zshrc

echo "Installing tig"
brew install tig

echo "Install advice"
brew install fortune
brew install cowsay

echo "Done!"
