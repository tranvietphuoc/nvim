require'lspconfig'.gopls.setup{
  cmd = {DATA .. "/lspinstall/go/gopls"},
  on_attach = require'lsp'.common_on_attach
}
