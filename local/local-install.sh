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
rm -f ~/.vimrc
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
rm -f ~/.zshrc
ln -s ~/dotfiles/local/zshrc ~/.zshrc
mkdir -p ~/.zsh && cd .zsh
rm -f ~/.zsh/aliases.zsh
ln -s ~/dotfiles/local/zsh/aliases.zsh ~/.zsh/aliases.zsh
rm -f ~/.zsh/history.zsh
ln -s ~/dotfiles/local/zsh/history.zsh ~/.zsh/history.zsh
rm -f ~/.zsh/plugins.zsh
ln -s ~/dotfiles/local/zsh/plugins.zsh ~/.zsh/plugins.zsh
rm -f ~/.tmux.conf
ln -s ~/dotfiles/local/tmux/tmux.conf ~/.tmux.conf
rm -f ~/.oh-my-zsh/custom/themes/elena.zsh-theme
ln -s ~/dotfiles/zshtheme/elena.zsh-theme ~/.oh-my-zsh/custom/themes/elena.zsh-theme

echo "Adding global gitignore"
rm -f ~/.gitignore_global
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "Install vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Install vim plugins"
vim +PluginInstall +qall

echo "Turn on GPG signing of commits"
git config --global commit.gpgsign true

echo "Installing tig"
brew install tig
ln ../tig/.tigrc.large ~/.tigrc.large
echo "source ~/.tigrc.large" >> ~/.tigrc

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

echo "Setting screenshot location to ~/Screenshots"
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location "~/Screenshots"

echo "Reloading zsh"
source ~/.zshrc

echo "Done!"
