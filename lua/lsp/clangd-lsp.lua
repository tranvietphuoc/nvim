require'lspconfig'.clangd.setup{
	cmd = {DATA .. "/lspinstall/cpp/clangd/bin/clangd"},
	on_attach = require'lsp'.common_on_attach,
	handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = O.clangd.diagnostics.virtual_text,
      signs = O.clangd.diagnostics.signs,
      underline = O.clangd.diagnostics.underline,
      update_in_insert = true,
		})
	}
}
