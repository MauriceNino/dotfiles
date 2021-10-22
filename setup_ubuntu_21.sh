# Add repo for broot
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/azlux.list
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
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