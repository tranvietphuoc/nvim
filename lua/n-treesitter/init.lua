
require'nvim-treesitter.configs'.setup {
  ensure_installed = O.treesitter.ensure_installed,
	ignored_install = O.treesitter.ignore_install,
  highlight = {
    enable = O.treesitter.highlight.enabled,
    disable = {},              -- false will disable the whole extension
  },
  -- indent = {enable = {"javascriptreact"}},
  -- indent = {enable = true},
  playground = {
    enable = O.treesitter.playground.enabled,
    disable = {},
    updatetime = 20, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = true -- Whether the query persists across vim sessions
  },
  rainbow = {
    enable = O.treesitter.rainbow.enabled,
  },
  autotag = {enable = true},
  context_commentstring = {enable = true},
}
