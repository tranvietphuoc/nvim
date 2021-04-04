vim.cmd[[ set foldmethod=expr ]]
vim.cmd[[ set foldexpr=nvim_treesitter#foldexpr() ]]

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "c",
        "cpp",
        "python",
        "rust",
        "go",
        "json",
        "yaml",
        "tsx",
        "typescript",
        "regex",
        "vue",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,
        disable = {},              -- false will disable the whole extension
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    rainbow = {
        enable = true,
    },
    refactor = {
        highlight_definitions = {
            enable = true
        }
    }
}
