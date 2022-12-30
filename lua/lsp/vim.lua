-- npm install -g vim-language-server
local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig")['vimls'].setup({
        cmd = { DATA .. "/mason/bin/vim-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
        root_dir = function(fname)
            return require("lspconfig/util").find_git_ancestor(fname) or vim.fn.getcwd()
        end,
    })
end

return M
