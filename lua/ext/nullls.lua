local M = {}

-- define formatters


function M.setup()
    -- local black = function()
    --     return { exe = "black", args = { "-l 80", "-q", "-" }, stdin = true }
    -- end
    --
    -- local prettier = function()
    --     return {
    --         exe = "prettier",
    --         args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
    --         stdin = true,
    --     }
    -- end
    --
    -- local clangfmt = function()
    --     return {
    --         exe = "clang-format",
    --         args = { "-style=file", "--assume-filename", vim.api.nvim_buf_get_name(0) },
    --         stdin = true,
    --         cwd = vim.fn.expand("%:p:h"), -- run clang-format in cwd of the file
    --     }
    -- end
    --
    -- local rustfmt = function()
    --     return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
    -- end
    --
    -- -- local luafmt = function ()
    -- --   return { exe = "luafmt", args = {"--indent-count", 2, "--stdin"}, stdin = true }
    -- -- end
    --
    -- local gofmt = function()
    --     return {
    --         exe = "gofmt",
    --         args = { vim.api.nvim_buf_get_name(0) },
    --         stdin = true,
    --     }
    -- end
    --
    -- local stylua = function()
    --     return {
    --         exe = "stylua",
    --         args = {
    --             "--config-path " .. ".stylua.toml",
    --             "-",
    --         },
    --         stdin = true,
    --     }
    -- end
    --
    -- -- config
    -- require("formatter").setup({
    --     filetype = {
    --         python = { black },
    --         javascript = { prettier },
    --         typescript = { prettier },
    --         javascriptreact = { prettier },
    --         typescriptreact = { prettier },
    --         html = { prettier },
    --         htmldjango = { prettier },
    --         css = { prettier },
    --         rust = { rustfmt },
    --         cpp = { clangfmt },
    --         c = { clangfmt },
    --         cc = { clangfmt },
    --         h = { clangfmt },
    --         go = { gofmt },
    --         lua = { stylua },
    --     },
    -- })
    --
    local async_formatting = function (bufnr)
        bufnr = bufnr or vim.api.nvim_get_current_buf()

        vim.lsp.buf_request(
            bufnr,
            "textDocument/formatting",
            vim.lsp.util.make_formatting_params({}),
            function (err, res, ctx)
                if err then
                    local err_msg = type(err) == 'string' and err or err.message
                    vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                    return
                end

                if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                    return
                end

                if res then
                    local client = vim.lsp.get_client_by_id(ctx.client_id)
                    vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
                    vim.api.nvim_buf_call(bufnr, function ()
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

    -- hover sources
    -- local hover = null_ls.builtins.hover

    -- completion sources
    -- local completion = null_ls.builtins.completion



    null_ls.setup({
        debug = false,
        sources = {
            formatting.stylua.with({
                args = { "--config-path", vim.fn.expand("~/.config/nvim/.stylua.toml") }
            }),
            diagnostics.eslint,
            code_actions.eslint,
            code_actions.gitsigns,
            -- completion.luasnip,
            formatting.prettier.with({
                args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" }
            }),
            formatting.rustfmt.with({
                args = { "--emit=stdout" }
            }),
            formatting.gofmt,
            formatting.black.with({
                args = { "--quiet", "-" },
                extra_args = { "--line-length", "80" },
            }),
            -- formatting.isort,
            diagnostics.cppcheck,
            diagnostics.mypy,
            diagnostics.pycodestyle,
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
