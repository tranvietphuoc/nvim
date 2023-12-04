-- npm install -g dockerfile-language-server-nodejs
--
local M = {}


local utils = require("lspconfig.util")
local lspconfig = require("lspconfig")

function M.setup()
    lspconfig.dockerls.setup {
        cmd = { DATA .. "/mason/bin/docker-langserver", "--stdio" },
        -- cmd = {"docker-langserver", "--stdio"},
        on_attach = require("lsp").common_on_attach,
        filetypes = { "Dockerfile", "dockerfile" },
        root_dir = utils.root_pattern("Dockerfile"),
    }
end

return M
