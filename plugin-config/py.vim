" set background=dark
syntax match pythonFunction /\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\ze(\s?\()/
" set formatting for *.py files
autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 fileformat=unix

" python-highlight
let g:python_highlight_all = 1

" Pymode
" let g:pymode_trim_whitespaces = 1
" let g:pymode_options_max_line_length = 79
" let g:pymode_lint_on_write = 1
let g:pymode_options_colorcolumn = 1
let g:pymode_virtualenv = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_print_as_function = 1

"let g:pymode_lint_signs = 0
let g:pymode_lint = 0
