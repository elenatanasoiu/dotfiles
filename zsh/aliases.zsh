###########
# ALIASES #
###########

alias be='bundle exec'
alias dotfiles='cd ~/Projects/dotfiles'

# foreman
alias fart='fligo app start'

# git
alias ga='git add'
alias gco='git checkout'
alias gs='git status'
alias gc='git commit -v'
alias gd='git diff'
alias gb='git branch --sort=-committerdate'
alias gposu='git push --set-upstream origin'
alias gpo='git push origin'
alias oops="git reset --hard HEAD"
alias uncommit='git reset --soft HEAD~1' # undo last unpushed commit
alias amen='git commit --amend --no-edit'
# Get last commit message
alias lcm='git log -1 --pretty=%B | pbcopy'
# Temporary skip rubocop harrassment during rebase 
alias skipgc='SKIP=RuboCop git commit -v'
# Lint
alias lint='pre-commit run'
# Create a wip commit
alias wip='git add . && gc -m "WIP" --no-verify'
# Fixup
alias fixup='git commit --fixup'
alias fsquash='git rebase -i --autosquash origin/master'

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
alias rubo='bundle exec rubocop -a'
# Run Rubocop with autocorrect only on staged changes
alias rubodiff='git diff --name-only HEAD | xargs bundle exec rubocop -a'

# Minitest
alias bert='bundle exec rake test'

# Make commands interactive
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias ls="ls -FGh"
alias rm="rm -i"

# Rubymine
alias mine='open -a rubymine'
alias minefrontend='open -a rubymine ~/projects/frontend'
alias minefl='open -a rubymine ~/projects/futurelearn'
alias minetf='open -a rubymine ~/projects/terraform'
alias minedeployment='open -a rubymine ~/projects/deployment'
alias minedns='open -a rubymine ~/projects/dns'

# FL shortcuts
alias ffs='bundle install && bundle exec rake db:migrate && bundle exec rake db:test:prepare && yarn'
alias release-pl='fligo lock futurelearn -e playground --release'
alias lock-pl='fligo lock -e playground futurelearn --create'

# Life aliases
alias cow="fortune | cowsay"

# Docker
# alias prune-af="docker system prune -a -f" # clean everything
# alias docker-rm-all="docker rm -f $(docker images -aq)" # removes all images

# Vim
# Install vim plugins via vundle
alias vundle="vim +PluginInstall +qall"

