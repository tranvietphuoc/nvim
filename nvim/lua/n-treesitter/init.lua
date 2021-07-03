
require'nvim-treesitter.configs'.setup {
  autopairs = {enable = true},
  indent = {enable = true},
  ensure_installed = O.treesitter.ensure_installed,
	ignored_install = O.treesitter.ignore_install,
  highlight = {
    enable = O.treesitter.highlight.enabled,
  },
  -- indent = {enable = true},
  playground = {
    enable = O.treesitter.playground.enabled,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
    toggle_query_editor = 'o',
    toggle_hl_groups = 'i',
    toggle_injected_language = 't',
    toggle_anonymous_nodes = 'a',
    toggle_language_display = 'I',
    focus_language = 'f',
    unfocus_language = 'F',
    update = 'R',
    goto_node = '<cr>',
    show_helps = '?',
    },
  },
  rainbow = {
    enable = O.treesitter.rainbow.enabled,
  },
  autotag = {enable = true},
  context_commentstring = {enable = true},
  -- autopairs = {enable = true},
  matchup = {
    enable = true,
  }
}
