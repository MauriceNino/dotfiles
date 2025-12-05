function fish_greeting
    fastfetch --config ~/dev/dotfiles/common/fastfetch_config.jsonc
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# Replace ls with eza
alias ls='eza -a --color=always --group-directories-first --icons' # preferred listing
alias ll='eza -al --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing

if status is-interactive
    bind ctrl-a 'printf "\n"; ll; commandline -f repaint'

    zoxide init fish | source
    mise activate fish | source
    atuin init fish | source

    tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time=No --lean_prompt_height='One line' --prompt_spacing=Compact --icons='Few icons' --transient=No
end
