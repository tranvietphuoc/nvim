-- local on_attach = function(client)
--   require'completion'.on_attach(client)
-- end
local M = {}

local root_pattern = require("lspconfig/util").root_pattern

function M.setup()
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
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                -- assist = {
                --     importGranularity = "module",
                --     importPrefix = "self",
                -- },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true,
                },
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    })
end

return M
