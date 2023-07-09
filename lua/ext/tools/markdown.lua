local M = {}

function M.setup()
    vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "javascript" }
    vim.g.markdown_syntax_conceal = 0

    -- markdown previewer
    -- vim.api.nvim_set_keymap('n', '<Leader>mp', '<Plug>MarkdownPreview<CR>', {noremap = true, silent = true})
    -- vim.api.nvim_set_keymap('n', '<Leader>mq', '<Plug>MarkdownPreviewStop<CR>', {noremap = true, silent = true})

    -- vim.cmd 'nmap <Leader>m <Plug>MarkdownPreview'
    -- vim.cmd 'nmap <Leader>M <Plug>MarkdownPreviewStop'

    vim.cmd("let g:mkdp_filetypes = ['markdown']")
end

return M
