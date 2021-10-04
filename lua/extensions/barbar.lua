-- Move to previous/next
vim.api.nvim_set_keymap('n', '<Space><Left>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space><Right>', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })
-- Re-order to previous/next
-- Goto buffer in position...
vim.cmd[[ nnoremap <silent>    1 :BufferGoto 1<CR> ]]
vim.cmd[[ nnoremap <silent>    2 :BufferGoto 2<CR> ]]
vim.cmd[[ nnoremap <silent>    3 :BufferGoto 3<CR> ]]
vim.cmd[[ nnoremap <silent>    4 :BufferGoto 4<CR> ]]
vim.cmd[[ nnoremap <silent>    5 :BufferGoto 5<CR> ]]
vim.cmd[[ nnoremap <silent>    6 :BufferGoto 6<CR> ]]
vim.cmd[[ nnoremap <silent>    7 :BufferGoto 7<CR> ]]
vim.cmd[[ nnoremap <silent>    8 :BufferGoto 8<CR> ]]
vim.cmd[[ nnoremap <silent>    9 :BufferGoto 9<CR> ]]
vim.cmd[[ noremap <silent>     0 :BufferLast<CR>]]
