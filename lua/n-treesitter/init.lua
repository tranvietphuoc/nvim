
require'nvim-treesitter.configs'.setup {
  autopairs = {
    enable = true
  },
  indent = {
    enable = false
  },
  ensure_installed = {
      "javascript",
      "dockerfile",
      "scss",
      "julia",
      "toml",
      "rst",
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
      "tsx",
      "typescript",
      "regex",
      "vue",
      "svelte",
    },
	ignore_install = {"haskell", "hcl"},
  highlight = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
  },
  rainbow = {
    enable = true,
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  },
  matchup = {
    enable = true,
  }
}
