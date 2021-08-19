set -x fish_greeting ''

bind \ca 'printf "\n"; ll; commandline -f repaint'
bind \cr 'peco_execute_history (commandline -b)' 

zoxide init fish | source

if status is-interactive
    source (jenv init - | psub)
end