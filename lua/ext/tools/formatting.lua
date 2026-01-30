return {
    setup = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
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
                cs = { "csharpier" },
                markdown = { "prettier" },
            },
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
            format_after_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>F", function()
            require("conform").format({
                lsp_callback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
