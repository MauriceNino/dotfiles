set -x fish_greeting ''

if status is-interactive
    bind ctrl-a 'printf "\n"; ll; commandline -f repaint'
    bind ctrl-r peco_select_history

    zoxide init fish | source
    fastfetch --config ~/dev/dotfiles/common/fastfetch_config.jsonc
end
