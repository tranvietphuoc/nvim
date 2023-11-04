local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local util = require("lspconfig").util

function M.setup()
    require("lspconfig").docker_compose_language_service.setup({
        cmd = { DATA .. "/mason/bin/docker-compose-langserver", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
        filetypes = { "yaml.docker-compose" },
        root_dir = util.root_pattern("docker-compose.yaml"),
        single_file_support = true,
    })
end

return M
