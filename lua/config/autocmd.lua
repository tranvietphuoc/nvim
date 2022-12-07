local M = {}
local cmd = vim.cmd

function M.auto_cmds()
    vim.g.dracula_show_end_of_buffer = true
    vim.g.dracula_italic_comment = true
    vim.g.dracula_transparent_bg = false

    cmd("autocmd BufRead,BufNewFile *java,*.js,*.ts,*.tsx,*.jsx,*.json setlocal expandtab ts=2 sw=2 sts=2")
    cmd("autocmd BufRead,BufNewFile *.scala,*.sbt setlocal expandtab ts=3 sw=3 sts=3")
    cmd("autocmd BufRead,BufNewFile *.html,*.css,*.scss,*.yml,*.svelte setlocal expandtab ts=2 sw=2 sts=2")
    cmd("autocmd BufNewFile,BufRead *.go setlocal noexpandtab ts=8 sw=8")
    cmd("autocmd BufRead,BufNewFile *.lua setlocal expandtab ts=4 sw=4 sts=4")
    cmd("autocmd BufWritePost plugins.lua PackerCompile")
    --   vim.api.nvim_exec(
    --       [[
    -- augroup FormatAutogroup
    --   autocmd!
    --   autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.rs,*.lua,*.py,*.go,*.c,*.cpp,*.h,*.hpp,*.html,*.css FormatWrite
    -- augroup END
    -- ]],
    --       true
    --   )

    cmd([[command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()]])

    cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

function M.setup()
    M.auto_cmds()
end

return M
