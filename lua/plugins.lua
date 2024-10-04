local M = {}

function M.setup()
    vim.opt.termguicolors = true
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
            build = ":MasonUpdate",
            opts = {
                ensure_installed = { "clang-format" }
            }
        },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("lsp.mason").setup()
            end,
        },
        {
            "jay-babu/mason-null-ls.nvim",
            event = { "BufReadPre", "BufNewFile" },
            dependencies = {
                "williamboman/mason.nvim",
                "nvimtools/none-ls.nvim",
            },
            config = function()
                require("mason-null-ls").setup({
                    ensure_installed = { "stylua", "checkstyle", "clang-format", "prettier",
                        "pg-format",
                        "scalafmt", "pycodestyle", "csharpier", "google-java-format", "mypy", "eslint_d",
                        "gitsigns", "java-debug-adapter", "cppcheck", "pylint", "markdownlint", "djlint", "scalafmt",
                        "ruff",
                        "djhtml",
                        "vaccum",
                        "dotenv_linter",
                        "gofumpt",
                        "goimports",
                        "black" }
                })
            end,
        },

        -- colorscheme
        { "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
        { "rebelot/kanagawa.nvim" },

        -- { "Mofiqul/vscode.nvim" },

        -- clangd extensions
        { "p00f/clangd_extensions.nvim" },

        --[[ use({
            "EdenEast/nightfox.nvim",
            build = ":NightfoxCompile",
            config = function()
                require("nightfox").setup({
                    options = {
                        styles = {
                            comments = "italic",
                            keywords = "bold",
                            types = "italic,bold",
                        },
                    },
                })
            end,
        }) ]]
        -- git
        {
            "lewis6991/gitsigns.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            config = function()
                require("ext.tools.gitsign").setup()
            end,
            -- tag = 'release' -- To use the latest release
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
            dependencies = "nvim-lua/plenary.nvim",
            config = true,
        },

        -- java
        { "mfussenegger/nvim-jdtls" },

        --[[ {
            'nvim-java/nvim-java',
            ft = 'java',
            dependencies = {
                'nvim-java/lua-async-await',
                'nvim-java/nvim-java-refactor',
                'nvim-java/nvim-java-core',
                'nvim-java/nvim-java-test',
                'nvim-java/nvim-java-dap',
                'MunifTanjim/nui.nvim',
                'neovim/nvim-lspconfig',
                'mfussenegger/nvim-dap',
                {
                    'williamboman/mason.nvim',
                    opts = {
                        registries = {
                            'github:nvim-java/mason-registry',
                            'github:mason-org/mason-registry',
                        },
                    },
                }
            },
        }, ]]
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
            dependencies = { 'lewis6991/gitsigns.nvim', "nvim-tree/nvim-web-devicons" },
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
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            build = "cd app && yarn install",
            config = function()
                vim.g.mkdp_filetypes = {
                    "markdown",
                }
            end,
            ft = {
                "markdown",
            },
        },
        { "christoomey/vim-tmux-navigator" },

        -- highlight yank
        { "machakann/vim-highlightedyank" },

        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },

        -- go vim
        { "fatih/vim-go",                  build = ":GoUpdateBinaries" },

        {
            "MysticalDevil/inlay-hints.nvim",
            event = "LspAttach",
            dependencies = { "neovim/nvim-lspconfig" },
        },


        -- rust
        -- use("simrat39/rust-tools.nvim")

        -- symbol-outline
        -- use("simrat39/symbols-outline.nvim")

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
            --[[ opts = {
                inlay_hints = { enable = true },
            }, ]]

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
        },                          -- Autocompletion plugin
        { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp'
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = "make install_jsregexp",
            dependencies = {
                "rafamadriz/friendly-snippets" }
        },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-vsnip" },

        -- snippet
        { "cstrap/python-snippets" },
        { "ylcnfrht/vscode-python-snippet-pack" },
        { "xabikos/vscode-javascript" },
        { "golang/vscode-go" },
        { "rust-lang/vscode-rust" },

        -- database
        { "kristijanhusak/vim-dadbod-completion" },
        { "tpope/vim-dadbod" },
        { "kristijanhusak/vim-dadbod-ui" },

        -- ts-rainbow
        {
            "HiPhish/rainbow-delimiters.nvim",
            -- branch = "use-children",
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
        { "windwp/nvim-autopairs" },

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
        },

        {
            "folke/zen-mode.nvim",
            config = function()
                require("zen-mode").setup({
                    window = {
                        backdrop = 0.95,
                        width = 120, -- width of the Zen window
                        height = 1,  -- height of the Zen window
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

        -- none-ls
        {
            "nvimtools/none-ls.nvim",

            event = "VeryLazy",
            opts = function()
                return require("lsp.nullls").setup()
            end,
            requires = { "nvim-lua/plenary.nvim" },
            dependencies = { "nvimtools/none-ls-extras.nvim", },
        },

        {
            "akinsho/toggleterm.nvim",
        },
        {
            "numtostr/FTerm.nvim",
            config = function()
                require("FTerm").setup({
                    dimensions = {
                        height = 0.6,
                        width = 0.5,
                        x = 1,
                        y = 0,
                    },
                    border = "single",
                })
            end,
        },

        -- debugger
        { "puremourning/vimspector" },
        { "mfussenegger/nvim-dap" },
        { "rcarriga/nvim-dap-ui",   dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            config = function()
                require("which-key").setup()
            end,
        },

        -- github copilot
        -- use({ "github/copilot.vim" })

        -- statusline components

        {
            "SmiteshP/nvim-navic",
            dependencies = "neovim/nvim-lspconfig",
        },
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.4",
            dependencies = { { "nvim-lua/plenary.nvim" } },
        },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
        {
            "FeiyouG/commander.nvim",
            dependencies = { "nvim-telescope/telescope.nvim" }
        },
        {
            "pwntester/octo.nvim",
            dependencies = { "nvim-telescope/telescope.nvim", 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim', },
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
                require("trouble").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
            keys = {
                {
                    "<leader>xx",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "Diagnostics (Trouble)",
                },
                {
                    "<leader>xX",
                    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                    desc = "Buffer Diagnostics (Trouble)",
                },
                {
                    "<leader>cs",
                    "<cmd>Trouble symbols toggle focus=false<cr>",
                    desc = "Symbols (Trouble)",
                },
                {
                    "<leader>cl",
                    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                    desc = "LSP Definitions / references / ... (Trouble)",
                },
                {
                    "<leader>xL",
                    "<cmd>Trouble loclist toggle<cr>",
                    desc = "Location List (Trouble)",
                },
                {
                    "<leader>xQ",
                    "<cmd>Trouble qflist toggle<cr>",
                    desc = "Quickfix List (Trouble)",
                },
            },
        },
        { "chrisbra/csv.vim" },

        -- live server
        {
            "barrett-ruth/live-server.nvim",
            config = function()
                require("live-server").setup({})
            end,
        },

        -- scala metal
        {
            "scalameta/nvim-metals",
            dependencies = { "nvim-lua/plenary.nvim", {
                "j-hui/fidget.nvim",
                opts = {},
            }, },
            ft = { "scala", "sbt" },
        },

        -- csharp

        { "Hoffs/omnisharp-extended-lsp.nvim" },

        -- distant -- remote neovim
        {
            'chipsenkbeil/distant.nvim',
            branch = 'v0.3',
            config = function()
                require('distant'):setup()
            end
        },
        --[[ {
            'wfxr/minimap.vim',
            build = "cargo install --locked code-minimap",
            init = function()
                vim.g.minimap_auto_start = true
                vim.g.minimap_width = 10
            end,
        } ]]

        -- roslyn
        --[[ {
            "seblj/roslyn.nvim",
            ft = "cs",
            on_attach = function(client, bufnr)
                require("lsp").common_on_attach(client, bufnr)
            end,

            opts = {
                -- your configuration comes here; leave empty for default settings
                config = {
                    settings = {
                        ["csharp|inlay_hints"] = {
                            csharp_enable_inlay_hints_for_implicit_object_creation = true,
                            csharp_enable_inlay_hints_for_implicit_variable_types = true,
                            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                            csharp_enable_inlay_hints_for_types = true,
                            dotnet_enable_inlay_hints_for_indexer_parameters = true,
                            dotnet_enable_inlay_hints_for_literal_parameters = true,
                            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                            dotnet_enable_inlay_hints_for_other_parameters = true,

                            dotnet_enable_inlay_hints_for_parameters = true,

                            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,

                        },
                        ["csharp|code_lens"] = {
                            dotnet_enable_references_code_lens = true,
                        },
                    }
                },
                exe = { "dotnet",
                    vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
                },
                filewatching = true,
                choose_sln = nil,
            }
        } ]]
    })
end

return M
