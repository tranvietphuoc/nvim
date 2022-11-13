local M = {}

function M.setup()
    require("lspconfig").jdtls.setup({
        cmd = { DATA .. "/mason/bin/jdtls" },
    })
end
