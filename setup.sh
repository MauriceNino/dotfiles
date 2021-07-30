# Check OS
isMac=false
if [ "$(uname)" == "Darwin" ]; then
  echo "Running on Mac OS"
  isMac=true
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo "Running on Linux"
else
  echo "Running on $(uname -s). Exiting"
  exit 1
fi

# Install packages
if [ isMac == true ]; then
  
else
  echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
  wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -
  sudo apt update

  sudo apt install fish
  sudo apt install exa
  curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb \
    && sudo dpkg -i bottom_0.6.3_amd64.deb \
    && rm bottom_0.6.3_amd64.deb
  curl -sS https://webinstall.dev/zoxide | bash
  sudo apt-get install fzf
  sudo apt install bat \
    && mkdir -p ~/.local/bin \
    && ln -s /usr/bin/batcat ~/.local/bin/bat
  curl -sL https://git.io/fisher | source \
    && fisher install jorgebucaran/fisher
  sudo apt install broot \
    && broot --install

  fisher install gazorby/fish-exa
  fisher install ponko2/fish-plugin-peco
fi

# Write fish config
echo "set fish_greeting ''

bind \ca 'll'
bind \cr 'peco_put_history (commandline -b)' 

zoxide init fish | source

alias cd='zoxide'
">> ~/.config/fish/config.fish
