local function setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sh", "fish", "zsh" },
        callback = function(ev)
            local root = vim.fs.find({ ".git" }, { upward = true, path = vim.api.nvim_buf_get_name(ev.buf) })[1]
            local root_dir = root and vim.fs.dirname(root) or vim.fn.getcwd()

            vim.lsp.start({
                name = "bashls",
                cmd = { DATA .. "/mason/bin/bash-language-server", "start" },
                on_attach = require("lsp").common_on_attach,
                root_dir = root_dir,
            }, {
                bufnr = ev.buf,
            })
        end,
    })
end

return {
    setup = setup,
}
