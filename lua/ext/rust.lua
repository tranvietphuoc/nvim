local M = {}

function M.setup()
    -- rust.vim
    vim.g.rust_clip_command = "pbcopy"
    vim.g.rustfmt_autosave = 1

    -- rust-tools
    local opts = {
        tools = {
            autoSetHints = true,
            hover_with_actions = true,
            executor = require("rust-tools/executors").quickfix,
            inlay_hints = {
                show_parameter_hints = true,
                only_current_line_autocmd = "CursorHold",
                parameter_hints_prefix = "<- ",
                other_hints_prefix = "=> ",
            },
        },
        server = {
            -- on_attach is a callback called when the language server attachs to the buffer
            -- on_attach = on_attach,
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
        },
    }
    require("rust-tools").setup(opts)
    require("rust-tools.inlay_hints").set_inlay_hints()
end

return M
