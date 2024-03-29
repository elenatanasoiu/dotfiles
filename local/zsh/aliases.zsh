###########
# ALIASES #
###########

alias be='bundle exec'
alias dotfiles='cd ~/dotfiles'

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
alias brt='bin/rails test'

# Make commands interactive
alias cp="cp -iv"
alias ls="ls -FGh"
alias mv="mv -iv"
alias rm="rm -iv"

# Rubymine
alias mine='open -a rubymine'
alias idea='open -a "IntelliJ IDEA.app"'

# GoLand
alias goland='open -a goland'

# VSCod
alias vscod='code .'

# Life aliases
alias cow="fortune | cowsay"
alias joke="curl -s https://official-joke-api.appspot.com/random_joke | jq -r '.setup + \"\n\" + .punchline'"
alias dadjoke="curl -s https://fatherhood.gov/jsonapi/node/dad_jokes | jq -r '.data[] | .attributes.field_joke_opener + \"\n\" + .attributes.field_joke_response'"
alias say-pickles="yes pickles | xargs say"

# Vim
# Install vim plugins via vundle
alias vundle="vim +PluginInstall +qall"

# Turn screen recordings into gifs
alias gif="ffmpeg -i ~/Desktop/in.mov -pix_fmt rgb8 -r 10 output.gif && gifsicle -O3 output.gif -o output.gif"

# Codespaces
alias ghcc="gh codespace-compose"
alias ghccu="gh codespace-compose up"
alias ghccd="gh codespace-compose down"
alias ghccg="gh codespace-compose code github"
alias ghcct="gh codespace-compose code turboscan"
