local M = {}

function M.setup()
    -- rust.vim
    vim.g.rust_clip_command = "pbcopy"
    vim.g.rustfmt_autosave = 1

    -- rust-tools
    local rt = require("rust-tools")

    local opts = {
        tools = {
            executor = require("rust-tools/executors").termopen,
            on_initialized = nil,
            reload_workspace_from_cargo_toml = true,
            only_current_line = true,
            show_parameter_hints = true,

            inlay_hints = {
                auto = true,
                only_current_line = false,
                show_parameter_hints = true,
                parameter_hints_prefix = "",
                other_hints_prefix = "",
                max_len_align = false,
                max_len_align_padding = 1,
                right_align = false,
                highlight = "Comment",
            },
            hover_actions = {
                -- the border that is used for the hover window
                -- see vim.api.nvim_open_win()
                border = {
                    { "╭", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╮", "FloatBorder" },
                    { "│", "FloatBorder" },
                    { "╯", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╰", "FloatBorder" },
                    { "│", "FloatBorder" },
                },

                -- whether the hover action window gets automatically focused
                -- default: false
                auto_focus = false,
            },
        },
        server = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
            -- on_attach is a callback called when the language server attachs to the buffer
            -- on_attach = on_attach,
            standalone = true,
        },
        dap = {
            adapter = {
                type = "executable",
                command = "lldb-vscode",
                name = "rt_lldb",
            },
        },
    }

    rt.setup(opts)
    rt.inlay_hints.set()
    rt.inlay_hints.enable()
end

return M
