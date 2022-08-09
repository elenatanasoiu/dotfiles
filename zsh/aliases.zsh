###########
# ALIASES #
###########

alias be='bundle exec'
alias dotfiles='cd /workspaces/.codespaces/.persistedshare/dotfiles'

# Xclip - for codespaces
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# git
alias amen='git commit --amend --no-edit'
alias amend='git commit --amend'
alias autosquash='git rebase -i --autosquash'
alias fixup='git commit --fixup'
alias ga='git add'
alias gb='git branch --sort=-committerdate'
alias gc='git commit -v'
alias gco='git checkout'
alias gd='git diff'
alias ghp='gh pr create --label scalable-platform --reviewer futurelearn/scalable-platform-team'
alias gpo='git push origin $(git branch --show-current)'
alias gposu='git push --set-upstream origin $(git branch --show-current)'
alias gs='git status'
alias lcm='git log -1 --pretty=%B | pbcopy' # Get last commit message
alias oops="git reset --hard HEAD"
alias pickaxe="git log -p -S"
alias skipgc='SKIP=RuboCop git commit -v' # Temporary skip rubocop harrassment during rebase
alias uncommit='git reset --soft HEAD~1' # undo last commit
alias wip='git add . && gc -m "WIP" --no-verify' # Create a wip commit
alias branchboom='git branch --merged | grep -v \* | xargs git branch -D'

# gh
alias ghcompare='gh browse --branch $(git branch --show-current)'

# Git Log
alias lol='git log --oneline --decorate --graph --all' # print log on one line, with graph and all branches
alias plog="git log --pretty=format:'%C(yellow)%h%C(reset) - %an [%C(green)%ar%C(reset)] %s'" # print enhanced git log, with timestamp and prettified format
alias glog='git log -E -i --grep' # search in commit messages in git log using regular expressions
alias glogs='git log -S' # search the code committed in git log using regex
alias gtree="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"

# Lint
alias lint='pre-commit run'

# Rails
alias rc='rails console'
alias rs='rails s'
alias rubo='bundle exec rubocop -a'
# Run Rubocop with autocorrect only on staged changes
alias rubodiff='git diff --name-only HEAD | xargs bundle exec rubocop -a'

# Minitest
alias brt='bin/rails test'

# Make commands interactive
alias cp="cp -iv"
alias ls="ls -FGh"
alias mv="mv -iv"
alias rm="rm -iv"

# Life aliases
alias cow="fortune | cowsay"
alias joke="curl -s https://official-joke-api.appspot.com/random_joke | jq -r '.setup + \"\n\" + .punchline'"

# Vim
# Install vim plugins via vundle
alias vundle="vim +PluginInstall +qall"

# GPG
alias disable-gpg="git config commit.gpgsign false"
alias enable-gpg="git config commit.gpgsign true"
