-- local vscode = require('dap.ext.vscode')

local M = {}

function M.setup()
    -- import adapters
    require("debugger.python").setup()
    require("debugger.lldb").setup()
    -- import dap-install
    local dap_install = require("dap-install")
    local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

    -- dapinstall config
    dap_install.setup({
        installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    })

    for _, debugger in ipairs(dbg_list) do
        dap_install.config(debugger, {})
    end
    -- import dap-ui
    require("debugger.ui").setup()
    -- sign_define for breakpoints

    vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "🟥", texthl = "", linehl = "", numhl = "" })
    vim.g.dap_virtual_text = true
end

return M
