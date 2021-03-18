vim.cmd('let g:fzf_action = { \'ctrl-t\': \'tab split\', \'ctrl-s\': \'vsplit\', \'ctrl-v\': \'vsplit\' }')
vim.cmd('let g:fzf_preview_window = [ \'right\':40% ]')
-- fzf layout
vim.cmd('let g:fzf_layout = { \'window\': { \'width\': 0.9, \'height\': 0.6 } }')
vim.cmd('let g:fzf_layout = { \'down\': \'30%\' }')
-- vim.cmd('let g:fzf_layout = { \'window\': \'enew\' }')

vim.cmd('let g:fzf_buffers_jump = 1')
vim.cmd('let g:fzf_colors = { \'fg\': [\'fg\', \'Normal\'], \'bg\': [\'bg\', \'Normal\'], \'hl\': [\'fg\', \'Comment\'], \'fg+\': [\'fg\', \'CursorLine\', \'CursorColumn\', \'Normal\'], \'bg+\': [\'bg\', \'CursorLine\', \'CursorColumn\'], \'hl+\': [\'fg\', \'Statement\'], \'info\': [\'fg\', \'PreProc\'], \'border\': [\'fg\', \'Ignore\'], \'prompt\': [\'fg\', \'Conditional\'], \'pointer\': [\'fg\', \'Exception\'], \'marker\': [\'fg\', \'Keyword\'], \'spinner\': [\'fg\', \'Label\'], \'header\': [\'fg\', \'Comment\'] }')
vim.cmd('set rtp+=/usr/local/opt/fzf')

-- vim.api.nvim_set_keymap('n', '<Leader>ff', ':Files<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>gf', ':Gfiles<CR>', { noremap = true, silent = true })
-- vim.cmd('nnoremap <Silent> <Leader>ff :Files<CR>')
-- -- vim.cmd('nnoremap <Silent> <Leader>gf :Gfiles<CR>')
-- vim.cmd('nnoremap <Silent> <Leader>f :Rg<CR>')
-- vim.api.nvim_set_keymap('n', '<Leader>f', ':Rg<CR>', { noremap = true, silent = true})
vim.cmd [[nnoremap <Silent> <Leader>ff :Files<CR>]]
vim.cmd [[nnoremap <Silent> <Leader>f :Rg<CR>]]


vim.cmd('command! -bang -nargs=* Rg call fzf#vim#grep(\"rg --column --line-number --no-heading --color=always --smart-case \".shellescape(<q-args>), 1, {\'options\': \'--delimiter : --nth 4..\'}, <bang>0)')

-- if vim.fn.has("nvim") == 1 then
--     vim.cmd('autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>')
-- end

-- if vim.fn.has('$TMUX') == 1 then
--     vim.cmd('let g:fzf_layout = { \'tmux\': \'-p90%,60%\' }')
-- else
--     vim.cmd('let g:fzf_layout = { \'window\': { \'width\': 0.9, \'height\': 0.6 } }')
-- end

