vim.cmd[[ set foldmethod=expr ]]
vim.cmd[[ set foldexpr=nvim_treesitter#foldexpr() ]]

require'nvim-treesitter.configs'.setup {
    ensure_installed = O.treesitter.ensure_installed,
	ignored_install = O.treesitter.ignore_install,
    highlight = {
        enable = O.treesitter.highlight.enable,
        disable = {},              -- false will disable the whole extension
    },
    playground = {
        enable = O.treesitter.playground.enabled,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    rainbow = {
        enable = O.treesitter.rainbow.enabled,
    },
    refactor = {
        highlight_definitions = {
            enable = true
        }
    }
}
