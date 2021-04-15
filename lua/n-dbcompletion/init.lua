vim.cmd 'autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni'

vim.cmd 'nnoremap <silent> <leader>du :DBUIToggle<CR>'
vim.cmd 'nnoremap <silent> <leader>df :DBUIFindBuffer<CR>'
vim.cmd 'nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>'
vim.cmd 'nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>'
vim.g.db_ui_save_location = O.database.save_location
vim.g.db_ui_auto_execute_table_helpers = O.database.auto_execute


vim.g.dbs = {
  {name = 'test', url = 'postgres://postgres:mypassword@localhost:5432/test'},
  {name = 'wp', url = 'mysql://root@localhost/wp_awesome'},
}
vim.g.db_ui_icons = {
  expanded = '+',
  collapsed = '-',
  connection_error =  'ﰸ',
  tables = '離',
  new_query =  '',
  saved_query = 'ﴖ',
  buffers = '﬘',
}
