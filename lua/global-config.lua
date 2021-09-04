O = {
  auto_complete = true,
  colorscheme = 'onedark',
	color = "256",
  py_provider = "$HOME/.pyenv/shims/python",
  nvim_tree_disable_netrw = 0,
  
  database = {save_location = '~/.config/nvim/db', auto_execute = 1},
  python = {
    linter = 'flake8',
    -- @usage can be 'yapf', 'black'
    formatter = 'black',
    autoformat = false,
    isort = false,
    diagnostics = {virtual_text = true, signs = true, underline = true}
  },
  lua = {
    -- @usage can be 'lua-format'
    formatter = 'lua-format',
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
    linter = 'eslint',
    -- @usage can be 'prettier'
    formatter = 'prettier',
    autoformat = false,
    diagnostics = {virtual_text = true, signs = true, underline = true}
  },
  json = {
    -- @usage can be 'prettier'
    formatter = 'prettier',
    autoformat = false,
    diagnostics = {virtual_text = true, signs = true, underline = true}
  },
  clangd = {diagnostics = {virtual_text = true, signs = true, underline = true}}
}

DATA = vim.fn.stdpath('data')
CACHE = vim.fn.stdpath('cache')
