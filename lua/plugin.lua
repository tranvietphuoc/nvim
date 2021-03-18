local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute('packadd packer.nvim')
end

vim.cmd [[packadd packer.nvim]]

vim.cmd 'autocmd BufWritePost plugin.lua PackerCompile'  -- auto compile when ther are changes in plugin.lua

return require('packer').startup(function(use)
    -- packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- information
    use 'nanotee/nvim-lua-guide'

    -- colorscheme
    use 'NLKNguyen/papercolor-theme'

    -- git
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'junegunn/gv.vim'

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'
    -- status bar
    use 'itchyny/lightline.vim'
    use 'mengelbrecht/lightline-bufferline'

    -- multiple cursors
    use 'terryma/vim-multiple-cursors'

    -- indent line
    use 'Yggdroot/indentLine'

    -- emmet
    use 'mattn/emmet-vim'

    -- js
    use 'pangloss/vim-javascript'
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'mxw/vim-jsx'

    -- markdown
    use 'plasticboy/vim-markdown'
    use 'christoomey/vim-tmux-navigator'
    use 'machakann/vim-highlightedyank'

    -- syntax check
    use 'dense-analysis/ale'
    use {'neoclide/coc.nvim', branch='release'}
    use 'prettier/vim-prettier'

    -- telescope for fuzzy find
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    -- use 'junegunn/fzf'
    -- use 'junegunn/fzf.vim'

    -- startify
    use 'mhinz/vim-startify'

    -- polyglot
    use 'sheerun/vim-polyglot'

    -- python mode
    use 'python-mode/python-mode'

    -- python syntax
    use 'vim-python/python-syntax'

    -- css color
    use 'ap/vim-css-color'

    -- auto pairs
    use 'jiangmiao/auto-pairs'

    -- floatterm
    use 'voldikss/vim-floaterm'

    -- tagbar
    use 'preservim/tagbar'

    -- nerdtree
    use 'preservim/nerdtree'
    use 'jistr/vim-nerdtree-tabs'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'ryanoasis/vim-devicons'

    -- commentary
    use 'tpope/vim-commentary'

    -- go vim
    use 'fatih/vim-go'

    -- rust
    use 'rust-lang/rust.vim'
    use 'racer-rust/vim-racer'
    use 'autozimu/LanguageClient-neovim'

    -- csv
    use 'chrisbra/csv.vim'


end)