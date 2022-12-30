local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig")['cmake'].setup({
        cmd = { DATA .. "/mason/bin/cmake-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
    })
end

return M
