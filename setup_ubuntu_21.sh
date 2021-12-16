# Add repo for broot
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/azlux.list \
  && sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg

# Add repo for touchegg
sudo add-apt-repository ppa:touchegg/stable

sudo apt update

# Fish (Restart after)
sudo apt install fish \
  && sudo usermod -s /usr/bin/fish $(whoami) \
  && exec $SHELL -l

# Tools
sudo apt install exa
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb \
  && sudo dpkg -i bottom_0.6.3_amd64.deb \
  && rm bottom_0.6.3_amd64.deb
sudo apt install zoxide \
  && sudo apt-get install fzf \
  && zoxide init fish | source
sudo apt install bat \
  && sudo ln -s /usr/bin/batcat /usr/bin/bat
sudo apt install broot \
  && broot --install
sudo apt install peco
  
# Install fisher plugins
./setup_common_fisher.sh

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  && nvm install 17

# Java
sudo apt install openjdk-8-jdk \
  && sudo apt install openjdk-11-jdk \
  && git clone https://github.com/jenv/jenv.git ~/.jenv \
  && source (jenv init - | psub) \
  && jenv add /usr/lib/jvm/java-1.8.0-openjdk-amd64 \
  && jenv add /usr/lib/jvm/java-11-openjdk-amd64 \
  && sudo apt install maven
  
# Common
./setup_common_misc.sh

# Misc
sudo apt install nautilus-admin

# Wallpaper, Theme & Icons
(cd ~/dev && git clone https://github.com/vinceliuice/Orchis-theme.git && cd Orchis-theme && ./install.sh)
(cd ~/dev && git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git && cd Tela-circle-icon-theme && ./install.sh)
gsettings set org.gnome.desktop.background picture-uri file://(pwd)/wallpaper.jpg

# Gestures
sudo apt install touchegg # GUI: https://flathub.org/apps/details/com.github.joseexposito.touche

# Gnome Extensions
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
sudo apt install chrome-gnome-shell

gdbus call --session \
  --dest org.gnome.Shell.Extensions \
  --object-path /org/gnome/Shell/Extensions \
  --method org.gnome.Shell.Extensions.InstallRemoteExtension "animation-tweaks@Selenium-H" # https://extensions.gnome.org/extension/1680/animation-tweaks/
gdbus call --session \
  --dest org.gnome.Shell.Extensions \
  --object-path /org/gnome/Shell/Extensions \
  --method org.gnome.Shell.Extensions.InstallRemoteExtension "arcmenu@arcmenu.com" # https://extensions.gnome.org/extension/1228/arc-menu/
gdbus call --session \
  --dest org.gnome.Shell.Extensions \
  --object-path /org/gnome/Shell/Extensions \
  --method org.gnome.Shell.Extensions.InstallRemoteExtension "blur-my-shell@aunetx" # https://extensions.gnome.org/extension/3193/blur-my-shell/
gdbus call --session \
  --dest org.gnome.Shell.Extensions \
  --object-path /org/gnome/Shell/Extensions \
  --method org.gnome.Shell.Extensions.InstallRemoteExtension "dash-to-panel@jderose9.github.com" # https://extensions.gnome.org/extension/1160/dash-to-panel/
gdbus call --session \
  --dest org.gnome.Shell.Extensions \
  --object-path /org/gnome/Shell/Extensions \
  --method org.gnome.Shell.Extensions.InstallRemoteExtension "x11gestures@joseexposito.github.io" # https://extensions.gnome.org/extension/4033/x11-gestures/

# Expose settings in gsettings
find ~/.local/share/gnome-shell/extensions/ -type f | grep -i gschema.xml | xargs -i cp {} ~/.local/share/glib-2.0/schemas/
glib-compile-schemas ~/.local/share/glib-2.0/schemas/

# Load extension settings
# dump created using: gsettings list-schemas | grep extension | xargs -i gsettings list-recursively {} > ~/dev/dotfiles/gsettings_dump
# note: to paste this, you need to open a /bin/bash shell and paste the following:
while IFS= read -r line; do
  schema="$(echo "$line" | cut -d' ' -f1)"
  extension="$(echo "$line" | cut -d' ' -f2)"
  value="$(echo "$line" | cut -d' ' -f3-)"

  echo "parsing line: $line"
  echo "setting $schema $extension to $value"
  gsettings set $schema $extension "$value"
  echo "---------------------------------------------------------------------------"
done < ~/dev/dotfiles/gsettings_dump