
" vim-jsx
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

" syntax highlighting for javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" set tabstop and indent for html, js, css
autocmd BufRead,BufNewFile *.htm,*.html,*.js,*.jsx,*.css,*.scss,*.sass,*json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
