" auto-install vim-plug
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" Plug
call plug#begin('$HOME/.config/nvim/autoload/plugged')

Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'NLKNguyen/papercolor-theme'

" Better Visual Guide
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
" Plug 'vim-syntastic/syntastic'

" Syntax check
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/1.x' }

" rust.vim
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Go vim
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Emmet.vim
Plug 'mattn/emmet-vim'

" Commentary
Plug 'tpope/vim-commentary'

" csv.vim
Plug 'chrisbra/csv.vim'

" Black - format code python
Plug 'psf/black', { 'tag': '*' }

" fzf search
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

"Highlighting color for files extenstion
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeTabsToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" tagbar for nvim
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

"autoclose in vim
Plug 'jiangmiao/auto-pairs'

"css
Plug 'ap/vim-css-color'

" python-syntax
Plug 'vim-python/python-syntax'

" vim python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" vim polyglot
Plug 'sheerun/vim-polyglot'

" startify
Plug 'mhinz/vim-startify'

" lua completion
Plug 'nvim-lua/completion-nvim'

call plug#end()
