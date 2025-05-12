local M = {}

local util = require("lspconfig.util")
local lspconfig = require("lspconfig")

function M.setup()
    lspconfig.docker_compose_language_service.setup({
        cmd = { DATA .. "/mason/bin/docker-compose-langserver", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "yaml.docker-compose" },
        root_dir = util.root_pattern("docker-compose.yaml"),
        single_file_support = true,
    })
end

return M
