-- vim.cmd('set laststatus=2')
-- vim.cmd('set background=dark')
-- vim.cmd('colorscheme ' .. O.colorscheme)
-- vim.api.nvim_command('let g:PaperColor_Theme_Options = { \'language\': { \'python\': { \'highlight_builtins\': 1}, \'cpp\': { \'highlight_standard_library\': 1 }, \'c\': { \'highlight_builtins\': 1 } } }')
--
--
--


require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}

vim.cmd('colorscheme ' .. O.colorscheme)

