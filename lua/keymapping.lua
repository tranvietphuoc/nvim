-- vim.api.nvim_set_keymap('n', ',', ',', { noremap = true, silent = true })
vim.g.mapleader = ","


-- no hl
-- :nnoremap <silent> <Leader><Space> :set hlsearch<CR>
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })


--- move through splitted windows
vim.cmd([[
    nmap <Leader><Up> :wincmd k<CR>
    nmap <Leader><Down> :wincmd j<CR>
    nmap <Leader><Left> :wincmd h<CR>
    nmap <Leader><Right> :wincmd l<CR>
]])

-- fast escaping
-- vim.api.nvim_set_keymap('', 'qq', 'qq', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', 'qq', 'qq', {noremap = true, silent = true})
vim.cmd([[
    inoremap qq <Esc>
    nnoremap qq <Esc>
    vnoremap qq <Esc>
    xnoremap qq <Esc>
    snoremap qq <Esc>
    onoremap qq <Esc>
    cnoremap qq <Esc>
]])

-- saving
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap = true, silent = true})

-- fast quitting
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', {noremap = true, silent = false})

-- move between buffers
vim.api.nvim_set_keymap('n', 'bn', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.cmd('noremap bd :bd<Cr>')

-- move selected line / blocks of text in V-mode
-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'H', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'L', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })
