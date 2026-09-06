local data = vim.fn.stdpath("data")
vim.opt.runtimepath:prepend(data .. "/lazy/nvim-treesitter")
vim.opt.runtimepath:prepend(data .. "/site")

local fence = string.rep(string.char(96), 3)
vim.api.nvim_buf_set_lines(0, 0, -1, false, {
    fence .. "lua",
    "print(1)",
    fence,
})
vim.bo.filetype = "markdown"

local parser = vim.treesitter.get_parser(0, "markdown")
local root = parser:parse()[1]:root()
local query = assert(vim.treesitter.query.get("markdown", "injections"))
local matches = 0

for _ in query:iter_matches(root, 0) do
    matches = matches + 1
end

assert(matches > 0, "expected a Markdown fenced-code injection")
print("treesitter markdown injections: OK")
