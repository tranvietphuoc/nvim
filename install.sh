#!/bin/bash

set -o errexit

install_dependencies() {
    brew install lua
    brew install node
    brew install yarn
    brew install ctags

    # clangd
    brew install llvm

    # install pynvim
    pip3 install pynvim

    # install ripgrep
    brew install ripgrep

    # install fzf
    brew install fzf

    #install efm-langserver
    brew install efm-langserver

}

install_lsp_with_node() {
    npm install -g pyright vscode-css-languageserver-bin vscode-html-languageserver-bin
    npm install -g typescript typescript-language-server graphql-language-service-cli
    npm install -g dockerfile-language-server-nodejs vscode-json-languageserver 
    npm install -g vls yaml-language-server bash-language-server 
}

install_lsp_with_pip() {
    pip3 install cmake-language-server
}

if [-d "$HOME/.config/nvim"]; then
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/
    cd $HOME/.config/nvim/
    
else
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/
    cd $HOME/.config/nvim/
fi

# install dependencies
install_dependencies
install_lsp_with_node
install_lsp_with_pip
mkdir -p $HOME/efm-langserver/
cp ./dependencies/.ctags $HOME  # move ctags config to $HOME
cp ./dependencies/efm-langserver/config.yaml $HOME/efm-langserver/
