local data = vim.fn.stdpath("data")
vim.opt.runtimepath:prepend(data .. "/lazy/plenary.nvim")
vim.opt.runtimepath:prepend(data .. "/lazy/telescope.nvim")

local bufnr = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "local value = 1" })

local previewers = require("telescope.previewers.utils")
local ok, err = pcall(previewers.ts_highlighter, bufnr, "lua")

assert(ok, err)
print("telescope Tree-sitter previewer: OK")
