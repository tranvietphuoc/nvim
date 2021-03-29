
vim.g.vim_markdown_folding_disable = 1
vim.g.vim_markdown_folding_style_pythonic = 0
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_toc_autofit = 1
vim.g.vim_markdown_conceal_code_blocks = 0
vim.cmd('let g:markdown_fenced_languages = [\'c++=cpp\', \'bash=sh\', \'viml=vim\', \'python\', \'javascript\', \'htm\']')

-- markdown previewer
--
-- vim.api.nvim_set_keymap('n', '<Leader>mp', '<Plug>MarkdownPreview', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>ms', '<Plug>MarkdownPreviewStop', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>mt', '<Plug>MarkdownPreviewToggle', {noremap = true, silent = true})
vim.cmd[[nmap <Leader>mp <Plug>MarkdownPreview]]
vim.cmd[[nmap <Leader>ms <Plug>MarkdownPreviewStop]]
vim.cmd[[nmap <Leader>mt <Plug>MarkdownPreviewToggle]]
vim.cmd('let g:mkdp_filetypes = [\'markdown\']')
