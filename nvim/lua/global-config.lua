O = {
  auto_complete = true,
  colorscheme = 'nvcode',
  hidden_files = true,
  wrap_line = false,
  numbers = true,
  relative_numbers = true,
	ruler = true,
	smart_indent = true,
	show_match = true,
	cursor_line = true,
	syntax = "on",
	fonts = "FiraCode\\ Nerd\\ Font:h13",
	color = "256",
	show_tabline = 2,  -- tabline
	update_time = 300,
	timeout_len = 300,
  py_provider = "$HOME/.pyenv/versions/3.9.4/bin/python",
  nvim_tree_disable_netrw = 0,

  -- @usage pass a table with your desired languages
  treesitter = {
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
    ignore_install = {"haskell"},
    highlight = {enabled = true},
    playground = {enabled = true},
    rainbow = {enabled = true},
  },

  database = {save_location = '~/.config/nvim/db', auto_execute = 1},
  python = {
    linter = '',
    -- @usage can be 'yapf', 'black'
    formatter = '',
    autoformat = false,
    isort = false,
    diagnostics = {virtual_text = true, signs = true, underline = true}
  },
  lua = {
    -- @usage can be 'lua-format'
    formatter = '',
    autoformat = false,
    diagnostics = {virtual_text = true, signs = true, underline = true}
  },
  sh = {
    -- @usage can be 'shellcheck'
    linter = '',
    -- @usage can be 'shfmt'
    formatter = '',
    autoformat = false,
    diagnostics = {virtual_text = true, signs = true, underline = true}
  },
  tsserver = {
    -- @usage can be 'eslint'
    linter = '',
    -- @usage can be 'prettier'
    formatter = '',
    autoformat = false,
    diagnostics = {virtual_text = true, signs = true, underline = true}
  },
  json = {
    -- @usage can be 'prettier'
    formatter = '',
    autoformat = false,
    diagnostics = {virtual_text = true, signs = true, underline = true}
  },
  clangd = {diagnostics = {virtual_text = true, signs = true, underline = true}}
}

DATA = vim.fn.stdpath('data')
CACHE = vim.fn.stdpath('cache')
