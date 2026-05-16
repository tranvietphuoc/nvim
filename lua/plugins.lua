return {
    setup = function()
        -- bootstrap lazy.nvim
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not vim.loop.fs_stat(lazypath) then
            vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", --latest stable release
                lazypath,
            })
        end

        vim.opt.rtp:prepend(lazypath)

        require("lazy").setup({

            -- mason
            {
                "williamboman/mason.nvim",
                dependencies = {
                    "williamboman/mason-lspconfig.nvim",
                    "WhoIsSethDaniel/mason-tool-installer.nvim",
                    "jay-babu/mason-nvim-dap.nvim",
                },
                config = function()
                    require("lsp.mason").setup()
                end,
            },

            -- colorscheme
            { "NLKNguyen/papercolor-theme", lazy = false, priority = 1000 },
            { "rebelot/kanagawa.nvim" },
            {
                "folke/tokyonight.nvim",
                lazy = false,
                priority = 1000,
                opts = {},
            },

            -- clangd extensions
            { "p00f/clangd_extensions.nvim" },

            -- git
            {
                "lewis6991/gitsigns.nvim",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
                config = function()
                    require("ext.tools.gitsign").setup()
                end,
            },
            {
                "sindrets/diffview.nvim",
            },
            {
                "isakbm/gitgraph.nvim",
                dependencies = {
                    "sindrets/diffview.nvim",
                },
                opts = {
                    git_cmd = "git",
                    symbols = {
                        merge_commit = "M",
                        commit = "*",
                    },
                    format = {
                        timestamp = "%H:%M:%S %d-%m-%Y",
                        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
                    },
                    hooks = {
                        on_select_commit = function(commit)
                            vim.notify("DiffviewOpen " .. commit.hash .. "^!")
                            vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
                        end,
                        on_select_range_commit = function(from, to)
                            vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
                            vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
                        end,
                    },
                },
            },
            {
                "rhysd/git-messenger.vim",
            },
            {
                "tpope/vim-fugitive",
                config = function()
                    require("ext.tools.fugitive").setup()
                end,
            },
            { "tpope/vim-rhubarb" },
            { "junegunn/gv.vim" },
            -- git blame
            {
                "f-person/git-blame.nvim",
                config = function()
                    require("ext.tools.git-blame").setup()
                end,
            },
            -- neogit
            {
                "NeogitOrg/neogit",
                dependencies = {

                    "nvim-lua/plenary.nvim", -- required
                    "sindrets/diffview.nvim", -- optional - Diff integration

                    "nvim-telescope/telescope.nvim", -- optional
                    "ibhagwan/fzf-lua", -- optional
                    "echasnovski/mini.pick", -- optional
                },
                config = true,
            },

            -- java
            { "mfussenegger/nvim-jdtls" },

            -- treesitter
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function()
                    require("ext.tools.treesitter").setup()
                end,
            },

            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                after = "nvim-treesitter",
                dependencies = "nvim-treesitter/nvim-treesitter",
            },

            -- multiple cursors
            { "terryma/vim-multiple-cursors" },

            -- tabline
            {
                "romgrk/barbar.nvim",
                dependencies = { "lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons" },
                config = function()
                    require("ext.tools.barbar").setup()
                end,
            },

            -- markdown
            {
                "tpope/vim-markdown",
                config = function()
                    require("ext.tools.markdown").setup()
                end,
            },
            { "christoomey/vim-tmux-navigator" },

            -- highlight yank
            { "machakann/vim-highlightedyank" },

            { "nvim-lua/plenary.nvim" },

            -- go vim
            { "fatih/vim-go", build = ":GoUpdateBinaries" },

            -- vim easy align
            {
                "junegunn/vim-easy-align",
                config = function()
                    require("ext.tools.easy-align").setup()
                end,
            },

            -- lsp
            {
                "neovim/nvim-lspconfig",
            },

            { "onsails/lspkind-nvim" },
            {
                "nvimdev/lspsaga.nvim",
                event = "LspAttach",
                config = function()
                    require("lspsaga").setup({})
                end,
                dependencies = {
                    { "nvim-tree/nvim-web-devicons" },
                    --Please make sure you install markdown and markdown_inline parser
                    { "nvim-treesitter/nvim-treesitter" },
                },
            },
            {
                "j-hui/fidget.nvim",
                opts = {
                    -- options
                },
            },

            -- auto-completion
            {
                "hrsh7th/nvim-cmp",
            }, -- Autocompletion plugin
            { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp'
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },

            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    "mstuttgart/vscode-odoo-snippets",
                    "cstrap/python-snippets",
                    "xabikos/vscode-javascript",
                    "golang/vscode-go",
                    "rust-lang/vscode-rust",
                },
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
            { "saadparwaiz1/cmp_luasnip" },

            -- snippet
            -- { "cstrap/python-snippets" },
            -- { "xabikos/vscode-javascript" },
            -- { "golang/vscode-go" },
            -- { "rust-lang/vscode-rust" },

            -- database
            {
                "kristijanhusak/vim-dadbod-completion",
                config = function()
                    require("ext.tools.db-completion").setup()
                end,
            },
            { "tpope/vim-dadbod" },
            { "kristijanhusak/vim-dadbod-ui" },

            -- ts-rainbow
            {
                "HiPhish/rainbow-delimiters.nvim",
                -- branch = "main",
                config = function()
                    require("ext.tools.rainbow-delimiters").setup()
                end,
            },

            -- colorizer
            {
                "norcalli/nvim-colorizer.lua",
                config = function()
                    require("ext.tools.colorizer").setup()
                end,
            },

            -- auto-pairs
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("ext.tools.autopairs").setup()
                end,
            },

            -- nvim-web-devicons
            {
                "nvim-tree/nvim-web-devicons",
                config = function()
                    require("ext.tools.devicon").setup()
                end,
            },

            -- lualine
            {
                "nvim-lualine/lualine.nvim",
                -- after = "github-nvim-theme",
                dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
                config = function()
                    require("ext.tools.lualine").setup()
                end,
            },

            -- nvim-tree
            {
                "nvim-tree/nvim-tree.lua",
                version = "*",
                lazy = false,
                dependencies = { "nvim-tree/nvim-web-devicons" },
                config = function()
                    require("ext.tools.tree").setup()
                end,
            },

            -- indent
            {
                "lukas-reineke/indent-blankline.nvim",
                main = "ibl",
                opts = {},
                config = function()
                    require("ext.tools.indent-blankline").setup()
                end,
            },

            {
                "folke/zen-mode.nvim",
                config = function()
                    require("zen-mode").setup({
                        window = {
                            backdrop = 0.95,
                            width = 120, -- width of the Zen window
                            height = 1, -- height of the Zen window
                            options = {
                                signcolumn = "no",
                                number = true,
                                relativenumber = true,
                                cursorline = true,
                                cursorcolumn = false,
                                list = false,
                            },
                        },
                    })
                end,
            },

            -- Comments
            {
                "numToStr/Comment.nvim",
                config = function()
                    require("ext.tools.comment").setup()
                end,
            },

            -- Javascript / Typescript
            {
                "pmizio/typescript-tools.nvim",
                dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
                opts = {},
            },

            {
                "folke/snacks.nvim",
                lazy = false,
                priority = 1000,
                ---@module 'snacks'
                ---@type snacks.Config
                opts = {
                    terminal = {
                        win = {
                            position = "bottom",
                            height = 11,
                        },
                    },
                    styles = {
                        terminal = {
                            keys = {
                                term_normal = {
                                    "jk",
                                    function(self)
                                        vim.cmd("stopinsert")
                                    end,
                                    mode = "t",
                                    desc = "Normal mode",
                                },
                            },
                        },
                        gitui = {
                            position = "float",
                            width = 0.9,
                            height = 0.9,
                            bo = { filetype = "snacks_terminal" },
                            keys = { q = "hide" },
                        },
                    },
                },
                keys = {
                    {
                        "<leader>`",
                        function()
                            Snacks.terminal.toggle()
                        end,
                        desc = "Toggle Terminal",
                    },
                    {
                        "<leader>gu",
                        function()
                            Snacks.terminal.toggle("gitui", { win = { style = "gitui" } })
                        end,
                        desc = "Toggle GitUI",
                    },
                },
                config = function(_, opts)
                    require("snacks").setup(opts)
                    -- terminal mode navigation keymaps
                    vim.api.nvim_create_autocmd("TermOpen", {
                        callback = function()
                            local buf_opts = { buffer = 0 }
                            vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], buf_opts)
                            vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], buf_opts)
                            vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], buf_opts)
                            vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], buf_opts)
                        end,
                    })
                end,
            },

            -- doxygen
            {
                "kkoomen/vim-doge",
                build = ":DoGeUpdate",
                config = function()
                    require("ext.tools.doge").setup()
                end,
            },

            -- debugger
            { "mfussenegger/nvim-dap" },
            { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

            -- statusline components

            {
                "SmiteshP/nvim-navic",
                dependencies = "neovim/nvim-lspconfig",
            },
            {
                "nvim-telescope/telescope.nvim",
                branch = "0.1.x",
                dependencies = { { "nvim-lua/plenary.nvim" } },
                lazy = false,
                config = function()
                    require("ext.tools.telescoped").setup()
                end,
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
            },
            {
                "FeiyouG/commander.nvim",
                dependencies = { "nvim-telescope/telescope.nvim" },
                config = function()
                    require("ext.tools.telescoped").setup_commander()
                end,
            },
            {
                "pwntester/octo.nvim",
                dependencies = {
                    "nvim-telescope/telescope.nvim",
                    "nvim-tree/nvim-web-devicons",
                    "nvim-lua/plenary.nvim",
                },
                config = function()
                    require("octo").setup()
                end,
            },

            -- find and replace tool
            { "windwp/nvim-spectre" },
            {
                "folke/trouble.nvim",
                dependencies = "nvim-tree/nvim-web-devicons",
                cmd = "Trouble",
                config = function()
                    require("trouble").setup({})
                end,
            },
            {
                "chrisbra/csv.vim",
                config = function()
                    vim.g.csv_delim = ","
                    vim.g.csv_highlight_column = "y"

                    -- Tạo autocmd tự động chạy ArrangeColumn và bật conceal khi mở csv
                    vim.api.nvim_create_autocmd("FileType", {
                        pattern = "csv",
                        callback = function()
                            vim.opt_local.conceallevel = 2
                            vim.opt_local.concealcursor = "nc"
                            vim.cmd("silent! ArrangeColumn")
                        end,
                    })
                end,
            },
            {
                "godlygeek/tabular",
                cmd = { "Tabularize" },
                keys = {
                    { "<leader>tc", ":Tabularize /,<CR>", desc = "Align column CSV with ," },
                },
            },

            -- live server
            {
                "barrett-ruth/live-server.nvim",
                init = function()
                    vim.g.live_server = {}
                end,
            },

            -- scala metal
            {
                "scalameta/nvim-metals",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    {
                        "j-hui/fidget.nvim",
                        opts = {},
                    },
                },
                ft = { "scala", "sbt" },
            },

            -- csharp

            { "Hoffs/omnisharp-extended-lsp.nvim" },

            {
                "mfussenegger/nvim-lint",
                event = { "BufReadPre", "BufNewFile" },
                config = function()
                    require("ext.tools.linting").setup()
                end,
            }, -- linting
            {
                "stevearc/conform.nvim",
                opts = {},
                config = function()
                    require("ext.tools.formatting").setup()
                end,
            },

            -- venv selector
            {
                "linux-cultist/venv-selector.nvim",
                enabled = function()
                    return vim.fn.executable("fd") == 1 or vim.fn.executable("fdfind") == 1
                end,
                dependencies = {
                    "nvim-telescope/telescope.nvim",
                    branch = "0.1.x",
                    dependencies = { "nvim-lua/plenary.nvim" },
                },
                ft = "python",
                opts = {
                    search = {},
                    options = {},
                },
                keys = {
                    -- Keymap to open VenvSelector to pick a venv.
                    { "<leader>vs", "<cmd>VenvSelect<cr>" },
                    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
                },
            },
            {
                "nanotee/sqls.nvim",
                config = function()
                    vim.lsp.config("sqls", {
                        on_attach = function(client, bufnr)
                            require("sqls").on_attach(client, bufnr)
                        end,
                    })
                end,
            },
            {
                "stevearc/oil.nvim",
                ---@module 'oil'
                ---@type oil.SetupOpts
                opts = {},
                -- Optional dependencies
                dependencies = { { "echasnovski/mini.icons", opts = {} } },
                -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
                -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
                lazy = false,
                config = function()
                    require("oil").setup({
                        -- Your configuration comes here
                        -- You can also omit the options and use the default settings
                        -- See:
                    })
                end,
            },
            {
                "folke/which-key.nvim",
                lazy = false,
                config = function()
                    require("ext.tools.whichkey").setup()
                end,
            },

            {
                "Zeioth/markmap.nvim",
                build = "yarn global add markmap-cli",
                cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
                opts = {
                    html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
                    hide_toolbar = false, -- (default)
                    grace_period = 3600000, -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
                },
                config = function(_, opts)
                    require("markmap").setup(opts)
                end,
            },
            {
                "coder/claudecode.nvim",
                config = function()
                    vim.api.nvim_set_hl(0, "ClaudeTermBg", { bg = "#1a1b26", fg = "#a9b1d6", ctermbg = 0, ctermfg = 7 })
                    require("claudecode").setup({
                        terminal = {
                            snacks_win_opts = {
                                wo = {
                                    winhl = "Normal:ClaudeTermBg,FloatBorder:ClaudeTermBg",
                                },
                            },
                        },
                    })
                end,
                keys = {
                    { "<leader>a", nil, desc = "AI/Claude Code" },
                    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
                    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
                    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
                    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
                    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
                    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
                    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
                    {
                        "<leader>as",
                        "<cmd>ClaudeCodeTreeAdd<cr>",
                        desc = "Add file",
                        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
                    },
                    -- Diff management
                    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
                    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
                },
            },
            {
                "MeanderingProgrammer/render-markdown.nvim",
                dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
                ft = { "markdown", "gitcommit" },
                ---@module 'render-markdown'
                ---@type render.md.UserConfig
                opts = {
                    render_modes = { "n", "c", "t" },
                    debounce = 100,
                    max_file_size = 10.0,
                    win_options = {
                        conceallevel = {
                            default = vim.o.conceallevel,
                            rendered = 3,
                        },
                        concealcursor = {
                            default = vim.o.concealcursor,
                            rendered = "",
                        },
                    },
                },
            },
        })
    end,
}
