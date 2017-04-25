###########
# ALIASES #
###########

alias be='bundle exec'
alias dotfiles='cd ~/Projects/dotfiles'

# git
alias ga='git add'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias gp='git push'
alias gs='git status'
alias gc='git commit -v'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
alias gpo='git push --set-upstream origin'
alias gpu='git pull'
alias goops="git reset --hard HEAD"
alias uncommit='git reset --soft HEAD~1'

# tmux
alias mux='tmuxinator'
alias muxkill='tmux kill-session'

# Rails
alias rc='rails console'
alias rs='rails s'
alias rss='rails s -p 3004'
alias rspec='bundle exec rspec'
alias rubo='rubocop -c .rubocop.yml -a'

# Notes & Learning
alias gratitude='vim ~/Dropbox/_Elena/Documents/Journal/gratitude.txt'
alias start='vim ~/Dropbox/_Elena/Work/Unboxed/notes/day-start-checklist.md'
alias feels='vim ~/Dropbox/_Elena/Documents/Journal/notes/feels.md'
alias upcase='cd ~/Dropbox/_Elena/Learning/Upcase'
alias learn='cd ~/Dropbox/_Elena/Learning'
alias howto='cd ~/Dropbox/_Elena/Learning/Howtos'
alias vimnotes='vim ~/Dropbox/_Elena/Learning/Upcase/vim_trail/notes.txt'

# Make commands interactive
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias ls="ls -FGh"
alias rm="rm -i"

# User modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"

# Wego weather
alias wego=$GOPATH/bin/wego

# Other
alias v='vim'
