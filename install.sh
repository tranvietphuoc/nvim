#!/bin/sh

set -o errexit

install_dependencies() {

	# basic
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

    # install git-delta
    brew install git-delta

    # brew install bat
    brew install bat

    # install fzf
    brew install fzf

    # install lua
    brew install luajit --HEAD
    brew install luarocks --HEAD

    # install formatters and linters
    pip3 install flake8 --no-cache-dir
    pip3 install yapf --no-cache-dir
    pip3 install black --no-cache-dir
    npm install -g prettier
    luarocks install --server=https://luarocks.org/dev luaformatter

    pip3 install ranger-fm

    # install tree-sitter
    brew install tree-sitter

    # install gitui
    brew install gitui

    # jdtls
    brew install jdtls

}

install_lsp() {
	npm install -g pyright vscode-css-languageserver-bin vscode-html-languageserver-bin
    	npm install -g typescript typescript-language-server graphql-language-service-cli
    	npm install -g dockerfile-language-server-nodejs vscode-json-languageserver
    	npm install -g vls yaml-language-server bash-language-server

	pip3 install cmake-language-server
}

move_old_nvim() {
    echo "Your nvim config is already exists"
    echo "Moving nvim to nvim.old..."
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    # echo "Please go to '$HOME/.config/' and move nvim folder to nvim.old folder"
    exit
}

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && move_old_nvim

echo "Start installing..."
mkdir -p $HOME/dl/dotfiles/
git clone https://github.com/tranvietphuoc/nvim.git $HOME/dl/
mv -v $HOME/dl/nvim $HOME/.config/
cd $HOME/.config/nvim/

# install dependencies
echo "Installing dependencies..."

install_dependencies

echo "Installing languager server"
install_lsp

echo "Copying important files..."

cp ./dependencies/.ctags $HOME  # move ctags config to $HOME

echo "Done"
