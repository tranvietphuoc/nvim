local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ","

-- tab to next buffer in normal mode
map('n', '<TAB>', ':bnext<CR>', opts)
map('n', '<S-TAB>', ':bprevious<CR>', opts)
-- delete current buffer
vim.api.nvim_set_keymap('n', '<S-c>', ':bdelete<CR>', opts)

-- fast escaping
map('i', 'qq', '<ESC>', opts)
map('n', 'qq', '<ESC>', opts)
map('v', 'qq', '<ESC>', opts)
map('x', 'qq', '<ESC>', opts)
map('s', 'qq', '<ESC>', opts)
map('o', 'qq', '<ESC>', opts)
map('c', 'qq', '<ESC>', opts)

-- saving
map('n', '<Leader>w', ':w<CR>', opts)

-- fast quitting
map('n', '<Leader>q', ':q<CR>', opts)

-- toggle zen mode
map('n', '<Leader>z', ':ZenMode<CR>', opts)

-- toggle float term
map('n', '<Leader>t', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<Leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

-- toggle gitui
map('n', '<Leader>G', '<CMD>lua _G.__fterm_gitui()<CR>', opts)
map('t', '<Leader>G', '<CMD>lua _G.__fterm_gitui()<CR>', opts)

-- comment toggle
map('n', '<Leader>/', ":CommentToggle<CR>", opts)
map('i', '<Leader>/', ":CommentToggle<CR>", opts)
map('x', '<Leader>/', ":CommentToggle<CR>", opts)
map('v', '<Leader>/', ":CommentToggle<CR>", opts)

-- git fugitive
map('n', '<Leader>Gd', ':Gvdiffsplit<CR>', opts)
map('n', '<Leader>Dh', ':diffget //2<CR>', opts)
map('n', '<Leader>Dl', ':diffget //3<CR>', opts)

-- navigating
--- move between splitted windows
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)

-- move selected line / blocks of text in V-mode
-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', opts)
map('x', 'J', ':move \'>+1<CR>gv-gv', opts)

-- debugger dap
map('n', '<S-b>', ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map('n', '<S-o>', ":lua require'dap'.step_over()<CR>", opts)
map('n', '<S-i>', ":lua require'dap'.step_into()<CR>", opts)
map('n', '<S-r>', ":lua require'dap'.repl.open()<CR>", opts)

-- live server
map('n', '<Leader>l', ':Bracey<CR>', opts)
map('n', '<Leader>L', ':BraceyStop<CR>', opts)

-- markdown preview
map('n', '<Leader>m', '<Plug>MarkdownPreview<CR>', {noremap = false, silent = false})
map('n', '<Leader>M', '<Plug>MarkdownPreviewStop<CR>', {noremap = false, silent = false})

-- nvimtree
map('n', '<Leader>n', ':NvimTreeToggle<CR>', opts)
map('n', '<Leader>R', ':NvimTreeRefresh<CR>', opts)

-- telescope
map('n', '<Leader>f', '<cmd>Telescope find_files<CR>', opts)
map('n', '<Leader>F', '<cmd>Telescope live_grep<cr>', opts)
