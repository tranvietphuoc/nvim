local M = {}

function M.setup()
    local conform = require("conform")

    conform.setup({
        formatters_by_ft = {
            ["*"] = { "codespell" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            lua = { "stylua" },
            python = { "ruff_format" },
            rust = { "rustfmt" },
            go = { "gofmt", "goimports" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            markdown = { "prettier" },
        },
        format_on_save = {
            lsp_format = "fallback",
            async = false,
            timeout_ms = 500,
        },

        vim.keymap.set({ "n", "v" }, "<leader>F", function()
            conform.format({
                lsp_callback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" }),
    })
end

return M
