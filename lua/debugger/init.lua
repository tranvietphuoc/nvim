-- local vscode = require('dap.ext.vscode')

local M = {}

function M.setup()
    -- import adapters
    vim.g.vimspector_enable_mappings = "HUMAN"
    vim.g.vimspector_install_gadgets = { "debugpy", "vscode-go", "CodeLLDB", "vscode-node-debug2" }
    -- require("telescope").load_extension("vimspector")
end

return M
