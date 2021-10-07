local M = {}

function M.setup()
    -- Move to previous/next
    vim.api.nvim_set_keymap("n", "<TAB>", ":BufferNext<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<S-c>", ":BufferClose<CR>", { noremap = true, silent = true })
    -- Re-order to previous/next
    -- Goto buffer in position...
    vim.cmd([[ nnoremap <silent>    <leader>1 :BufferGoto 1<CR> ]])
    vim.cmd([[ nnoremap <silent>    <leader>2 :BufferGoto 2<CR> ]])
    vim.cmd([[ nnoremap <silent>    <leader>3 :BufferGoto 3<CR> ]])
    vim.cmd([[ nnoremap <silent>    <leader>4 :BufferGoto 4<CR> ]])
    vim.cmd([[ nnoremap <silent>    <leader>5 :BufferGoto 5<CR> ]])
    vim.cmd([[ nnoremap <silent>    <leader>6 :BufferGoto 6<CR> ]])
    vim.cmd([[ nnoremap <silent>    <leader>7 :BufferGoto 7<CR> ]])
    vim.cmd([[ nnoremap <silent>    <leader>8 :BufferGoto 8<CR> ]])
    vim.cmd([[ nnoremap <silent>    <leader>9 :BufferGoto 9<CR> ]])
    vim.cmd([[ noremap <silent>     <ledaer>0 :BufferLast<CR>]])
end

return M
