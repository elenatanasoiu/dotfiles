export ZSH=$HOME/.oh-my-zsh

source $ZSH/oh-my-zsh.sh

# Themes and colors
ZSH_THEME="robbyrussell"
force_color_prompt=yes

# Plugins
plugins=(rails ruby git history-substring-search zsh-syntax-highlighting)

# Tmuxinator settings
export EDITOR='usr/bin/vim'

# Aliases
alias d='cd ~/Projects/dotfiles'
alias ga='git add'
alias gp='git push'
alias gs='git status'
alias gc='git commit -v'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
alias gpu='git pull'
alias mux='tmuxinator'
alias muxkill='tmux kill-session'
alias gpo='git push --set-upstream origin'
alias rss='rails s -p 3004 -b 127.0.0.1'
alias rs='rails s'
alias rc='rails console'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias rspec='bundle exec rspec'
alias rubo='rubocop -c .rubocop.yml -a'
alias uncommit='git reset --soft HEAD~1'
alias gratitude='vim ~/Dropbox/Documents/Journal/gratitude.txt'
alias start='vim ~/Dropbox/Elena/Work/Unboxed/notes/day-start-checklist.md'
alias feels='vim ~/Dropbox/Elena/Documents/Journal/notes/feels.md'

# Increase history size
export SAVEHIST=10000
export HISTSIZE=10000

# History key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down
bindkey "^Y" accept-and-hold

# Sets Ruby path
# BEGIN - Must be last thing in file
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# END Ruby path
