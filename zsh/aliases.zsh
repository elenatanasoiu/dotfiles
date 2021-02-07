###########
# ALIASES #
###########

alias be='bundle exec'
alias dotfiles='cd ~/dotfiles'

# foreman
alias fart='fligo app start'

# git
alias amen='git commit --amend --no-edit'
alias amend='git commit --amend'
alias fixup='git commit --fixup'
alias fsquash='git rebase -i --autosquash'
alias ga='git add'
alias gb='git branch --sort=-committerdate'
alias gc='git commit -v'
alias gco='git checkout'
alias gd='git diff'
alias gpo='git push origin'
alias gposu='git push --set-upstream origin'
alias gs='git status'
alias lcm='git log -1 --pretty=%B | pbcopy' # Get last commit message
alias oops="git reset --hard HEAD"
alias pickaxe="git log -p -S"
alias skipgc='SKIP=RuboCop git commit -v' # Temporary skip rubocop harrassment during rebase
alias uncommit='git reset --soft HEAD~1' # undo last commit
alias wip='git add . && gc -m "WIP" --no-verify' # Create a wip commit

# Git Log
alias sla='git log --oneline --decorate --graph --all' # print log on one line, with graph and all branches
alias plog="git log --pretty=format:'%C(yellow)%h%C(reset) - %an [%C(green)%ar%C(reset)] %s'" # print enhanced git log, with timestamp and prettified format
alias glog='git log -E -i --grep' # search in commit messages in git log using regular expressions
alias glogs='git log -S' # search the code committed in git log using regex
alias gtree="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"

# Lint
alias lint='pre-commit run'

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
alias ls="ls -FGh"
alias mv="mv -iv"
alias rm="rm -iv"

# Rubymine
alias mine='open -a rubymine'
alias mined='open -a rubymine ~/projects/deployment'
alias mineds='open -a rubymine ~/projects/design-system'
alias minef='open -a rubymine ~/projects/frontend'
alias minefl='open -a rubymine ~/projects/futurelearn'
alias minedns='open -a rubymine ~/projects/dns'
alias minesq='open -a rubymine ~/projects/squiddy'
alias minet='open -a rubymine ~/projects/terraform'

# FL shortcuts
alias ffs='bundle install && bundle exec rake db:migrate && bundle exec rake db:test:prepare && yarn'
alias lock-pl='fligo lock -e playground futurelearn --create'
alias release-pl='fligo lock futurelearn -e playground --release'

# Life aliases
alias cow="fortune | cowsay"

# Docker
# alias prune-af="docker system prune -a -f" # clean everything
# alias docker-rm-all="docker rm -f $(docker images -aq)" # removes all images

# Vim
# Install vim plugins via vundle
alias vundle="vim +PluginInstall +qall"

