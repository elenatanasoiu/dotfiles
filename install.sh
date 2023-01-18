#!/usr/bin/env bash

DOTFILES_ROOT=$(exec 2>/dev/null;cd -- $(dirname "$0"); unset PWD; /usr/bin/pwd || /bin/pwd || pwd)

# Helper function
generic_install() {
  (which brew > /dev/null && brew install "$1") || sudo apt install -o DPkg::Options::="--force-confnew" -y "$1"
}

echo "Installing zsh..."
which zsh || generic_install zsh

echo "Installing oh-my-zsh..."
if [[ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]]; then
  if [[ -d ~/.oh-my-zsh ]]; then
    rm -rf ~/.oh-my-zsh
  fi
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "Install zsh-syntax-highlighting"
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

echo "Linking dotfiles into $HOME"
rm -rf $HOME/.zsh && mkdir $HOME/.zsh

create_symlinks() {
    source_files=("vim/vimrc" "zsh/zshrc" "zsh/aliases.zsh" "zsh/history.zsh" "zshtheme/elena.zsh-theme" ".gitignore_global")
    destination_files=(".vimrc" ".zshrc" ".zsh/aliases.zsh" ".zsh/history.zsh" ".oh-my-zsh/custom/themes/elena.zsh-theme" ".gitignore_global")

    for i in $source_files; do
        source=$(basename ${source_files[$i]})
        destination=$(basename ${destination_files[$i]})
        rm "$HOME/$destination"
        ln -s "$DOTFILES_ROOT/$source $HOME/$destination"
        echo "$DOTFILES_ROOT/$source linked to $HOME/$destination.\n"
    done
}

create_symlinks

echo "Adding global gitignore"
git config --global core.excludesfile $HOME/.gitignore_global

echo "Turn on GPG signing of commits"
git config --global commit.gpgsign true

echo "Install xclip xsel"
sudo apt install xclip xsel

echo "Install vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Install vim plugins"
vim +PluginInstall +qall

echo "Installing tig"
sudo apt-get install tig -y
cp $DOTFILES_ROOT/tig/.tigrc.large $HOME/.tigrc.large
echo "source $HOME/.tigrc.large" >> $HOME/.tigrc

echo "Reloading zsh"
source $HOME/.zshrc

echo "Done!"
