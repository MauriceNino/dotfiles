/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  && brew update

# Fish (Restart after)
brew install fish \
  && echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells \
  && chsh -s /opt/homebrew/bin/fish \
  && exec $SHELL -l \
  && ln -s ~/dev/dotfiles/config.fish ~/.config/fish/config.fish

set -Ux fish_user_paths /opt/homebrew/bin $fish_user_paths
set -Ux fish_user_paths ~/Library/Android/sdk/emulator $fish_user_paths
set -Ux fish_user_paths ~/Library/Android/sdk/platform-tools $fish_user_paths
set -Ux ANDROID_SDK_ROOT ~/Library/Android/sdk

# Tools
brew install exa
brew tap clementtsang/bottom \
  && brew install bottom
brew install zoxide \
  && brew install fzf \
  && zoxide init fish | source
brew install bat	
brew install broot
brew install peco
brew install watchman
brew install gpg2
brew install svn
brew install pinetry

# M1 error with cocoapods
sudo gem uninstall cocoapods \
  && brew install cocoapods
  
# Install fisher plugins
./setup_common_fisher.sh

# Version manager
./setup_common_asdf.sh

# Common
./setup_common_misc.sh