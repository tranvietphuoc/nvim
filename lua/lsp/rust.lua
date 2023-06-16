local M = {}

local root_pattern = require("lspconfig/util").root_pattern
local lspconfig = require("lspconfig")
-- local rt = require("rust-tools")
local lsp_flags = {
    debounce_text_changes = 150,
}

--[[ local opts = {
    server = {
        standalone = true,
        on_attach = require("lsp").common_on_attach,
    },
    settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
                command = "clippy",
            },
        },
    },
    tools = {
        -- rust-tools options

        -- how to execute terminal commands
        -- options right now: termopen / quickfix
        executor = require("rust-tools.executors").termopen,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,

        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        runnables = {
            use_telescope = true,
        },

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },
    },
} ]]

function M.setup()
    -- rt.setup(opts)
    -- lsp
    lspconfig["rust_analyzer"].setup({
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
