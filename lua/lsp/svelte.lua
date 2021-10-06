local M = {}

function M.setup()
    require("lspconfig").svelte.setup({
        cmd = { DATA .. "/lspinstall/svelte/node_modules/.bin/svelteserver", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "svelte" },
    })
end

return M
