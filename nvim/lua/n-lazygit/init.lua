vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_floating_window_scaling_factor = 0.9  -- scaling factor for floating window
vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'} --customize lazygit popup window corner characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 0

vim.api.nvim_set_keymap('n', '<Leader>L', ':LazyGit<CR>', { noremap = true, silent = true })
