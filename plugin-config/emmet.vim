
" Setting emmet-vim
let g:user_emmet_leader_key=','
"let g:user_emmet_mode = 'a'  " enable all function in all mode
let g:user_emmet_install_global = 0
let g:tagalong_verbose = 1
let g:user_emmet_settings = {
                        \'javascript': {
                        \'extends': 'jsx',
                        \},
                        \}
autocmd FileType html,css,htmldjango,scss,javascript EmmetInstall  " enable just for html/css
