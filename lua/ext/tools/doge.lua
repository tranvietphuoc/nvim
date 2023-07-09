local M = {}

function M.setup()
    vim.g.doge_doc_standard_python = "numpy"
    vim.g.doge_mapping = "<leader>d"
    vim.g.doge_doc_standard_javascript = "jsdoc"
    vim.g.doge_filetype_aliases = {
        javascript = {
            "javascript.jsx",
            "javascriptreact",
            "javascript.tsx",
            "typescriptreact",
            "typescript",
            "typescript.tsx",
            "vue",
        },
    }
end

return M
