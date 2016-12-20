#!/bin/sh

set -e

echo "Installing zsh-syntax-highlighting..."
if [ ! -d ~/.zsh-plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-plugins/zsh-syntax-highlighting
fi

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
