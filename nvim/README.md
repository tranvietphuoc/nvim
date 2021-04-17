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

Run this command:

```
curl -sSL https://github.com/tranvietphuoc/dotfiles/blob/master/nvim/install.sh | sh
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
| `<Leader>r`  |            `:RnvimrToggle<CR>`               |
|   `<TAB>`    |                 `:BufferNext<CR>`            |
|  `<S-TAB>`   |               `:BufferPrevious<CR>`          |
|   `<S-c>`    |                  `:BufferClose<CR>`          |
|     `qq`     |                   `<Esc>`                    |
| `<Leader>f`  |       `<cmd>Telescope find_files<CR>`        |
| `<Leader>F`  |        `<cmd>Telescope live_grep<CR>`        |
| `<Leader>fb` |         `<cmd>Telescope buffers<CR>`         |
| `<Leader>fh` |        `<cmd>Telescope help_tags<CR>`        |
|     `,,`     | Trigger `Leader` key in `i` mode of `emmet`  |
| `<Leader>T`  |         `g:floatterm_keymap_toggle`          |
| `<Leader>mp` |  `<Plug>MarkdownPreview` live server for md  |
| `<Leader>mq` | `<Plug>MarkdownPreviewStop` stop live server |
| `<Leader>L`  |                `:LazyGit<CR>`                |
| `<Leader>b`  | `:Bracey<CR>` live server for html, js, css  |
| `<Leader>B`  |      `:BraceyStop<CR>` stop live server      |

---


Thanks to all authors of [these plugin](./lua/plugins.lua).


## LICENSE

MIT
