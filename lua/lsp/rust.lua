-- local on_attach = function(client)
--   require'completion'.on_attach(client)
-- end
local M = {}

local root_pattern = require("lspconfig/util").root_pattern

function M.setup()
    -- lsp
    require("lspconfig").rust_analyzer.setup({

        cmd = { DATA .. "/mason/bin/rust-analyzer" },
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
                inlayHints = {
                    bindingModeHints = {
                        enable = true,
                    },
                },

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

    --[[ local rt = require("rust-tools")

    local opts = {
        tools = {
            executor = require("rust-tools/executors").termopen,
            on_initialized = nil,
            reload_workspace_from_cargo_toml = true,

            inlay_hints = {
                auto = false,
                only_current_line = false,
                show_parameter_hints = true,
                parameter_hints_prefix = "<- ",
                max_len_align = false,
                other_hints_prefix = " ",
                highlight = "Comment",
                right_align_padding = 7,
                right_align = false,
            },

        },
    }

    rt.setup(opts)
    rt.inlay_hints.enable() ]]
end

return M
