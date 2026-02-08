local function setup()
    vim.lsp.config("bashls", {
        cmd = { DATA .. "/mason/bin/bash-language-server", "start" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "sh", "fish", "zsh" },
        root_dir = (function()
            local root = vim.fs.find({ ".git" }, { upward = true })[1]
            return root and vim.fs.dirname(root) or vim.fn.getcwd()
        end)(),
    })
    vim.lsp.enable("bashls")
end

return {
    setup = setup,
}
