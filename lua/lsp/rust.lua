local M = {}

local root_pattern = require("lspconfig/util").root_pattern

-- local rt = require("rust-tools")
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
function M.setup()
    -- lsp
    require("lspconfig")["rust_analyzer"].setup({

        cmd = { DATA .. "/mason/bin/rust-analyzer" },
        filetypes = { "rust" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
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
