-- npm install -g dockerfile-language-server-nodejs
--
local M = {}

local util = require("lspconfig").util

function M.setup()
    vim.lsp.config("dockerls", {
        cmd = { DATA .. "/mason/bin/docker-langserver", "--stdio" },
        -- cmd = {"docker-langserver", "--stdio"},
        on_attach = require("lsp").common_on_attach,
        filetypes = { "Dockerfile", "dockerfile" },
        root_dir = util.root_pattern("Dockerfile"),
    })
end

return M
