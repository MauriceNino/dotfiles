set fish_greeting ''

bind \ca 'll'
bind \cr 'peco_put_history (commandline -b)' 

zoxide init fish | source

alias cd='zoxide'
