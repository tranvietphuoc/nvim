vim.cmd('syntax match pythonFunction /\\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\\ze(\\s?\\()/')
vim.cmd('autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79')

vim.g.python_highlight_all = 1
vim.g.pymode_options_colorcolumn = 1
vim.g.pymode_virtualenv = 1
vim.g.pymode_run = 1
vim.g.pymode_run_bind = '<Leader>r'
vim.g.pymode_breakpoint = 1
vim.g.pymode_breakpoint_bind = '<Leader>b'
vim.g.pymode_doc = 0
vim.g.pymode_doc_key = 'K'
vim.g.pymode_syntax = 1
vim.g.pymode_syntax_all = 1
vim.g.pymode_syntax_slow_sync = 1
vim.g.pymode_syntax_print_as_function = 1
vim.g.pymode_lint = 0

