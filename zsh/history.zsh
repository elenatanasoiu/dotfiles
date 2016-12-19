# History key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down
bindkey "^Y" accept-and-hold

# Increase history size
export SAVEHIST=10000
export HISTSIZE=10000


