# My configurations for Neovim editor

Currently, I use `Neovim` on `macOS`, so this guide will work well on `macOS` only. I'll update for another platforms later...
This configuration supports (includes syntax highlighting and autocompletion) for these languages:

- `Python`
- `Javascript`
- `Typescript`
- `Rust`
- `C`
- `C++`
- `Go`
- `Html`
- `Css`
- `Lua`
- `Cmake`
- `Json`
- `Docker`
- `Yaml`

## Prequisition:

You need to install these tools first:

- `neovim`
- `python3.+`
- `nodejs` and `npm`
- [lua-language-server](<https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)>)
- [rust-analyzer](https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary)
- [gopls](https://github.com/golang/tools/blob/master/gopls/doc/vim.md)
- [clangd](https://clangd.llvm.org/installation.html)

### Neovim

In order to have all the newest features, you should install the [Nightly version](https://github.com/neovim/neovim/wiki/Installing-Neovim).

### Python providers

I've used `python3` as a default version on my mac. If you use another versions of `Python`.
Please edit the `g:python3_host_prog` variable to probably path to your `Python`.
If your machine doesn't have any versions of `Python`, you could install [follow this](https://www.python.org/).
After install `Python`, you must install `pynvim`

```
pip3 install pynvim
```

### Nodejs and npm

There're a lot of plugins that use external packages (like language server protocol,...) of Neovim. And we need to install [Nodejs and npm via download](https://nodejs.org/en/download/)
[or via package manager](https://nodejs.org/en/download/package-manager/).

`neovim` Nodejs client is also needed:

```
npm install -g neovim
```

## How to use it?

Run this command:

```
curl -sSL https://github.com/tranvietphuoc/nvim/blob/master/install.sh | sh
```

and then type to the terminal command:

```
nvim
```

to open the editor first, then run command:

```
:PackerInstall

```

then install the LSP with [LspInstall](https://github.com/kabouzeid/nvim-lspinstall)

I use `efm-langserver` for linting and formatting.

`:LspInstall efm`

to install all plugins of editor. `:q` to quit and open it again.

You can config your settings in `user-config.lua` file


## Some basic keys mapping of this configuration.

---

|     Keys     |                   Command                    |
| :----------: | :------------------------------------------: |
|     `,`      |           `Leader`(`n`, `v` mode)            |
| `<Leader>/`  |              `:Commentary<CR>`               |
| `<Leader>t`  |             `:TagbarToggle<CR>`              |
| `<Leader>n`  |            `:NERDTreeToggle<CR>`             |
|   `<TAB>`    |                 `:bnext<CR>`                 |
|  `<S-TAB>`   |               `:bprevious<CR>`               |
|   `<S-c>`    |                  `:bdelete<CR>`              |
|     `qq`     |                   `<Esc>`                    |
| `<Leader>ff` |       `<cmd>Telescope find_files<CR>`        |
| `<Leader>fg` |        `<cmd>Telescope live_grep<CR>`        |
| `<Leader>fb` |         `<cmd>Telescope buffers<CR>`         |
| `<Leader>fh` |        `<cmd>Telescope help_tags<CR>`        |
|     `,,`     | Trigger `Leader` key in `i` mode of `emmet`  |
| `<Leader>ft` |         `g:floatterm_keymap_toggle`          |
| `<Leader>fn` |          `g:floatterm_keymap_next`           |
| `<Leader>fp` |          `g:floatterm_keymap_prev`           |
| `<Leader>fw` |           `g:floatterm_keymap_new`           |
| `<Leader>mp` |  `<Plug>MarkdownPreview` live server for md  |
| `<Leader>ms` | `<Plug>MarkdownPreviewStop` stop live server |
| `<Leader>lg` |                `:LazyGit<CR>`                |
| `<Leader>li` | `:Bracey<CR>` live server for html, js, css  |
| `<Leader>ls` |      `:BraceyStop<CR>` stop live server      |

---


## Thanks to these plugins.

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
- [nanotee/nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)
- [ChristianChiarulli/nvcode-color-schemes.vim](https://github.com/ChristianChiarulli/nvcode-color-schemes.vim)
- [mhinz/vim-signify](https://github.com/mhinz/vim-signify)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb)
- [junegunn/gv.vim](https://github.com/junegunn/gv.vim)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [mengelbrecht/lightline-bufferline](https://github.com/mengelbrecht/lightline-bufferline)
- [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)
- [mattn/emmet-vim](https://github.com/mattn/emmet-vim)
- [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [machakann/vim-highlightedyank](https://github.com/machakann/vim-highlightedyank)
- [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-telescope/telescope-media-files.nvim](https://github.com/nvim-telescope/telescope-media-files.nvim)
- [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)
- [preservim/tagbar](https://github.com/preservim/tagbar)
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
- [fatih/vim-go](https://github.com/fatih/vim-go)
- [rust-lang/rust.vim](https://github.com/rust-lang/rust.vim)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [glepnir/galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim)
- [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)
- [colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [glepnir/dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- and more in plugin.lua file...
