local M = {}

local ensure_installed = {
    "markdown",
    "markdown_inline",
    "javascript",
    "dockerfile",
    "scss",
    "scala",
    "toml",
    "rst",
    "html",
    "xml",
    "css",
    "bash",
    "lua",
    "c",
    "cpp",
    "python",
    "llvm",
    "rust",
    "go",
    "json",
    "tsx",
    "latex",
    "typescript",
    "gitignore",
    "regex",
    "vue",
    "svelte",
    "java",
    "php",
    "elixir",
    "ocaml",
    "haskell",
}

function M.setup()
    local group = vim.api.nvim_create_augroup("config_treesitter", { clear = true })
    vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "TSUpdate",
        callback = function()
            require("nvim-treesitter.parsers").solidity = {
                install_info = {
                    url = "https://github.com/JoranHonig/tree-sitter-solidity",
                    generate = true,
                },
            }
        end,
    })

    local treesitter = require("nvim-treesitter")
    treesitter.setup()
    treesitter.install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
            if pcall(vim.treesitter.start, args.buf) then
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        end,
    })
end

function M.setup_textobjects()
    require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")
    local swap = require("nvim-treesitter-textobjects.swap")

    local select_keymaps = {
        af = "@function.outer",
        ["if"] = "@function.inner",
        ac = "@class.outer",
        ic = "@class.inner",
    }
    for lhs, query in pairs(select_keymaps) do
        local query_name = query
        vim.keymap.set({ "x", "o" }, lhs, function()
            select.select_textobject(query_name, "textobjects")
        end)
    end

    local move_keymaps = {
        ["]m"] = { move.goto_next_start, "@function.outer" },
        ["]]"] = { move.goto_next_start, "@class.outer" },
        ["]M"] = { move.goto_next_end, "@function.outer" },
        ["]["] = { move.goto_next_end, "@class.outer" },
        ["[m"] = { move.goto_previous_start, "@function.outer" },
        ["[["] = { move.goto_previous_start, "@class.outer" },
        ["[M"] = { move.goto_previous_end, "@function.outer" },
        ["[]"] = { move.goto_previous_end, "@class.outer" },
    }
    for lhs, mapping in pairs(move_keymaps) do
        local action, query = mapping[1], mapping[2]
        vim.keymap.set({ "n", "x", "o" }, lhs, function()
            action(query, "textobjects")
        end)
    end

    vim.keymap.set("n", "<Leader>rx", function()
        swap.swap_next("@parameter.inner")
    end)
    vim.keymap.set("n", "<Leader>rX", function()
        swap.swap_previous("@parameter.inner")
    end)
end

return M
