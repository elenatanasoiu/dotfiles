#!/bin/sh

set -e

# The full path to the directory containing this script
DOTFILES_ROOT=$(cd -- "$(dirname "$0")/.." && pwd)

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ASK=1

echo "Installing homebrew"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Installing GitHub CLI"
brew install gh

if ! gh auth status >/dev/null 2>&1; then
  echo "Authenticating GitHub CLI"
  gh auth login
fi

echo "Installing GitHub CLI extensions"
for extension in \
  github/gh-ci \
  github/gh-hubber-skills \
  github/gh-kustomize \
  github/gh-models \
  github/gh-shell \
  rneatherway/gh-slack \
  github/gh-stack
do
  if ! gh extension install "$extension" --force; then
    echo "Warning: failed to install $extension, continuing" >&2
  fi
done

echo "Installing NVM"
export NVM_DIR="$HOME/.nvm"
PROFILE=/dev/null /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh)"
. "$NVM_DIR/nvm.sh"

echo "Installing Node.js and npm"
nvm install --lts
nvm alias default 'lts/*'

echo "Installing GitHub Copilot CLI and skills CLI"
npm install --global @github/copilot skills

echo "Installing GitHub Copilot CLI plugins"
if ! copilot plugin marketplace list | grep -q "ponytail"; then
  copilot plugin marketplace add DietrichGebert/ponytail
fi
if ! copilot plugin marketplace list | grep -q "agent-config"; then
  copilot plugin marketplace add github/agent-config
fi
if ! copilot plugin marketplace list | grep -q "caveman"; then
  copilot plugin marketplace add JuliusBrussee/caveman
fi

for plugin in \
  github/auto-agentics \
  caveman@caveman \
  ponytail@ponytail \
  port@agent-config
do
  plugin_name=${plugin%%@*}
  plugin_name=${plugin_name##*/}
  if copilot plugin list | grep -Eq "^[[:space:]]+[^[:alnum:]]+[[:space:]]+$plugin_name([@[:space:]]|$)"; then
    echo "$plugin_name Copilot plugin already installed, skipping"
  else
    copilot plugin install "$plugin"
  fi
done

echo "Installing GitHub Copilot skills"
skills add microsoft/GitHub-Copilot-for-Azure \
  --global \
  --agent github-copilot \
  --skill \
    appinsights-instrumentation \
    azure-ai \
    azure-aigateway \
    azure-cloud-migrate \
    azure-compliance \
    azure-compute \
    azure-cost \
    azure-deploy \
    azure-diagnostics \
    azure-kusto \
    azure-messaging \
    azure-prepare \
    azure-resource-lookup \
    azure-resource-visualizer \
    azure-storage \
    azure-validate \
    entra-app-registration \
    microsoft-foundry \
  --full-depth \
  --yes
skills add JuliusBrussee/caveman \
  --global \
  --agent github-copilot \
  --skill caveman caveman-commit caveman-compress caveman-help caveman-review \
  --full-depth \
  --yes
skills add vercel-labs/skills \
  --global \
  --agent github-copilot \
  --skill find-skills \
  --full-depth \
  --yes

echo "Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting

echo "Installing tmux and tmuxinator"
brew install tmux
brew install tmuxinator

echo "Install shellcheck"
brew install shellcheck

echo "Installing oh-my-zsh"
if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "Linking dotfiles into ~..."
cd ~
rm -f ~/.vimrc
ln -s $DOTFILES_ROOT/vim/vimrc ~/.vimrc
rm -f ~/.zshrc
ln -s $DOTFILES_ROOT/local/zshrc ~/.zshrc
mkdir -p ~/.zsh
for fragment in aliases history homebrew plugins tmux tmuxinator
do
  rm -f "$HOME/.zsh/$fragment.zsh"
  ln -s "$DOTFILES_ROOT/local/zsh/$fragment.zsh" "$HOME/.zsh/$fragment.zsh"
done
rm -f ~/.tmux.conf
ln -s $DOTFILES_ROOT/tmux/tmux.conf ~/.tmux.conf
rm -f ~/.oh-my-zsh/custom/themes/elena.zsh-theme
ln -s $DOTFILES_ROOT/zshtheme/elena.zsh-theme ~/.oh-my-zsh/custom/themes/elena.zsh-theme

echo "Adding global gitignore"
rm -f ~/.gitignore_global
ln -s $DOTFILES_ROOT/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "Install vundle"
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "Vundle already installed, skipping"
fi

echo "Install vim plugins"
vim +PluginInstall +qall

echo "Turn on GPG signing of commits"
git config --global commit.gpgsign true

echo "Installing tig"
brew install tig
ln -sf $DOTFILES_ROOT/tig/.tigrc.large ~/.tigrc.large
# Only append to .tigrc if not already sourced
if [[ ! -f ~/.tigrc ]] || ! grep -q "source ~/.tigrc.large" ~/.tigrc; then
  echo "source ~/.tigrc.large" >> ~/.tigrc
fi

echo "Install advice"
brew install fortune
brew install cowsay

echo "Install fuzzy finder"
brew install fzf
"$(brew --prefix)/opt/fzf/install" --all --no-update-rc
echo "Install ripgrep to use with fzf"
brew install ripgrep

echo "Install serverless for squiddy"
npm install --global serverless@4.41.1

echo "Install asciinema"
brew install asciinema

echo "Setting screenshot location to ~/Screenshots"
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location "$HOME/Screenshots"

echo "Reloading zsh"
source ~/.zshrc

echo "Done!"
