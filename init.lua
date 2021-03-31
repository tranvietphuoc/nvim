require('plugin')
require('config')
require('colorscheme')
require('keymapping')
require('providers')
require('_treesitter')
require('_lightline')
require('_NERDtree')
require('_telescope')
require('_rs')
require('_fugitive')
require('_signify')
require('_startify')
require('_tagbar')
require('_floatterm')
require('_emmet')
require('_js')
require('_py')
require('_go')
require('_csv')
require('_commentary')
require('_markdown')
require('_easyalign')
require('_bracey')
require('_lazygit')
require('global_config')
require('_colorizer')
require('autopairs')
require('_ts-rainbow')
require('_which-key')

-- lsp
vim.cmd('luafile ~/.config/nvim/lua/settings.lua')
require('lsp')
require('lsp.compe')
-- autoimport
vim.cmd('source ~/.config/nvim/vimscript/config.vim')
require('lsp.bash-lsp')
require('lsp.clangd-lsp')
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

