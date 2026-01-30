local function list_mappings()
    local modes = {'n', 'i', 'v', 'x', 's', 'o', 't'}
    local output = {}
    for _, mode in ipairs(modes) do
        table.insert(output, "--- MODE: " .. mode .. " ---")
        local maps = vim.api.nvim_get_keymap(mode)
        for _, map in ipairs(maps) do
            table.insert(output, string.format("%s %s -> %s", map.mode, map.lhs, map.rhs or map.callback or ""))
        end
    end
    vim.fn.writefile(output, "/home/phuoctv/.config/nvim/mappings.txt")
end

list_mappings()
