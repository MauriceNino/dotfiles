/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  && brew update

# Basic tools
brew install \
  git \
  git-lfs \

# Fish (Restart after)
brew install fish \
  && echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells \
  && chsh -s /opt/homebrew/bin/fish \
  && exec $SHELL -l \
  && ln -sf ~/dev/dotfiles/macos/config.fish ~/.config/fish/config.fish

# Remove "last login" message
touch ~/.hushlogin

# Install fisher plugins
./../common/setup_fisher.sh

# Tools
brew install \
  eza \
  fastfetch \
  mise \
  peco \
  zoxide
brew install --cask \
  1password \
  alt-tab \
  firefox \
  ghostty \
  karabiner-elements \
  marta \
  obsidian \
  orbstack \
  visual-studio-code

# Tools setup
ln -sf ~/dev/dotfiles/macos/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/dev/dotfiles/macos/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/dev/dotfiles/common/ghostty ~/.config/ghostty

# Common
./setup_common_misc.sh

# Install mise plugins + default tool versions
./../common/setup_mise.sh