" " golang
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8
" go highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1

" go config
let g:go_auto_sameids = 1
let g:go_fmt_command = "gomimports"
let g:go_fmt_autosave = 1
let g:go_auto_type_info = 1
let g:go_def_mode='godef'
let g:go_info_mode='gopls'
let g:go_decls_includes = "func"
let g:go_fmt_options = "-tabwidth=8"
let g:go_addtags_transform = "camelcase"
" au filetype go inoremap <buffer> . .<C-x><C-o>
