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
- `luajit`
- `gitui`
- [lua-language-server](<https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)>)
- [rust-analyzer](https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary)
- [gopls](https://github.com/golang/tools/blob/master/gopls/doc/vim.md)
- [clangd](https://clangd.llvm.org/installation.html)

### Neovim

In order to have all the newest features, you should install the [Nightly version](https://github.com/neovim/neovim/wiki/Installing-Neovim).

And also need to install `luajit` by command: `brew install --HEAD luajit`

### Python providers

I've used `python3` as a default version on my mac. If you use another versions of `Python`.
Please edit the `g:python3_host_prog` variable to your probably path of `Python` in `user-config.lua` file.
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

Run this command if you use fish shell:

```
bash (curl -s https://raw.githubusercontent.com/tranvietphuoc/nvim/master/install.sh | psub)
```

or if you use another shell:

```
bash <(curl -s https://raw.githubusercontent.com/tranvietphuoc/nvim/master/install.sh)
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


You can config your settings in `user-config.lua` file


## Some basic keys mapping of this configuration.

---

|     Keys     |                   Command               | Mode         | Comment                                  |
| :----------: | :--------------------------------------:|:------------:|:----------------------------------------:|
|     `,`      | `Leader`                                | `n` or`v`    | *Leader key*                             |
| `<Leader>/`  | `:CommentToggle<CR>`                    | **all mode** | *Comment out codes*                      |
| `<Leader>T`  | `:TagbarToggle<CR>`                     | `n`          | *Trigger tagbar*                         |
| `<Leader>n`  | `:NvimTreeToggle<CR>`                   | `n`          | *Trigger nvim-tree*                      |
|   `<TAB>`    | `:BufferNext<CR>`                       | `n`          | *Move to next tab*                       |
|  `<S-TAB>`   | `:BufferPrevious<CR>`                   | `n`          | *Move to previous tab*                   |
|   `<S-c>`    | `:BufferClose<CR>`                      | `n`          | *Close tab*                              |
|     `qq`     | `<Esc>`                                 | **all mode** | *Esc*                                    |
| `<Leader>f`  | `<cmd>Telescope find_files<CR>`         | `n`          | *find files*                             |
| `<Leader>g`  | `<cmd>Telescope live_grep<CR>`          | `n`          | *find words*                             |
| `<Leader>fb` | `<cmd>Telescope buffers<CR>`            | `n`          | *find buffers*                           |
| `<Leader>fh` | `<cmd>Telescope help_tags<CR>`          | `n`          | *help telescope*                         |
|     `,,`     | `Leader` key of `emmet`                 | `i`          | *trigger leader key of emmet*            |
| `<Leader>t`  | `<CMD>lua require("FTerm").toggle()<CR>`| `n` or `t`   | *trigger float terminal*                 |
| `<Leader>z`  | `:ZenMode<CR>`                          | `n`          | *active zen mode*                        |
| `<Leader>m`  | `<Plug>MarkdownPreview`                 | `n`          | *live markdown preview*                  |
| `<Leader>M`  | `<Plug>MarkdownPreviewStop`             | `n`          | *stop markdown preview*                  |
| `<Leader>G`  | `<CMD>lua _G.__fterm_gitui()<CR>`       | `n`          | *trigger gitui*                          |
| `<Leader>b`  | `:Bracey<CR>`                           | `n`          | *live html server*                       |
| `<Leader>B`  | `:BraceyStop<CR>`                       | `n`          | *stop html server*                       |
| `<leader>Gd` | `:Gvdiffsplit<CR>`                      | `n`          | *open fugitive diff*                     |
| `<Leader>dh` | `:diffget //2<CR>`                      | `n`          | *to buffer diff left*                    |
| `<Leader>dl` | `:diffget //3<CR>`                      | `n`          | *to buffer diff right*                   |
| `K`          | `:Lspsaga hover_doc<CR>`                | `n`          | *hover doc of lsp*                       |
| `gd`         | `<Cmd>lua vim.lsp.buf.definition()<CR>` | `n`          | *go to definition*                       |
| `gD`         | `<Cmd>lua vim.lsp.buf.declaration()<CR>`| `n`          | *go to declaration*                      |
| `<Leader>gd` | `:Lspsaga preview_definition<CR>`       | `n`          | *lspsaga preview definition*             |
| `K`          | `:move \'<-2<CR>gv-gv`                  | `v` or `x`   | *move lines of code up*                  |
| `J`          | `:move \'>+1<CR>gv-gv`                  | `v` or `x`   | *move lines of code down*                |
| `<C-h>`      | `:wincmd h<CR>`                         | `n`          | *move between split views*               |
| `<C-j>`      | `:wincmd j<CR>`                         | `n`          | *move between split views*               |
| `<C-k>`      | `:wincmd k<CR>`                         | `n`          | *move between split views*               |
| `<C-l>`      | `:wincmd l<CR>`                         | `n`          | *move between split views*               |
| `ea`         | `:EasyAlign (_)`                        | `v`          | *Alignment with a character,then enter*  |



---


Thanks to all authors of [these plugin](./lua/plugins.lua).


## LICENSE

[MIT](./LICENSE)
