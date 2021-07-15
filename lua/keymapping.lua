local map = vim.api.nvim_set_keymap

vim.g.mapleader = ","

-- no hl
-- :nnoremap <silent> <Leader><Space> :set hlsearch<CR>
map('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- tab to next buffer in normal mode
map('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- delete current buffer
vim.api.nvim_set_keymap('n', '<S-c>', ':bdelete<CR>', { noremap = true, silent = true })

--- move through splitted windows
vim.cmd([[
  nmap <Leader><Up> :wincmd k<CR>
  nmap <Leader><Down> :wincmd j<CR>
  nmap <Leader><Left> :wincmd h<CR>
  nmap <Leader><Right> :wincmd l<CR>
]])

-- fast escaping
map('i', 'qq', '<ESC>', {noremap = true, silent = true})
map('n', 'qq', '<ESC>', {noremap = true, silent = true})
map('v', 'qq', '<ESC>', {noremap = true, silent = true})
map('x', 'qq', '<ESC>', {noremap = true, silent = true})
map('s', 'qq', '<ESC>', {noremap = true, silent = true})
map('o', 'qq', '<ESC>', {noremap = true, silent = true})
map('c', 'qq', '<ESC>', {noremap = true, silent = true})


-- saving
map('n', '<Leader>w', ':w<CR>', {noremap = true, silent = true})

-- fast quitting
map('n', '<Leader>q', ':q<CR>', {noremap = true, silent = false})

-- toggle zen mode
map('n', '<Leader>z', ':ZenMode<CR>', {noremap = true, silent = true})

-- toggle float term
map('n', '<Leader>t', '<CMD>lua require("FTerm").toggle()<CR>', {noremap = true, silent = true})
map('t', '<Leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', {noremap = true, silent = true})


-- move selected line / blocks of text in V-mode
-- Move selected line / block of text in visual mode
map('x', 'H', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
map('x', 'L', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- comment toggle
map('n', '<Leader>/', ":CommentToggle<CR>", {noremap = true, silent = true})
map('i', '<Leader>/', ":CommentToggle<CR>", {noremap = true, silent = true})
map('x', '<Leader>/', ":CommentToggle<CR>", {noremap = true, silent = true})
map('v', '<Leader>/', ":CommentToggle<CR>", {noremap = true, silent = true})

