-- npm install -g vim-language-server
local M = {}

function M.setup()
  require'lspconfig'.vimls.setup {
    cmd = {DATA .. "/lspinstall/vim/node_modules/.bin/vim-language-server", "--stdio"},
    on_attach = require'lsp'.common_on_attach
  }
end

return M
