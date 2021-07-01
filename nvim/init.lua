
-- general
require('plugins')
require('global-config')
require('user-config')
require('config')
require('providers')
require('keymapping')
require('colorscheme')

-- plugins
require('n-galaxyline')
require('n-barbar')
require('n-dashboard')
require('n-telescope')
require('n-treesitter')
require('n-tagbar')
require('n-bracey')
require('n-goyo')
require('n-doge')
require('n-indent')
-- require('n-rnvimr')
require('n-nvimtree')
require('n-colorizer')
require('n-ts-rainbow')
require('n-which-keys')
require('n-autopairs')
require('n-markdown')
require('n-easyalign')
require('n-floatterm')
require('n-emmet')
require('n-go')
require('n-rs')
require('n-commentary')
require('n-fugitive')
require('n-signify')
require('n-lazygit')

-- database
require('n-dbcompletion')

-- lsp config
require('lsp')
require('lsp.compe')

-- lsp server
require('lsp.bash-lsp')
require('lsp.clangd-lsp')
require('lsp.cmake-lsp')
require('lsp.css-lsp')
require('lsp.docker-lsp')
require('lsp.go-lsp')
require('lsp.html-lsp')
require('lsp.json-lsp')
require('lsp.python-lsp')
require('lsp.rust-lsp')
require('lsp.tsserver-lsp')
require('lsp.vim-lsp')
require('lsp.vue-lsp')
require('lsp.yaml-lsp')
require('lsp.lua-lsp')

-- linter and formmater
require('lsp.efm-lsp')

