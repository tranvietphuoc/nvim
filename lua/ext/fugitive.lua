local M = {}

function M.setup()
    -- fugitive
    vim.cmd("nnoremap <leader>ga :Git add %:p<CR><CR>")
    vim.cmd("nnoremap <leader>gS :Git<CR>")
    vim.cmd("nnoremap <leader>gC :Git commit -v -q<CR>")
    vim.cmd("nnoremap <leader>gt :Gcommit -v -q %:p<CR>")
    vim.cmd("nnoremap <leader>gd :Git diff<CR>")
    vim.cmd("nnoremap <leader>ge :Gedit<CR>")
    vim.cmd("nnoremap <leader>gr :Gread<CR>")
    -- vim.cmd("nnoremap <leader>gw :Gwrite<CR><CR>")
    vim.cmd("nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>")
    vim.cmd("nnoremap <leader>gp :Ggrep<Space>")
    vim.cmd("nnoremap <leader>gm :Gmove<Space>")
    -- vim.cmd("nnoremap <leader>gb :Git branch<Space>")
    vim.cmd("nnoremap <leader>go :Git checkout<Space>")
    vim.cmd("nnoremap <leader>gps :Dispatch! git push<CR>")
    vim.cmd("nnoremap <leader>gpl :Dispatch! git pull<CR>")
end

return M
