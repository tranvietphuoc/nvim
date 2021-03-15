
" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'PaperColor'
let g:lightline.active = { 'left': [ ['mode', 'paste'], ['cocstatus', 'readonly', 'filename', 'modified'] ] }
let g:lightline.component_function = { 'filename': 'LightlineFilename', 'cocstatus': 'coc#status', 'gitbranch': 'FugitiveHead' }
set showtabline=2
let g:lightline.tabline = { 'left': [['buffers']], 'right': [['close']] }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_type   = { 'buffers': 'tabsel', 'close': 'raw' }
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
let g:lightline#bufferline#clickable=1
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.component_raw = {'buffers': 1}
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction
