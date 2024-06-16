local M = {}

function M.setup()
    local async_formatting = function(bufnr)
        bufnr = bufnr or vim.api.nvim_get_current_buf()

        vim.lsp.buf_request(
            bufnr,
            "textDocument/formatting",
            vim.lsp.util.make_formatting_params({}),
            function(err, res, ctx)
                if err then
                    local err_msg = type(err) == "string" and err or err.message
                    vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                    return
                end

                if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                    return
                end

                if res then
                    local client = vim.lsp.get_client_by_id(ctx.client_id)
                    vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-8")
                    vim.api.nvim_buf_call(bufnr, function()
                        vim.cmd("silent noautocmd update")
                    end)
                end
            end
        )
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local null_ls = require("null-ls")

    -- code action sources
    local code_actions = null_ls.builtins.code_actions

    -- diagnostic sources
    local diagnostics = null_ls.builtins.diagnostics

    -- formatting sources
    local formatting = null_ls.builtins.formatting

    -- hover
    -- local hover = null_ls.builtins.hover

    -- completion sources
    -- local completion = null_ls.builtins.completion

    null_ls.setup({
        debug = false,
        sources = {
            formatting.trim_newlines.with({
                disabled_filetypes = { "rust" },
            }),
            formatting.trim_whitespace.with({
                disabled_filetypes = { "rust" },
            }),
            formatting.stylua.with({
                filetypes = { "lua" },
                extra_args = { "--config-path", vim.fn.expand("~/.stylua.toml") },
            }),
            diagnostics.eslint_d,
            code_actions.eslint_d,
            code_actions.gitsigns,
            -- completion.luasnip,
            formatting.prettier.with({
                filetypes = {
                    "typescript",
                    "javascript",
                    "javascriptreact",
                    "typescriptreact",
                    "html",
                    "css",
                    "htmldjango",
                },
                extra_args = function(params)
                    return params.options and params.options.tabSize and { "--tab-width", params.options.tabSize }
                end,
            }),

            formatting.rustfmt.with({
                filetypes = { "rust" },
                extra_args = { "--emit=stdout" },
            }),
            formatting.gofumpt,
            formatting.goimports,

            formatting.black.with({
                filetypes = { "python" },
                args = { "--quiet", "-" },
                extra_args = { "--line-length", "79" },
            }),

            formatting.clang_format.with({
                filetypes = { "c", "cpp", "h", "hpp" },
                extra_args = {
                    "-style=file:" .. vim.fn.expand("~/.clang-format")
                }
            }),
            -- formatting.djhtml.with({
            -- filetypes = { "html" },
            -- }),
            formatting.pg_format.with({
                filetypes = { "sql" },
            }),

            formatting.scalafmt,

            -- formatting.isort,
            diagnostics.cpplint,
            diagnostics.mypy.with({
                methods = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            }),
            diagnostics.ruff.with({
                extra_args = { "-n", "-e", "--stdin-filename", "$FILENAME", "-" },
            }),
            diagnostics.flake8,
            formatting.google_java_format.with({}),          -- java run `brew install google-java-format` first
            diagnostics.checkstyle.with({                    -- run `brew install checkstyle` first
                extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
            }),

            formatting.csharpier,
        },
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePost", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        async_formatting(bufnr)
                    end,
                })
            end
        end,
    })
end

return M
