#!/bin/fish
# Install fisher + plugins
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source

fisher install jorgebucaran/fisher
fisher install gazorby/fish-exa
fisher install oh-my-fish/plugin-peco
fisher install decors/fish-colored-man