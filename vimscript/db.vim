autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

nnoremap <silent> <leader>du :DBUIToggle<CR>
nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>

let g:db_ui_save_location = '~/.config/db_ui'

let g:dbs = {
			\ 'test': 'postgres://postgres:mypassword@localhost:5432/test',
			\ 'wp': 'mysql://root@localhost/wp_awesome',
			\ }
