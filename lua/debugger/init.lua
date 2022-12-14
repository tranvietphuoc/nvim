-- local vscode = require('dap.ext.vscode')

local M = {}

function M.setup()
    -- import adapters
    vim.g.vimspector_enable_mappings = "HUMAN"
    vim.g.vimspector_install_gadgets = { "debugpy", "vscode-go", "CodeLLDB", "vscode-js-debug", "vscode-java" }
end

return M
