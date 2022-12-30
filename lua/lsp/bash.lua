local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig")["bashls"].setup({
        cmd = { DATA .. "/mason/bin/bash-language-server", "start" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
        filetypes = { "sh", "fish", "zsh" },
        root_dir = require("lspconfig/util").find_git_ancestor,
    })
end

return M
