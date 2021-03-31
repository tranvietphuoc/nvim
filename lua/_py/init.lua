vim.cmd('syntax match pythonFunction /\\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\\ze(\\s?\\()/')
vim.cmd('autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79')

-- python-syntax
vim.g.python_highlight_all = 1

vim.g.python_highlight_exceptions = 1
vim.g.python_highlight_builtins = 1
vim.g.python_highlight_builtin_funcs_kwarg = 1
vim.g.python_highlight_string_formatting = 1
vim.g.python_highlight_string_format = 1
vim.g.python_highlight_string_templates = 1
vim.g.python_highlight_indent_errors = 1
vim.g.python_highlight_space_errors = 1
vim.g.python_highlight_doctests = 1
vim.g.python_highlight_func_calls = 1
vim.g.python_highlight_class_vars = 1
vim.g.python_highlight_operators = 1
vim.g.python_highlight_file_headers_as_comments = 1
