return {
    setup = function()
        vim.g.markdown_fenced_languages = { "html", "python", "bash=sh", "javascript" }
        vim.g.markdown_syntax_conceal = 0
        vim.g.mkdp_auto_start = 0

        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_theme = "light"
        vim.g.mkdp_combine_preview_auto_refresh = 1
        vim.g.mkdp_echo_preview_url = 1
    end,
}
