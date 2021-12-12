local M = {}

function M.setup()
    -- Move to previous/next
    vim.api.nvim_set_keymap("n", "<TAB>", ":BufferNext<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<S-c>", ":BufferClose<CR>", { noremap = true, silent = true })
    -- Re-order to previous/next
    -- Goto buffer in position...
end

return M
