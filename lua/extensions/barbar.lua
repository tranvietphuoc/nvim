-- Move to previous/next
vim.api.nvim_set_keymap('n', '<Space><Right>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space><Left>', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>c', ':BufferClose<CR>', { noremap = true, silent = true })
-- Re-order to previous/next
-- Goto buffer in position...
vim.cmd[[ nnoremap <silent>    <Space>1 :BufferGoto 1<CR> ]]
vim.cmd[[ nnoremap <silent>    <Space>2 :BufferGoto 2<CR> ]]
vim.cmd[[ nnoremap <silent>    <Space>3 :BufferGoto 3<CR> ]]
vim.cmd[[ nnoremap <silent>    <Space>4 :BufferGoto 4<CR> ]]
vim.cmd[[ nnoremap <silent>    <Space>5 :BufferGoto 5<CR> ]]
vim.cmd[[ nnoremap <silent>    <Space>6 :BufferGoto 6<CR> ]]
vim.cmd[[ nnoremap <silent>    <Space>7 :BufferGoto 7<CR> ]]
vim.cmd[[ nnoremap <silent>    <Space>8 :BufferGoto 8<CR> ]]
vim.cmd[[ nnoremap <silent>    <Space>9 :BufferGoto 9<CR> ]]
vim.cmd[[ noremap <silent>     <Space>0 :BufferLast<CR>]]
