# use vim as the visual editor
export VISUAL='vim'
export EDITOR=$VISUAL

# To be used with `bundle open`
# export EDITOR="subl -w"
# export BUNDLER_EDITOR="subl"

# Path to my oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

BASE="$HOME/.zsh"
for file in "$BASE/$1"/*.zsh; do
  source "$file"
done

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Chruby
source /usr/local/share/chruby/chruby.sh
chruby 2.6.2

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

_git_pair () {
  __gitcomp_nl "$(git config --get-all git-pair.authors | sed 's/\([^ ]*\).*/\1/')"
}

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh
