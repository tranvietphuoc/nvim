require'lspconfig'.clangd.setup{
	cmd = {DATA .. "/lspinstall/cpp/clangd/bin/clangd"},
	on_attach = require'lsp'.common_on_attach,
}
