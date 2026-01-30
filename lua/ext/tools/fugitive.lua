return {
    setup = function()
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        map("n", "<leader>ga", ":Git add %:p<CR><CR>", opts)
        map("n", "<leader>gS", ":Git<CR>", opts)
        map("n", "<leader>gC", ":Git commit -v -q<CR>", opts)
        map("n", "<leader>gt", ":Gcommit -v -q %:p<CR>", opts)
        map("n", "<leader>gd", ":Git diff<CR>", opts)
        map("n", "<leader>ge", ":Gedit<CR>", opts)
        map("n", "<leader>gr", ":Gread<CR>", opts)
        map("n", "<leader>gl", ":silent! Glog<CR>:bot copen<CR>", opts)
        map("n", "<leader>gp", ":Ggrep<Space>", { noremap = true })
        map("n", "<leader>gm", ":Gmove<Space>", { noremap = true })
        map("n", "<leader>go", ":Git checkout<Space>", { noremap = true })
        map("n", "<leader>gps", ":Dispatch! git push<CR>", opts)
        map("n", "<leader>gpl", ":Dispatch! git pull<CR>", opts)
    end,
}
