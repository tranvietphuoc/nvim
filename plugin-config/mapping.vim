
" set indent/unindent with tab/shift-tab
nmap <Tab> >>
imap <S-Tab> <Esc><<i
nmap <S-Tab> <<

" map leader key
let mapleader=","
let g:mapleader = ","

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" set commentary
inoremap <leader>/ :Commentary<cr>
nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>
xnoremap <leader>/ :Commentary<cr>

" fast saving
nmap <leader>w :w<cr>
" remap esc to ;,
inoremap qq <esc>
nnoremap qq <esc>
vnoremap qq <esc>
xnoremap qq <esc>
snoremap qq <esc>
onoremap qq <esc>
cnoremap qq <esc>

" fast quitting
nmap <leader>q :q<cr>

" quick access terminal
nmap <silent> <Leader>T :terminal<cr>

"Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" Move between buffers
" move to the next buffer
map bn :bn<cr>
" move to the previous buffer
map bp :bp<cr>
" delete the current buffer
map bd :bd<cr>
