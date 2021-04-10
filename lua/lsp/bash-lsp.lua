require'lspconfig'.bashls.setup{
  cmd = {DATA .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
  on_attach = require'lsp'.common_on_attach
}
