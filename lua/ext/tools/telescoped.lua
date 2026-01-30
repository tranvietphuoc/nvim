return {
    setup = function()
        local telescope = require("telescope")
        local trouble = require("trouble.sources.telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = { ["<c-t>"] = trouble.open },
                    n = { ["<c-t>"] = trouble.open },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },
            },
        })

        pcall(telescope.load_extension, "fzf")
    end,

    setup_commander = function()
        local ok, command_center = pcall(require, "commander")
        if not ok then return end

        command_center.add({
            {
                desc = "Open command_center",
                cmd = "<CMD>Telescope command_center<CR>",
                keys = { { "n", "<Leader>fc", { noremap = true, silent = true } } },
            },
        })
    end,
}
