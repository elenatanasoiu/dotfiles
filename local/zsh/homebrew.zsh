############
# Homebrew #
############

is_osx(){
  [ "$(uname -s)" = Darwin ]
}

if is_osx; then
  export HOMEBREW_NO_ANALYTICS=1

  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi
