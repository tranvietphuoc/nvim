" ale settings
" Options are in .pylintrc!
highlight VertSplit ctermbg=253
let g:ale_sign_error = '❗️'
let g:ale_sign_warning = '●'
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_completion_enable = 1
let g:ale_set_highlights = 1
let b:ale_linters = {
            \'python': ['flake8', 'pylint'],
            \'javascript': ['eslint'],
            \'rust': ['analyzer'],
            \'go': ['gopls'],
            \}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'javascript': ['eslint'],
            \'typescript': ['prettier', 'tslint'],
            \'css': ['prettier'],
            \'html': ['prettier'],
            \'htmldjango': ['prettier'],
            \'python': ['black'],
            \}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_python_flake8_options = '--max-line-length=79 --ignore=E129,E501,E302,E265,E241,E305,E402,W503,E251,E225'
let g:ale_python_pylint_options = '-j 0 --max-line-length=79'
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_javascript_prettier_options = '--use-tabs'
set statusline+=%=
set statusline+=\ %{LinterStatus()}

let ccls_init_options = {
      \   'clang': {
      \       'extraArgs': [
      \         '-isystem/usr/local/include',
      \         '-isystem/Library/Developer/CommandLineTools/usr/bin/../include/c++/v1',
      \         '-isystem/Library/Developer/CommandLineTools/usr/lib/clang/12.0.0/include',
      \         '-isystem/Library/Developer/CommandLineTools/usr/include',
      \         '-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include',
      \         '-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks'
      \             ],
      \       'resourceDir': '/Library/Developer/CommandLineTools/usr/lib/clang/12.0.0'
      \   }
      \ }
let g:ale_cpp_ccls_init_options = ccls_init_options
let g:ale_c_ccls_init_options = ccls_init_options
