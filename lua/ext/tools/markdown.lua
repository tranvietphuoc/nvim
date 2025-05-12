local M = {}

function M.setup()
    vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "javascript" }
    vim.g.markdown_syntax_conceal = 0
    vim.g.mkdp_auto_start = 0

    -- markdown previewer
    -- vim.api.nvim_set_keymap('n', '<Leader>mp', '<Plug>MarkdownPreview<CR>', {noremap = true, silent = true})
    -- vim.api.nvim_set_keymap('n', '<Leader>mq', '<Plug>MarkdownPreviewStop<CR>', {noremap = true, silent = true})

    -- vim.cmd 'nmap <Leader>m <Plug>MarkdownPreview'
    -- vim.cmd 'nmap <Leader>M <Plug>MarkdownPreviewStop'

    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_theme = "light"
    vim.g.mkdp_combine_preview_auto_refresh = 1
    vim.g.mkdp_echo_preview_url = 1
end

return M
