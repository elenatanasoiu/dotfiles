###########
# ALIASES #
###########

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
alias dotfiles='cd ~/Projects/dotfiles'
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
