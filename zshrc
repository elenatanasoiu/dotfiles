# use vim as the visual editor
# export VISUAL='vim'
# export EDITOR=$VISUAL

# To be used with `bundle open`
export EDITOR="subl -w"
export BUNDLER_EDITOR="subl"

# Path to my oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

BASE="$HOME/.zsh"
for file in "$BASE/$1"/*.zsh; do 
  source "$file"
done

# Add RVM to PATH for scripting
# export PATH="$PATH:$HOME/.rvm/bin"

# For the VM, using rbenv: 
setopt extendedglob
for file in /etc/profile.d/**/^bash_completion*; do 
    source $file; 
done

# Use thefuck script: https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"

# Modify the prompt to contain git branch name if applicable
# From: https://github.com/thoughtbot/dotfiles/blob/dbb72cea5f3e857da519abf08aa62aaa61ccfd52/zshrc#L1-L9
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# More stuff
function trash() { mv $1 ~/.Trash }
function mkcd() { mkdir $1 && cd $1 }
function mkgit() { mkdir $1 && cd $1 && git init }

# Postgres
alias restart-postgres="rm /usr/local/var/postgres/postmaster.pid && cd ~/Library/LaunchAgents && launchctl unload homebrew.mxcl.postgresql.plist && launchctl load -w homebrew.mxcl.postgresql.plist"

# Go
export GOPATH="$HOME/Projects/Personal/go_path"

# ssh-key with passphrase, with ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi
