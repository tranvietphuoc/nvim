#!/bin/bash

if [-d "$HOME/.config/nvim"];
then
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/
    cd $HOME/.config/nvim/
    rm -r ./assets/
else
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/
    cd $HOME/.config/nvim/
    rm -r ./assets/
fi
