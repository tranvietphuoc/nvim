
local M = {}

function M.setup()
  local dap_install = require("dap-install")
  local dbg_list = require('dap-install.api.debuggers').get_installed_debuggers()

  dap_install.setup({
	  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
  })
  for _, debugger in ipairs(dbg_list) do
    dap_install.config(debugger, {})
  end
  -- dap_install.config('python', {})
  -- dap_install.config('ccppr_vsc', {})
  -- dap_install.config('c', {})
  -- dap_install.config('rust', {})
end

return M

