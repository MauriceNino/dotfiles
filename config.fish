set -x fish_greeting ''

bind \ca 'll; commandline -f repaint'
bind \cr 'peco_put_history (commandline -b)' 

zoxide init fish | source

alias cd='zoxide'
