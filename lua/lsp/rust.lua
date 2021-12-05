-- local on_attach = function(client)
--   require'completion'.on_attach(client)
-- end
local M = {}
function M.setup()
    require("lspconfig").rust_analyzer.setup({
        cmd = { DATA .. "/lsp_servers/rust/rust-analyzer" },
        -- cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        on_attach = require("lsp").common_on_attach,
        -- on_attach = on_attach,
        -- root_dir = root_pattern("Cargo.toml", "rust-project.json"),
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                cargo = {
                    loadOutDirsFromCheck = true,
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    })
end

return M
