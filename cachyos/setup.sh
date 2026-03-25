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
  chromium \
  docker \
  docker-compose \
  eza \
  fastfetch \
  flatpak \
  flatseal \
  firefox \
  ghostty \
  gpu-screen-recorder-gtk \
  gpu-screen-recorder-ui \
  librewolf \
  mangohud \
  mise \
  moonlight-qt \
  obsidian \
  steam \
  sunshine \
  vesktop \
  visual-studio-code-bin \
  zoxide

# Tools setup
ln -sf ~/dev/dotfiles/common/ghostty/ ~/.config/ghostty
ln -sf ~/dev/dotfiles/common/MangoHud.conf ~/.config/MangoHud/MangoHud.conf
ln -sf ~/dev/dotfiles/common/MangoHud.conf ~/.var/app/com.valvesoftware.Steam/config/MangoHud/MangoHud.conf

# Common
./../common/setup_misc.sh

# Install mise plugins + default tool versions
./../common/setup_mise.sh