-- config lightline
vim.cmd('let g:lightline = {}')
vim.cmd('let g:lightline.colorscheme = \'PaperColor\'')
vim.cmd('let g:lightline.active = { \'left\': [ [\'mode\', \'paste\'], [\'cocstatus\', \'readonly\', \'filename\', \'modified\'] ] }')
vim.cmd('let g:lightline.component_function = { \'filename\': \'LightlineFilename\', \'cocstatus\': \'coc#status\', \'gitbranch\': \'FugitiveHead\' }')
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
vim.api.nvim_set_keymap('n', '<Leader>1', '<Plug>lightline#bufferline#go(1)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>2', '<Plug>lightline#bufferline#go(2)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>3', '<Plug>lightline#bufferline#go(3)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>4', '<Plug>lightline#bufferline#go(4)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>5', '<Plug>lightline#bufferline#go(5)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>6', '<Plug>lightline#bufferline#go(6)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>7', '<Plug>lightline#bufferline#go(7)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>8', '<Plug>lightline#bufferline#go(8)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>9', '<Plug>lightline#bufferline#go(9)', {noremap = true, silent = true})


vim.cmd([[
    function! LightlineFilename()
        return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :&filetype ==# 'unite' ? unite#get_status_string() :&filetype ==# 'vimshell' ? vimshell#get_status_string() :expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    endfunction
]])

-- function LightlineFilename()
--     return api.fn.expand('%:t') ~= ''
-- end
