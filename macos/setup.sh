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

# Tools
brew install eza
brew install zoxide \
  && zoxide init fish | source
brew install peco
  
# Install fisher plugins
./../common/setup_fisher.sh

# Version manager
./../common/setup_asdf.sh