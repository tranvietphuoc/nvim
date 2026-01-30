return {
    setup = function()
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        -- close buffer without save
        map("n", "bq", ":bd!<CR>", opts)
    end,
}
