brew update

# Fish (Restart after)
brew install fish \
  && echo /usr/local/bin/fish >> /etc/shells \
  && chsh -s /usr/local/bin/fish \
  && exec $SHELL -l

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
  
# Install fisher plugins
./setup_common_fisher.sh

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

# Common
./setup_common_misc.sh