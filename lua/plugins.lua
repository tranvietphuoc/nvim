local M = {}

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

function M.setup()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap =
            fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    end
    local packer = require("packer")
    packer.startup(function(use)
        -- packer can manage itself as an optional plugin
        use({ "wbthomason/packer.nvim" })

        -- mason
        use({ "williamboman/mason.nvim" })
        use({
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("lsp.masonconf").setup()
            end,
        })

        -- colorscheme
        -- use("Mofiqul/dracula.nvim")
        -- use({ "folke/tokyonight.nvim" })
        use({
            "EdenEast/nightfox.nvim",
            run = ":NightfoxCompile",
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
        })

        -- git
        use({
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
            },

            config = function()
                require("ext.gitsign").setup()
            end,
            -- tag = 'release' -- To use the latest release
        })
        use({
            "tpope/vim-fugitive",
            config = function()
                require("ext.fugitive").setup()
            end,
        })
        use({ "tpope/vim-rhubarb" })
        use({ "junegunn/gv.vim" })
        -- git blame
        use({
            "f-person/git-blame.nvim",
            config = function()
                require("ext.git-blame").setup()
            end,
        })
        -- neogit
        use({
            "TimUntersberger/neogit",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("ext.neogit").setup()
            end,
        })

        -- java
        use("mfussenegger/nvim-jdtls")
        -- treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("ext.treesitter").setup()
            end,
        })

        -- multiple cursors
        use({ "terryma/vim-multiple-cursors" })

        -- emmet
        -- use({
        --     "mattn/emmet-vim",
        --     config = function()
        --         require("lsp.emmet").setup()
        --     end,
        -- })

        -- tabline
        use({
            "romgrk/barbar.nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("ext.barbar").setup()
            end,
        })

        -- markdown
        use({
            "tpope/vim-markdown",
            config = function()
                require("ext.markdown").setup()
            end,
        })
        use({ "iamcco/markdown-preview.nvim", run = ":call mkdp#util#install()" })
        use({ "christoomey/vim-tmux-navigator" })

        -- highlight yank
        use({ "machakann/vim-highlightedyank" })

        use({ "nvim-lua/popup.nvim" })
        use({ "nvim-lua/plenary.nvim" })

        -- tagbar
        use({ "preservim/tagbar" })
        -- go vim
        use({ "fatih/vim-go", run = ":GoUpdateBinaries" })

        -- rust
        use({ "rust-lang/rust.vim" })
        use({ "simrat39/rust-tools.nvim" })

        -- vim easy align
        use({
            "junegunn/vim-easy-align",
            config = function()
                require("ext.easy-align").setup()
            end,
        })

        -- lsp
        use({ "neovim/nvim-lspconfig" })

        use({ "onsails/lspkind-nvim" })
        use({ "glepnir/lspsaga.nvim" })
        -- auto-completion
        use({ "hrsh7th/nvim-cmp" }) -- Autocompletion plugin
        use({ "hrsh7th/cmp-nvim-lsp" }) -- LSP source for nvim-cmp'
        use({ "hrsh7th/cmp-buffer" })
        use({ "hrsh7th/cmp-path" })
        use({ "hrsh7th/cmp-cmdline" })
        use({ "L3MON4D3/LuaSnip" })
        use({ "saadparwaiz1/cmp_luasnip" })
        use({ "rafamadriz/friendly-snippets" })
        use({ "hrsh7th/vim-vsnip" })
        use({ "hrsh7th/cmp-vsnip" })

        -- filetype.nvim
        use({ "nathom/filetype.nvim" })
        -- snippet
        use({ "cstrap/python-snippets" })
        use({ "ylcnfrht/vscode-python-snippet-pack" })
        use({ "xabikos/vscode-javascript" })
        use({ "golang/vscode-go" })
        use({ "rust-lang/vscode-rust" })

        -- database
        use({ "kristijanhusak/vim-dadbod-completion" })
        use({ "tpope/vim-dadbod" })
        use({ "kristijanhusak/vim-dadbod-ui" })

        -- ts-rainbow
        use({
            "p00f/nvim-ts-rainbow",
            config = function()
                require("ext.ts-rainbow").setup()
            end,
        })

        -- colorizer
        use({
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("ext.colorizer").setup()
            end,
        })

        -- auto-pairs
        use({ "windwp/nvim-autopairs" })

        -- nvim-web-devicons
        use({
            "kyazdani42/nvim-web-devicons",
            config = function()
                require("ext.devicon").setup()
            end,
        })

        -- lualine
        use({
            "nvim-lualine/lualine.nvim",
            -- after = "github-nvim-theme",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
            -- config = function()
            --     require("lualine").setup({
            --         options = {
            --             theme = "github_dark",
            --         },
            --     })
            -- end,
        })

        -- nvim-tree
        use({
            "kyazdani42/nvim-tree.lua",
            require = "kyazdani42/nvim-web-devicons",
            config = function()
                require("ext.tree").setup()
            end,
        })
        -- dashboard
        use({
            "glepnir/dashboard-nvim",
            config = function()
                require("ext.dash").setup()
            end,
        })

        -- indent
        use({
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("ext.indent").setup()
            end,
        })

        use({
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
        })

        -- Comments
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("ext.comment").setup()
            end,
        })

        -- Javascript / Typescript
        use({
            "jose-elias-alvarez/nvim-lsp-ts-utils",
            ft = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
        })

        use({ "jose-elias-alvarez/null-ls.nvim" })

        use({
            "akinsho/toggleterm.nvim",
            config = function()
                require("ext.terminal").setup()
            end,
        })
        use({
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
        })

        -- debugger
        use({ "puremourning/vimspector" })

        -- use({ "mfussenegger/nvim-dap" })

        use({
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup()
            end,
        })

        -- github copilot
        -- use({ "github/copilot.vim" })

        -- fzf fuzzy finder
        use({ "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } })
        use({ "junegunn/fzf.vim", requires = { "junegunn/fzf", run = "./install --bin" } })

        -- statusline components
        use({
            "SmiteshP/nvim-gps",
            requires = "nvim-treesitter/nvim-treesitter",
            config = function()
                require("nvim-gps").setup()
            end,
        })
        use({
            "pwntester/octo.nvim",
            requires = { "nvim-telescope/telescope.nvim" },
            config = function()
                require("octo").setup()
            end,
        })

        -- find and replace tool
        use({ "windwp/nvim-spectre" })
        use({
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
        })
        use({ "chrisbra/csv.vim" })

        -- live server
        use({ "manzeloth/live-server" })

        -- scala metal
        use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })

        if packer_bootstrap then
            packer.sync()
        end
    end)
end

return M
