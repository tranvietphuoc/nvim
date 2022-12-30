-- npm install -g graphql-language-service-cli
local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig")['graphql'].setup({
        cmd = { DATA .. "/mason/bin/graphql-lsp", "server", "-m", "stream" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
    })
end

return M
