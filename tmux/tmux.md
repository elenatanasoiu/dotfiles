# Tmux tips

## Copy/paste

It works like in Vim:

* `<Prefix>-[` to enter copy mode
* `v` to start copying
* `y` to copy and exit copy mode

Now it's in the OSX global pasteboard (because of the
`reattach-to-user-namespace` package), so you can do `Cmd-v` or `pbpaste`.

## Choose sessions from a dropdown

`<Prefix> s` will run `tmux choose-session`, which gives you a browseable list of all
sessions.

## Tmux command prompt

`<Prefix> :` is bound to `tmux command-prompt`, which brings up the tmux command
prompt at the bottom of the window. Enter commands there without the `tmux `, so
`tmux rename-session hello` is now `rename-session hello`.

## A long list of tips

https://gist.github.com/andreyvit/2921703

## Even more tips

http://wiki.gentoo.org/wiki/Tmux#Key_Binds
