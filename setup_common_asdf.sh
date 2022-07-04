#!/bin/fish
# Install asdf + plugins
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0 \
  && ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions \
  && asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git \
    && asdf install nodejs latest \
    && asdf install nodejs latest:16 \
    && asdf global nodejs latest:16 \
    && npm i -g yarn \
  && asdf plugin-add maven https://github.com/halcyon/asdf-maven \
    && asdf install maven latest \
    && asdf install maven latest:3.6 \
    && asdf global maven latest:3.6 \
  && asdf plugin-add java https://github.com/halcyon/asdf-java.git \
    && asdf install java latest:zulu-18 \
    && asdf install java latest:zulu-11 \
    && asdf install java latest:zulu-8 \
    && asdf global java latest:zulu-8