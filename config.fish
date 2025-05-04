set -x fish_greeting ''
set -x GPG_TTY (tty)

bind \ca 'printf "\n"; ll; commandline -f repaint'
bind \cr 'peco_execute_history (commandline -b)' 

set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH $HOME/dev/depot_tools

zoxide init fish | source

if status is-interactive
    source ~/.asdf/asdf.fish

    fish_add_path ~/.cargo/bin
end