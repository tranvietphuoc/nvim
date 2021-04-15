" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
			\ quit | endif

let s:brown = "663300"
let s:aqua =  "33FFFF"
let s:blue = "0080FF"
let s:darkBlue = "0066CC"
let s:purple = "FF00FF"
let s:lightPurple = "FF33FF"
let s:red = "FF0000"
let s:beige = "F5C06F"
let s:yellow = "FFFF00"
let s:orange = "FF8000"
let s:darkOrange = "CC6600"
let s:pink = "FF3399"
let s:salmon = "FF9999"
let s:green = "00CC00"
let s:lightGreen = "00FF00"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'FF9933'

