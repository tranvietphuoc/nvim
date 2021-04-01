require'lspconfig'.rust_analyzer.setup{
    cmd = { DATA .. "/lspinstall/rust/rust-analyzer" },
	-- cmd = { "rust-analyzer" },
	-- filetypes = { "rust" },
    on_attach = require'lsp'.common_on_attach,
	-- root_dir = root_pattern("Cargo.toml", "rust-project.json")
	-- settings = {
      -- ["rust-analyzer"] = {}
    -- },

}
