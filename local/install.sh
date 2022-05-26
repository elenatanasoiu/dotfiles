#!/bin/sh

set -e

echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting

echo "Installing tmux and tmuxinator"
brew install tmux
brew install tmuxinator
tmuxinator doctor

echo "Install shellcheck"
brew install shellcheck

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Linking dotfiles into ~..."
cd ~
rm ~/.vimrc
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
rm ~/.zshrc
ln -s ~/dotfiles/local/zshrc ~/.zshrc
mkdir ~/.zsh && cd .zsh
rm ~/.zsh/aliases.zsh
ln -s ~/dotfiles/local/zsh/aliases.zsh ~/.zsh/aliases.zsh
rm ~/.zsh/history.zsh
ln -s ~/dotfiles/local/zsh/history.zsh ~/.zsh/history.zsh
rm ~/.zsh/plugins.zsh
ln -s ~/dotfiles/local/zsh/plugins.zsh ~/.zsh/plugins.zsh
rm ~/.tmux.conf
ln -s ~/dotfiles/local/tmux/tmux.conf ~/.tmux.conf
rm ~/.oh-my-zsh/custom/themes/elena.zsh-theme
ln -s ~/dotfiles/zshtheme/elena.zsh-theme ~/.oh-my-zsh/custom/themes/elena.zsh-theme

echo "Adding global gitignore"
rm ~/.gitignore_global
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "Installing tig"
brew install tig

echo "Install advice"
brew install fortune
brew install cowsay

echo "Install fuzzy finder"
brew install fzf
"$(brew --prefix)/opt/fzf/install"
echo "Install ripgrep to use with fzf"
brew install ripgrep

echo "Install serverless for squiddy"
curl -o- -L https://slss.io/install | zsh

echo "Install asciinema"
brew install asciinema

echo "Install stretch.ly"
brew install --cask stretchly

echo "Reloading zsh"
source ~/.zshrc

echo "Done!"
