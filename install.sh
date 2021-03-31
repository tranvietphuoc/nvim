#!/bin/bash

set -o errexit

installdependencies() {
    brew install lua
    brew install node
    brew install yarn
    brew install ctags

    # install pynvim
    pip3 install pynvim

    # install ripgrep
    brew install ripgrep

    # install fzf
    brew install fzf

}

installlsp() {
    npm install -g pyright vscode-css-languageserver-bin vscode-html-languageserver-bin typescript typescript-language-server graphql-language-service-cli graphql-language-service-cli
    npm install -g dockerfile-language-server-nodejs vscode-json-languageserver


}

if [-d "$HOME/.config/nvim"];
then
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/
    cd $HOME/.config/nvim/
    installdependencies
    installlsp
    cp ./dependencies/.ctags $HOME  # move ctags config to $HOME
    rm -r ./assets/
else
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/
    cd $HOME/.config/nvim/
    installdependencies
    installlsp
    cp ./dependencies/.ctags $HOME  # move ctags config to $HOME
    rm -r ./assets/

fi
