-- npm install -g vim-language-server


local function setup()
    vim.lsp.config("vimls", {
        cmd = { DATA .. "/mason/bin/vim-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        root_dir = function(fname)
            local found = vim.fs.find({ ".git" }, { upward = true, path = fname })[1]
            if found then
                return vim.fs.dirname(found)
            end
            return vim.fn.getcwd()
        end,
    })
    vim.lsp.enable("vimls")
end

return {
    setup = setup,
}
