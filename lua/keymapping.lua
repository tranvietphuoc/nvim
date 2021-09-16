local map = vim.api.nvim_set_keymap

vim.g.mapleader = ","

-- no hl
-- :nnoremap <silent> <Leader><Space> :set hlsearch<CR>
-- map('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- tab to next buffer in normal mode
map('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- delete current buffer
vim.api.nvim_set_keymap('n', '<S-c>', ':bdelete<CR>', { noremap = true, silent = true })


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

-- toggle gitui
map('n', '<Leader>G', '<CMD>lua _G.__fterm_gitui()<CR>', {noremap = true, silent = true})
map('t', '<Leader>G', '<CMD>lua _G.__fterm_gitui()<CR>', {noremap = true, silent = true})

-- comment toggle
map('n', '<Leader>/', ":CommentToggle<CR>", {noremap = true, silent = true})
map('i', '<Leader>/', ":CommentToggle<CR>", {noremap = true, silent = true})
map('x', '<Leader>/', ":CommentToggle<CR>", {noremap = true, silent = true})
map('v', '<Leader>/', ":CommentToggle<CR>", {noremap = true, silent = true})

-- git fugitive
map('n', '<Leader>Gd', ':Gvdiffsplit<CR>', {noremap = true, silent = true})
map('n', '<Leader>dh', ':diffget //2<CR>', {noremap = true, silent = true})
map('n', '<Leader>dl', ':diffget //3<CR>', {noremap = true, silent = true})


-- navigating
--- move between splitted windows
map('n', '<Leader>k', ':wincmd k<CR>', {noremap = true, silent = true})
map('n', '<Leader>j', ':wincmd j<CR>', {noremap = true, silent = true})
map('n', '<Leader>h', ':wincmd h<CR>', {noremap = true, silent = true})
map('n', '<Leader>l', ':wincmd l<CR>', {noremap = true, silent = true})

-- move selected line / blocks of text in V-mode
-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
map('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })
