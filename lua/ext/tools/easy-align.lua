local M = {}

function M.setup()
    vim.cmd([[xmap ea <Plug>(EasyAlign)]])
    vim.cmd([[nmap ea <Plug>(EasyAlign)]])
end

return M
