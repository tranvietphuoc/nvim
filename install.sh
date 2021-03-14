#!/bin/bash

if [-d "$HOME/.config/nvim"]
then
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    mkdir -p $HOME/.config/nvim
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/nvim
else
    mkdir -p $HOME/.config/nvim
    git clone https://github.com/tranvietphuoc/nvim.git $HOME/.config/nvim
if
