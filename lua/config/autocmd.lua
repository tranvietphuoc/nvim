return {
    setup = function()
        local autocmd = vim.api.nvim_create_autocmd

        -- Native highlight on yank
        autocmd("TextYankPost", {
            callback = function()
                vim.highlight.on_yank({
                    higroup = "IncSearch",
                    timeout = 40,
                })
            end,
        })

        -- Filetype specific settings
        autocmd({ "BufRead", "BufNewFile" }, {
            pattern = { "*.java", "*.c", "*.h", "*.cpp", "*.hpp", "*.js", "*.ts", "*.tsx", "*.jsx", "*.json", "*.html", "*.css", "*.yml" },
            command = "setlocal expandtab ts=2 sw=2 sts=2",
        })

        autocmd({ "BufRead", "BufNewFile" }, {
            pattern = { "*.scala", "*.sbt" },
            command = "setlocal expandtab ts=3 sw=3 sts=3",
        })

        autocmd({ "BufRead", "BufNewFile" }, {
            pattern = "*.go",
            command = "setlocal noexpandtab ts=8 sw=8",
        })

        autocmd({ "BufRead", "BufNewFile" }, {
            pattern = { "*.lua", "*.vue" },
            command = "setlocal expandtab ts=4 sw=4 sts=4",
        })

        -- Toggle virtual text command
        vim.api.nvim_create_user_command("LspVirtualTextToggle", function()
            require("lsp.virtual_text").toggle()
        end, {})

        -- Terminal keymaps
        autocmd("TermOpen", {
            pattern = "term://*",
            callback = function()
                local opts = { buffer = 0 }
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
                vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
                vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
                vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
            end,
        })
    end,
}
