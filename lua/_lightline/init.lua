-- config lightline
vim.cmd('let g:lightline = {}')
-- vim.cmd('let g:lightline.colorscheme ' .. O.colorscheme)
vim.cmd[[ let g:lightline.colorscheme = 'PaperColor' ]]

vim.cmd('let g:lightline.active = { \'left\': [ [\'mode\', \'paste\'], [ \'gitbranch\', \'readonly\', \'filename\', \'modified\'] ] }')
vim.cmd('let g:lightline.component_function = { \'filename\': \'LightlineFilename\', \'gitbranch\': \'FugitiveHead\', \'readonly\': \'LightlineReadonly\', }')


vim.cmd([[
    function! LightlineFilename()
        return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :&filetype ==# 'unite' ? unite#get_status_string() :&filetype ==# 'vimshell' ? vimshell#get_status_string() :expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    endfunction
]])

vim.cmd('let g:lightline.tabline = { \'left\': [[\'buffers\']], \'right\': [[\'close\']] }')
vim.cmd('let g:lightline.component_expand = { \'buffers\': \'lightline#bufferline#buffers\' }')
vim.cmd('let g:lightline.component_type   = { \'buffers\': \'tabsel\', \'close\': \'raw\' }')

vim.cmd('autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()')
vim.cmd('let g:lightline#bufferline#clickable=1')
vim.cmd('let g:lightline#bufferline#enable_devicons=1')
vim.cmd('let g:lightline#bufferline#show_number  = 2')
vim.cmd('let g:lightline#bufferline#shorten_path = 1')
vim.cmd('let g:lightline#bufferline#unnamed = \'[No Name]\'')
vim.cmd('let g:lightline.component_raw = {\'buffers\': 1}')

-- move to particular buffer

vim.api.nvim_set_keymap('n',  '<Leader>1',  ':call lightline#bufferline#go(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>2',  ':call lightline#bufferline#go(2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>3',  ':call lightline#bufferline#go(3)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>4',  ':call lightline#bufferline#go(4)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>5',  ':call lightline#bufferline#go(5)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>6',  ':call lightline#bufferline#go(6)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>7',  ':call lightline#bufferline#go(7)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>8',  ':call lightline#bufferline#go(8)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>9',  ':call lightline#bufferline#go(9)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n',  '<Leader>0',  ':call lightline#bufferline#go(10)<CR>', { noremap = true, silent = true })


