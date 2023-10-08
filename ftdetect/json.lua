local cmd = vim.cmd

cmd [[
    au BufRead,BufNewFile tsconfig.json set filetype=jsonc
]]