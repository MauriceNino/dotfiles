# Common
./setup_common_misc.sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  && brew update

# Fish (Restart after)
brew install fish \
  && echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells \
  && chsh -s /opt/homebrew/bin/fish \
  && exec $SHELL -l \
  && ln -sf ~/dev/dotfiles/common/config.fish ~/.config/fish/config.fish

# Install fisher plugins
./../common/setup_fisher.sh

# Tools
brew install eza zoxide peco mise
brew install --cask 1password firefox marta alt-tab obsidian visual-studio-code karabiner-elements

zoxide init fish | source

# Install mise plugins
./../common/setup_mise.sh