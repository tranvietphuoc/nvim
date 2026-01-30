-- config format on save for rust
local function format_on_save(client, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

local function rust_on_attach(client, bufnr)
    require("lsp").common_on_attach(client, bufnr)
    -- format_on_save(client, bufnr)
end

local function setup()
    -- lsp
    vim.lsp.config("rust_analyzer", {
        cmd = { DATA .. "/mason/bin/rust-analyzer" },
        filetypes = { "rust" },
        on_attach = rust_on_attach, --require("lsp").common_on_attach,
        capabilities = require("lsp").capabilities(),
        root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml", "rust-project.json" }, { upward = true })[1]),
        settings = {
            ["rust-analyzer"] = {
                files = {
                    excludeDirs = { "target" },
                },

                inlayHints = {
                    bindingModeHints = {
                        enable = false,
                    },
                    chainingHints = {
                        enable = true,
                    },
                    closingBraceHints = {
                        enable = true,
                        minLines = 25,
                    },
                    closureReturnTypeHints = {
                        enable = "never",
                    },
                    lifetimeElisionHints = {
                        enable = "never",
                        useParameterNames = false,
                    },
                    maxLength = 25,
                    parameterHints = {
                        enable = true,
                    },
                    reborrowHints = {
                        enable = "never",
                    },
                    renderColons = true,
                    typeHints = {
                        enable = true,
                        hideClosureInitialization = false,
                        hideNamedConstructor = false,
                    },
                },
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
    vim.lsp.enable("rust_analyzer")
end

return {
    setup = setup,
}
