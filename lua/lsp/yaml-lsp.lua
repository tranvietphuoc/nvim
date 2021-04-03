require'lspconfig'.yamlls.setup{
	cmd = {DATA .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
}
