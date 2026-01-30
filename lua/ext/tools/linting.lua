return {
    setup = function()
        local lint = require("lint")

        lint.linters.mypy = {
            stdin = true,
        }

        lint.linter_by_ft = {
            ["*"] = { "codespell" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            htmldjango = { "djlint" },
            javascriptreact = { "eslint_d" },
            python = { "ruff", "mypy" }, -- python
            rust = { "clippy" },
            markdown = { "vale" },
            json = { "jsonlint" },
            lua = { "selene" },
            cs = { "csharpier" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            pattern = { "*.js", "*.py", "*.rs", "*.go", "*.ts", "*.cs", "*.java", "*.cpp", "*.h", "*.c" },
            group = lint_augroup,
            callback = function()
                require("lint").try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            require("lint").try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
