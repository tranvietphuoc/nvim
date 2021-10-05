local dap_install = require("dap-install")

local M = {}

function M.setup()
  dap_install.setup({
	  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
  })
  dap_install.config("python", {})
  dap_install.config("rust", {})
  dap_install.config("c", {})
end

return M

