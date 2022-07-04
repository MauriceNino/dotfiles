set -x fish_greeting ''
set -x GPG_TTY (tty)

bind \ca 'printf "\n"; ll; commandline -f repaint'
bind \cr 'peco_execute_history (commandline -b)' 

zoxide init fish | source

if status is-interactive
    source ~/.asdf/asdf.fish
end