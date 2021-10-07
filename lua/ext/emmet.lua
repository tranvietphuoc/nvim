local M = {}

function M.setup()
    vim.g.user_emmet_leader_key = "<Tab>"
    vim.g.user_emmet_expandabbr_key = "<Tab>"
    vim.g.user_emmet_install_global = 0
    vim.g.user_emmet_mode = "iv"
    vim.g.tagalong_verbose = 1
    -- vim.cmd('let g:user_emmet_settings = { \'javascript\': { \'extends\': \'jsx\', } }')
end

return M
