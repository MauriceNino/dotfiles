# Basic tools
pacman -S --needed git base-devel yay
git clone https://github.com/pmarreck/pac ~/dev/pac

# Fish comes preinstalled, so just link config here
ln -sf ~/dev/dotfiles/cachyos/config.fish ~/.config/fish/config.fish

# Install fisher plugins
./../common/setup_fisher.sh

# Tools
yay -S --needed \
  1password \
  atuin \
  bottles \
  eza \
  fastfetch \
  firefox \
  ghostty \
  gpu-screen-recorder-gtk \
  gpu-screen-recorder-ui \
  mangohud \
  mise \
  moonlight-qt \
  obsidian \
  sunshine \
  vesktop \
  zoxide

# Tools setup
ln -sf ~/dev/dotfiles/common/ghostty/ ~/.config/ghostty

# Common
./setup_common_misc.sh

# Install mise plugins + default tool versions
./../common/setup_mise.sh