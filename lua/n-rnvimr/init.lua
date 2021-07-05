local map = vim.api.nvim_set_keymap
opts = { noremap = true, silent = true }

vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_hide_gitignore = 1
vim.g.rnvimr_shadow_winblend = 70
vim.g.rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'

map('n', '<Leader>r', ':RnvimrToggle<CR>', opts)
-- map('t', '<Leader>r', '<C-\><C-n>:RnvimrToggle<CR>', opts)
-- map('t', '<Leader>sz', 'tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>', opts)


