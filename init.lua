-- if vim.fn.exists('g:vscode') then
--   --
-- else
  
-- end
-- general
require('plugins')
require('keymapping')
require('providers')
require('global-config')
require('user-config')
require('config')
require('colorscheme')

-- lsp config
require('lsp')
require('lsp.compe')

  -- plugins
require('n-treesitter')
require('n-barbar')
require('n-telescope')
require('n-fugitive')
require('n-signify')
require('n-nvimtree')
-- require('nvim-galaxyline')
require('n-tagbar')
require('n-floatterm')
require('n-emmet')
require('n-go')
require('n-rs')
require('n-commentary')
require('n-markdown')
require('n-easyalign')
require('n-bracey')
require('n-lazygit')
require('n-colorizer')
require('n-ts-rainbow')
require('n-which-keys')
require('n-autopairs')
require('n-dashboard')
require('n-goyo')
require('n-doge')
require('n-indent')

-- database
require('n-dbcompletion')

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
