-- npm install -g dockerfile-language-server-nodejs
--
local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig").dockerls.setup({
        cmd = { DATA .. "/mason/bin/docker-langserver", "--stdio" },
        -- cmd = {"docker-langserver", "--stdio"},
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
        filetypes = { "Dockerfile", "dockerfile" },
        root_dir = vim.loop.cwd,
    })
end

return M
