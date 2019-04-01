###########
# ALIASES #
###########

alias be='bundle exec'
alias dotfiles='cd ~/Projects/dotfiles'

# foreman
alias fart='bundle exec foreman start'

# git
alias ga='git add'
alias gco='git checkout'
alias gs='git status'
alias gc='git commit -v'
alias gd='git diff'
alias gb='git branch'
alias gposu='git push --set-upstream origin'
alias gpo='git push origin'
alias oops="git reset --hard HEAD"
alias uncommit='git reset --soft HEAD~1' # undo last unpushed commit
alias amen='git commit --amend --no-edit'
# Get last commit message
alias lcm='git log -1 --pretty=%B | pbcopy'
# Temporary skip rubocop harrassment during rebase 
alias skipgc='SKIP=RuboCop git commit -v'

# Git Log 
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
alias rspec='bundle exec rspec'
alias rubo='bundle exec rubocop -a'
# Run Rubocop with autocorrect only on staged changes
alias rubodiff='git diff --name-only HEAD | xargs bundle exec rubocop -a'

# Minitest
alias bert='bundle exec rake test'

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

# Rubymine
alias rubymine='open -a rubymine'

