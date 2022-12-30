local M = {}

local root_pattern = require("lspconfig/util").root_pattern

-- local rt = require("rust-tools")

function M.setup()
    -- lsp
    require("lspconfig").rust_analyzer.setup({

        cmd = { DATA .. "/mason/bin/rust-analyzer" },
        filetypes = { "rust" },
        on_attach = require("lsp").common_on_attach,
        root_dir = root_pattern("Cargo.toml"),
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
    })
end

return M
