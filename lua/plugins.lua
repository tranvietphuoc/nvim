local M = {}

function M.setup()
    vim.opt.termguicolors = true
    -- bootstrap lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.uv.fs_stat(lazypath) then
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
        { "williamboman/mason.nvim",    build = ":MasonUpdate" },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("lsp.mason").setup()
            end,
        },

        -- colorscheme
        { "Mofiqul/dracula.nvim" },
        { "folke/tokyonight.nvim" },
        -- { "EdenEast/nightfox.nvim" },

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
            config = function()
                require("ext.tools.neogit").setup()
            end,
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
            dependencies = { "nvim-tree/nvim-web-devicons" },
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
        { "iamcco/markdown-preview.nvim",  build = ":call mkdp#util#install()" },
        { "christoomey/vim-tmux-navigator" },

        -- highlight yank
        { "machakann/vim-highlightedyank" },

        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },

        -- go vim
        { "fatih/vim-go",                  build = ":GoUpdateBinaries" },

        -- inlayHints
        {
            "lvimuser/lsp-inlayhints.nvim",
            branch = "anticonceal",
            opts = {},
            lazy = true,
            init = function()
                vim.api.nvim_create_autocmd("LspAttach", {
                    group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
                    callback = function(args)
                        if not (args.data and args.data.client_id) then
                            return
                        end
                        local client = vim.lsp.get_client_by_id(args.data.client_id)
                        require("lsp-inlayhints").on_attach(client, args.buf)
                    end,
                })
            end,
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
        { "neovim/nvim-lspconfig" },

        { "onsails/lspkind-nvim" },
        {
            "glepnir/lspsaga.nvim",
            opt = true,
            branch = "main",
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
        -- auto-completion
        { "hrsh7th/nvim-cmp" },     -- Autocompletion plugin
        { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp'
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
        { "rafamadriz/friendly-snippets" },
        { "hrsh7th/vim-vsnip" },
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
            "mrjones2014/nvim-ts-rainbow",
            config = function()
                require("ext.tools.ts-rainbow").setup()
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
            -- config = function()
            -- require("lualine").setup({
            -- options = {
            -- theme = "github_dark_colorblind",
            -- },
            -- })
            -- end,
            -- options = {
            -- theme = 'vscode'
            -- }
        },

        -- nvim-tree
        {
            "nvim-tree/nvim-tree.lua",
            require = "nvim-tree/nvim-web-devicons",
            config = function()
                require("ext.tools.tree").setup()
            end,
        },

        -- indent
        {
            "lukas-reineke/indent-blankline.nvim",
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
            "jose-elias-alvarez/nvim-lsp-ts-utils",
            ft = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
        },

        { "jose-elias-alvarez/null-ls.nvim" },

        {
            "akinsho/toggleterm.nvim",
            config = function()
                require("ext.tools.terminal").setup()
            end,
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

        {
            "folke/which-key.nvim",
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
            tag = "0.1.2",
            dependencies = { { "nvim-lua/plenary.nvim" } },
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
        {
            "FeiyouG/command_center.nvim",
            dependencies = { "nvim-telescope/telescope.nvim" },
        },
        {
            "pwntester/octo.nvim",
            dependencies = { "nvim-telescope/telescope.nvim" },
            config = function()
                require("octo").setup()
            end,
        },

        -- find and replace tool
        { "windwp/nvim-spectre" },
        {
            "folke/trouble.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
            config = function()
                require("trouble").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
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
        { "scalameta/nvim-metals",            dependencies = { "nvim-lua/plenary.nvim" } },

        -- csharp
        { "Hoffs/omnisharp-extended-lsp.nvim" },
    })
end

return M
