###########
# ALIASES #
###########

alias be='bundle exec'
alias dotfiles='cd ~/Projects/dotfiles'
alias vmfolder='cd ~/Projects/Work/gds/govuk-puppet/development-vm'
alias gds='cd ~/Projects/Work/gds'

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
alias gposu='git push --set-upstream origin'
alias gpo='git push origin'
alias gpu='git pull'
alias goops="git reset --hard HEAD"
alias uncommit='git reset --soft HEAD~1' # undo last unpushed commit
alias sla='git log --oneline --decorate --graph --all' # print log on one line, with graph and all branches
alias plog="git log --pretty=format:'%C(yellow)%h%C(reset) - %an [%C(green)%ar%C(reset)] %s'" # print enhanced git log, with timestamp and prettified format
alias glog='git log -E -i --grep' # search in commit messages in git log using regular expressions
alias glogs='git log -S' # search the code committed in git log using regex

# tmux
alias mux='tmuxinator'
alias muxkill='tmux kill-session'

# Rails
alias rc='rails console'
alias rs='rails s'
alias rss='rails s -p 3004'
alias rspec='bundle exec rspec'
alias rubo='rubocop -c .rubocop.yml -a'
alias rubodiff='git diff --name-only HEAD~1 | xargs bundle exec rubocop -a'

# Notes & Learning
alias gratitude='vim ~/Dropbox/_Elena/Documents/Journal/gratitude.txt'
alias start='vim ~/Dropbox/_Elena/Documents/Jounal/day-start-checklist.md'
alias feels='vim ~/Dropbox/_Elena/Documents/Journal/feels.md'
alias upcase='cd ~/Dropbox/_Elena/Learning/Upcase'
alias learn='cd ~/Dropbox/_Elena/Learning'
alias howto='cd ~/Dropbox/_Elena/Learning/Howtos'

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

# Rubymine
alias rubymine='open -a rubymine'

