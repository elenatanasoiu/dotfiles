export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

BASE="$HOME/.zsh"
for file in "$BASE/$1"/*.zsh; do 
  source "$file"
done

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
