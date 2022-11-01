-- local vscode = require('dap.ext.vscode')

local M = {}
-- local dap = require("dap")

function M.setup()
    -- import adapters
    vim.g.vimspector_enable_mappings = "HUMAN"
    vim.g.vimspector_install_gadgets = { "debugpy", "vscode-go", "CodeLLDB", "vscode-node-debug2" }
    -- require("telescope").load_extension("vimspector")
    --[[ dap.adapters.python = {
        type = 'executable',
        command = './.venv/debugpy/bin/python',
        args = { '-m', 'debugpy.adapter' }
    }

    dap.adapters.lldb = {
        type = 'executable',
        command = ''
    } ]]
end

return M
