local M = {}

function M.setup()
    require("lspconfig").bashls.setup({
        cmd = { DATA .. "/mason/bin/bash-language-server", "start" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "sh", "fish", "zsh" },
        root_dir = require("lspconfig/util").find_git_ancestor,
    })
end

return M
