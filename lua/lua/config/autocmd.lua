local M = {}
local cmd = vim.cmd

function M.auto_cmds()
    vim.g.dracula_show_end_of_buffer = true
    vim.g.dracula_italic_comment = true
    vim.g.dracula_transparent_bg = false

    vim.g.bracey_refresh_on_save = 1
    vim.g.bracey_bracey_eval_on_save = 1
    cmd("autocmd BufRead,BufNewFile *.js,*.ts,*.tsx,*.jsx,*.json setlocal expandtab ts=2 sw=2 sts=2")
    cmd("autocmd BufRead,BufNewFile *.html,*.css,*.scss,*.yml,*.svelte setlocal expandtab ts=2 sw=2 sts=2")
    cmd("autocmd BufNewFile,BufRead *.go setlocal noexpandtab ts=8 sw=8")
    cmd("autocmd BufRead,BufNewFile *.lua setlocal expandtab ts=4 sw=4 sts=4")
    cmd("autocmd BufWritePost plugins.lua PackerCompile")
    vim.api.nvim_exec(
        [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.rs,*.lua,*.py,*.go,*.c,*.cpp,*.h,*.hpp,*.html,*.css FormatWrite
  augroup END
  ]],
        true
    )

    cmd([[command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()]])

    cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    -- cmd("autocmd User TelescopePreviewerLoaded setlocal wrap")
    cmd("autocmd FileType html,css,htmldjango,sass EmmetInstall")
end

function M.setup()
    M.auto_cmds()
end

return M
