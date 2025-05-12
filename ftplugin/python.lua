-- ~/.config/nvim/ftplugin/python.lua
-- Tự động bật pyright nếu cần

--[[ vim.schedule(function()
    local clients = vim.lsp.get_clients({ name = "pyright" })
    if vim.bo.filetype == "python" and #clients == 0 then
        vim.cmd("LspStart pyright")
    end
end) ]]
