local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local execute = vim.api.nvim_command

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)

  -- packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use {'christianchiarulli/nvcode-color-schemes.vim'}

  -- git
  use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

  -- multiple cursors
  use 'terryma/vim-multiple-cursors'

  -- emmet
  use 'mattn/emmet-vim'

  -- markdown
  use 'tpope/vim-markdown'
  use {'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()'}
  use 'christoomey/vim-tmux-navigator'

  -- highlight yank
  use 'machakann/vim-highlightedyank'


  -- telescope for fuzzy find
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use 'nvim-telescope/telescope-media-files.nvim'

  -- tagbar
  use 'preservim/tagbar'

  -- go vim
  use {'fatih/vim-go', run=':GoUpdateBinaries'}

  -- rust
  use 'rust-lang/rust.vim'

  -- vim easy align
  use 'junegunn/vim-easy-align'

  -- bracey vim (a live server)
  use {'turbio/bracey.vim', run = 'npm install --prefix server'}

  -- lazygit
  use 'kdheepak/lazygit.nvim'

	-- lsp
  use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}
  use 'kosayoda/nvim-lightbulb'
  use 'onsails/lspkind-nvim'
	use {'glepnir/lspsaga.nvim'}
	use {
    'hrsh7th/nvim-compe',
  }

	-- snippet
	use {'hrsh7th/vim-vsnip'}
	use {'cstrap/python-snippets'}
	use {'ylcnfrht/vscode-python-snippet-pack'}
	use {'xabikos/vscode-javascript'}
	use {'golang/vscode-go'}
	use {'rust-lang/vscode-rust'}

	-- database
	use {'kristijanhusak/vim-dadbod-completion'}
	use {'tpope/vim-dadbod'}
	use {'kristijanhusak/vim-dadbod-ui'}

	-- which-key
	use {'AckslD/nvim-whichkey-setup.lua', requires = {'liuchengxu/vim-which-key'}}

	-- ts-rainbow
	use 'p00f/nvim-ts-rainbow'

	-- colorizer
	use 'norcalli/nvim-colorizer.lua'

  -- auto-pairs
	-- use {'windwp/nvim-autopairs'}
  use {'jiangmiao/auto-pairs'}

	-- nvim-web-devicons
	use {'kyazdani42/nvim-web-devicons'}

  -- barbar
  use {'romgrk/barbar.nvim'}

  -- galaxyline
  use {'glepnir/galaxyline.nvim'}

  -- nvim-tree
  use {'kyazdani42/nvim-tree.lua'}

  -- dashboard
  use 'glepnir/dashboard-nvim'

  -- documentation generator
  use {'kkoomen/vim-doge', run = ':call doge#install()'}

  -- indent
  use {'lukas-reineke/indent-blankline.nvim', branch = 'master'}

  -- rnvimr
  -- use 'kevinhwang91/rnvimr'

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
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
        }
      }
    end
  }
  -- floatterm
  use {
    "numtostr/FTerm.nvim",
    config = function()
      require("FTerm").setup({
        dimensions = {
          height = 0.6,
          width = 0.5,
          x = 1,
          y = 0,
        },
        border = 'single'
      })
    end
  }

  -- git blame
  use {'f-person/git-blame.nvim' }

  -- Comments
  use {
    "terrortylor/nvim-comment",
    event = "BufRead",
    config = function()
      local status_ok, nvim_comment = pcall(require, "nvim_comment")
      if not status_ok then
        return
      end
      nvim_comment.setup()
    end,
  }
  -- Javascript / Typescript
  use {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  }
  -- formatter
  use {'mhartington/formatter.nvim'}

end)
