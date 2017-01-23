# Themes and colors
ZSH_THEME="robbyrussell"
force_color_prompt=yes

unset LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS=$LSCOLORS

%{$GREEN%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)$(git_prompt_short_sha)$(parse_git_dirty)%{$RESET_COLOR%}

