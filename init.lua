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
vim.cmd('source ~/.config/nvim/vimscript/compe.vim')

-- plugins
require('_treesitter')
require('_barbar')
require('_telescope')
require('_fugitive')
require('_signify')
require('_nvimtree')
-- require('_galaxyline')
require('_tagbar')
require('_floatterm')
require('_emmet')
require('_go')
require('_rs')
require('_commentary')
require('_markdown')
require('_easyalign')
require('_bracey')
require('_lazygit')
require('_colorizer')
require('_ts-rainbow')
require('_which-key')
require('autopairs')
require('_dashboard')
require('_goyo')
require('_doge')
require('_indent')

-- database
require('_dbcompletion')
vim.cmd('source ~/.config/nvim/vimscript/db.vim')

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

