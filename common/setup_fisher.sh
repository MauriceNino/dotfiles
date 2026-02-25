# Install fisher + plugins
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source

fisher install jorgebucaran/fisher
fisher install gazorby/fish-exa
fisher install oh-my-fish/plugin-peco
fisher install decors/fish-colored-man
fisher install IlanCosman/tide@v6

tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time=No --lean_prompt_height='One line' --prompt_spacing=Compact --icons='Few icons' --transient=No