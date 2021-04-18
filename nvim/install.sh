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

    # install fzf
    brew install fzf

    #install efm-langserver
    brew install efm-langserver

	# install lua
	brew install --HEAD luajit
	brew install luarocks

	# install formatters and linters
	pip3 install flake8 --no-cache-dir
	pip3 install yapf --no-cache-dir
	pip3 install black --no-cache-dir

	npm install -g prettier

	luarocks install --server=https://luarocks.org/dev luaformatter

    pip3 install ranger-fm

}

install_lsp() {
	
	npm install -g pyright vscode-css-languageserver-bin vscode-html-languageserver-bin
    npm install -g typescript typescript-language-server graphql-language-service-cli
    npm install -g dockerfile-language-server-nodejs vscode-json-languageserver 
    npm install -g vls yaml-language-server bash-language-server 

	pip3 install cmake-language-server
}

if [-d "$HOME/.config/nvim"]; then
    mv $HOME/.config/nvim $HOME/.config/nvim.old

fi

mkdir -p $HOME/Downloads/dotfiles/
git clone https://github.com/tranvietphuoc/dotfiles.git $HOME/Downloads/dotfiles/
mv -v $HOME/Downloads/dotfiles/nvim $HOME/.config/
cd $HOME/.config/nvim/

# install dependencies
echo "Installing dependencies..."

install_dependencies
install_lsp

echo "Copying important files..."

mkdir -p $HOME/efm-langserver/
cp ./dependencies/.ctags $HOME  # move ctags config to $HOME
cp ./dependencies/efm-langserver/config.yaml $HOME/efm-langserver/

echo "Done"
