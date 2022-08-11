-- npm install -g vim-language-server
local M = {}

function M.setup()
    require("lspconfig").vimls.setup({
        cmd = { DATA .. "/lsp_servers/vim/node_modules/.bin/vim-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        root_dir = function(fname)
            return require("lspconfig/util").find_git_ancestor(fname) or vim.fn.getcwd()
        end,
    })
end

return M
