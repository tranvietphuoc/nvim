-- npm install -g dockerfile-language-server-nodejs
--
local M = {}

function M.setup()
    require("lspconfig").dockerls.setup({
        cmd = { DATA .. "/lsp_servers/dockerfile/node_modules/.bin/docker-langserver", "--stdio" },
        -- cmd = {"docker-langserver", "--stdio"},
        on_attach = require("lsp").common_on_attach,
        filetypes = { "Dockerfile", "dockerfile" },
        root_dir = vim.loop.cwd,
    })
end

return M
