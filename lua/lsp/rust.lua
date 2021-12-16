-- local on_attach = function(client)
--   require'completion'.on_attach(client)
-- end
local M = {}

local root_pattern = require("lspconfig/util").root_pattern

function M.setup()
    -- rust.vim
    vim.g.rust_clip_command = "pbcopy"
    vim.g.rustfmt_autosave = 1
    -- lsp
    require("lspconfig").rust_analyzer.setup({

        cmd = { DATA .. "/lsp_servers/rust/rust-analyzer" },
        -- cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        on_attach = require("lsp").common_on_attach,
        -- on_attach = on_attach,
        root_dir = root_pattern("Cargo.toml", "rust-project.json"),
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "self",
                },
                cargo = {
                    allFeatures = true,
                },
                procMacro = {
                    enable = true,
                },
                debug = {
                    engine = "vadimcn.vscode-lldb",
                },
            },
        },
    })
end

return M
