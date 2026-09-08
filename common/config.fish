function fish_greeting
    fastfetch --config ~/dev/dotfiles/common/fastfetch_config.jsonc
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# Replace ls with eza
alias ls='eza -a --color=always --group-directories-first --icons auto' # preferred listing
alias ll='eza -al --color=always --group-directories-first --icons auto'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons auto' # tree listing

alias gitgraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%C(dim white)- %an%n''            %C(white)%s%C(reset) %C(reset)'"

# Tide settings
set -U tide_git_truncation_length 50

# Add path so agents can find binaries installed by mise
fish_add_path ~/.local/share/mise/shims

if status is-interactive
    bind ctrl-a 'printf "\n"; ll; commandline -f repaint'

    zoxide init fish | source
    mise activate fish | source
    atuin init fish | source
end

