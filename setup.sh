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
if [ $isMac = true ]; then
  brew update

  # Tools
  brew install git
  brew install fish \
    && echo /usr/local/bin/fish >> /etc/shells \
    && chsh -s /usr/local/bin/fish \
    && exec $SHELL -l
  brew install exa
  brew tap clementtsang/bottom \
    && brew install bottom
  brew install zoxide \
    && brew install fzf \
    && zoxide init fish | source
  brew install bat	
  brew install broot

  # Java
  brew install openjdk@8 \
    && brew install openjdk@11 \
    && brew install jenv \
    && source (jenv init - | psub) \
    && sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk \
    && sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk \
    && jenv add /Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home \
    && jenv add /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home \
    && brew install maven
else
  echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
  wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -
  apt update

  apt install git
  apt install fish \
    && usermod -s /usr/bin/fish $(whoami) \
    && exec $SHELL -l
  apt install exa
  curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.3/bottom_0.6.3_amd64.deb \
    && dpkg -i bottom_0.6.3_amd64.deb \
    && rm bottom_0.6.3_amd64.deb
  apt install zoxide \
    && apt-get install fzf \
    && zoxide init fish | source
  apt install bat \
    && sudo ln -s /usr/bin/batcat /usr/bin/bat
  apt install broot \
    && broot --install

  # Java
  apt install openjdk-8-jdk \
    && apt install openjdk-11-jdk \
    && git clone https://github.com/jenv/jenv.git ~/.jenv \
    && source (jenv init - | psub) \
    && jenv add /usr/lib/jvm/java-1.8.0-openjdk-amd64 \
    && jenv add /usr/lib/jvm/java-11-openjdk-amd64 \
    && apt install maven
fi

# Install fisher plugins
curl -sL https://git.io/fisher | source

fisher install jorgebucaran/fisher
fisher install gazorby/fish-exa
fisher install ponko2/fish-plugin-peco
fisher install FabioAntunes/fish-nvm
fisher install edc/bass
