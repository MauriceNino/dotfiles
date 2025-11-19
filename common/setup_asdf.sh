#!/bin/fish
# Install asdf + plugins
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git \
  && asdf install nodejs latest \
  && asdf set -u nodejs latest \
&& asdf plugin add maven https://github.com/halcyon/asdf-maven \
  && asdf install maven latest \
  && asdf set -u maven latest \
&& asdf plugin add java https://github.com/halcyon/asdf-java.git \
  && asdf install java zulu-25.30.17 \
  && asdf set -u java zulu-25.30.17
  