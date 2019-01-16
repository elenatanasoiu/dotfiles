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

eval "$(rbenv init -)"
eval "$(nodenv init -)"

export PATH=~/Library/Python/2.7/bin/:$PATH

source $ZSH/oh-my-zsh.sh
