
-- vim.g.vim_markdown_folding_disable = 1
-- vim.g.vim_markdown_folding_style_pythonic = 0
-- vim.g.vim_markdown_frontmatter = 1
-- vim.g.vim_markdown_toml_frontmatter = 1
-- vim.g.vim_markdown_json_frontmatter = 1
-- vim.g.vim_markdown_math = 1
-- vim.g.vim_markdown_toc_autofit = 1
-- vim.g.vim_markdown_conceal_code_blocks = 0
-- vim.cmd('let g:markdown_fenced_languages = [\'c++=cpp\', \'bash=sh\', \'viml=vim\', \'python\', \'javascript\', \'htm\']')
vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'javascript'}
vim.g.markdown_syntax_conceal = 0

-- markdown previewer
-- vim.api.nvim_set_keymap('n', '<Leader>mp', '<Plug>MarkdownPreview<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>mq', '<Plug>MarkdownPreviewStop<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>mt', '<Plug>MarkdownPreviewToggle<CR>', {noremap = true, silent = true})

vim.cmd 'nmap <Leader>m <Plug>MarkdownPreview'
vim.cmd 'nmap <Leader>M <Plug>MarkdownPreviewStop'
vim.cmd 'nmap <C-t> <Plug>MarkdownPreviewToggle'

vim.cmd('let g:mkdp_filetypes = [\'markdown\']')
