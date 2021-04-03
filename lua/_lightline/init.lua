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

vim.cmd[[ nmap <Leader>1 :call lightline#bufferline#go(1)<CR> ]]
vim.cmd[[ nmap <Leader>2 :call lightline#bufferline#go(2)<CR> ]]
vim.cmd[[ nmap <Leader>3 :call lightline#bufferline#go(3)<CR> ]]
vim.cmd[[ nmap <Leader>4 :call lightline#bufferline#go(4)<CR> ]]
vim.cmd[[ nmap <Leader>5 :call lightline#bufferline#go(5)<CR> ]]
vim.cmd[[ nmap <Leader>6 :call lightline#bufferline#go(6)<CR> ]]
vim.cmd[[ nmap <Leader>7 :call lightline#bufferline#go(7)<CR> ]]
vim.cmd[[ nmap <Leader>8 :call lightline#bufferline#go(8)<CR> ]]
vim.cmd[[ nmap <Leader>9 :call lightline#bufferline#go(9)<CR> ]]
vim.cmd[[ nmap <Leader>0 :call lightline#bufferline#go(10)<CR> ]]
-- delete buffer with particular number
vim.cmd[[ nmap <S-1> :call lightline#bufferline#delete(1)<CR> ]]
vim.cmd[[ nmap <S-2> :call lightline#bufferline#delete(2)<CR> ]]
vim.cmd[[ nmap <S-3> :call lightline#bufferline#delete(3)<CR> ]]
vim.cmd[[ nmap <S-4> :call lightline#bufferline#delete(4)<CR> ]]
vim.cmd[[ nmap <S-5> :call lightline#bufferline#delete(5)<CR> ]]
vim.cmd[[ nmap <S-6> :call lightline#bufferline#delete(6)<CR> ]]
vim.cmd[[ nmap <S-7> :call lightline#bufferline#delete(7)<CR> ]]
vim.cmd[[ nmap <S-8> :call lightline#bufferline#delete(8)<CR> ]]
vim.cmd[[ nmap <S-9> :call lightline#bufferline#delete(9)<CR> ]]
vim.cmd[[ nmap <S-0> :call lightline#bufferline#delete(10)<CR> ]]


