## Install
    brew install weechat --with-lua --with-perl --with-python --with-ruby
## Run
    weechat

## Connect to Slack
    /server add name-of-team xxxxx.irc.slack.com/6667 -autoconnect -ssl -ssl_dhkey_size=512 -ssl_verify=off -password=****** -username=xxxxx -nicks=xxxxx
    /connect name-of-team

Find the password in https://xxxxx.slack.com/account/gateways

## To message someone
    /q <person> Hello

## This will open a buffer with the current conversation

## To close the buffer:
    /close

## To list channels

    /script install buffers.pl

## Enable mouse

    /mouse enable

## To paste contents of file

pastebinit file.txt

## To move between chat windows:

Ctrl-N and Ctrl-P

## To click links: hold Alt while selecting

## To load history:

Go to :

    https://github.com/thoughtbot/weechat-slacklog

    curl -o ~/.weechat/ruby/slacklog.rb \
      "https://raw.githubusercontent.com/thoughtbot/weechat-slacklog/master/slacklog.rb"

## Optionally set the script to autoload when WeeChat starts:

    cd ~/.weechat/ruby/autoload && ln -s ../slacklog.rb .

Restart WeeChat or load the script manually:

    /script load slacklog.rb

## To connect to IRC channels like #lrug:

    /server add freenode irc.freenode.com/lrug
    /set irc.server.freenode.autoconnect on
    /set irc.server.freenode.username "Elena"
    /set irc.server.freenode.realname "Elena"
    
    /connect freenode
    
    /join #lrug
    
    
    /set irc.server.freenode.autojoin "#lrug,#elixir-lang,#ruby,#rubyonrails"

For more settings check out 

    https://gist.github.com/pascalpoitras/8406501#isetpl
    
# Turning off beeping from beep script
Edit `~/.weechat/plugins.conf`

Change to "off" all `beep_*` variables that are set to "on" 