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

if [-d "$HOME/.config/nvim"];
then
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/
    cd $HOME/.config/nvim/
    installdependencies
    cp ./dependencies/.ctags $HOME  # move ctags config to $HOME
    rm -r ./assets/
else
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/
    cd $HOME/.config/nvim/
    installdependencies
    cp ./dependencies/.ctags $HOME  # move ctags config to $HOME
    rm -r ./assets/

fi
