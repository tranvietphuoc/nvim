local M = {}

local utils = require("lspconfig.util")
local lspconfig = require("lspconfig")

function M.setup()
    -- lsp
    lspconfig.rust_analyzer.setup {
        cmd = { DATA .. "/mason/bin/rust-analyzer" },
        filetypes = { "rust" },
        on_attach = require("lsp").common_on_attach,
        capabilities = require("lsp").capabilities(),
        root_dir = utils.root_pattern("Cargo.toml", "rust-project.json"),
        settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },

                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true,
                    attributes = {
                        enable = true,
                    },
                },
                checkOnSave = {
                    enable = true,
                    command = "clippy",
                },
            },
        },
    }
end

return M
