#!/bin/sh

set -e

echo "Installing zsh-syntax-highlighting..."
if [ ! -d ~/.zsh-plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-plugins/zsh-syntax-highlighting
fi

echo "Installing Vundle for plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing rcm"
brew install thoughtbot/formulae/rcm

# Before `rcup` runs, there is no ~/.rcrc, so we must tell `rcup` where to look.
# We need the rcrc because it tells `rcup` to ignore
# backup files that slow it down significantly.
RCRC=rcrc rcup

echo "Linking dotfiles into ~..."
# rcup - install symlinks
# rcdn - remove symlinks
# add -v for visual feedback

rcup -v

echo "Installing Vim packages..."
vim +PlugInstall +qa

echo "Installing tmux and tmuxinator"
brew install tmux
gem install tmuxinator
tmuxinator doctor

cd ~
rm .zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
mkdir ~/.zsh && cd .zsh
ln -s ~/dotfiles/zsh/aliases.zsh ~/.zsh/aliases.zsh
ln -s ~/dotfiles/zsh/history.zsh ~/.zsh/history.zsh
ln -s ~/dotfiles/zsh/plugins.zsh ~/.zsh/plugins.zsh

ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

source ~/.zshrc

