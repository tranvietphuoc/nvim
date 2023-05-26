# My configurations for Neovim editor

Currently, I use `Neovim` on `macOS`, so this guide will work well on `macOS` only. I will update for another platforms in future.
This configuration supports (includes syntax highlighting and autocompletion) for these main languages:

-   `Python`
-   `Javascript`
-   `Typescript`
-   `Rust`
-   `C`
-   `C++`
-   `Go`
-   `Html`
-   `Css`
-   `Lua`
-   `Cmake`
-   `Json`
-   `Docker`
-   `Yaml`
-   `Java`
-   `Scala`
-   `C#`

## Prerequisites:

You need to install these tools first:

-   [pyenv](https://github.com/pyenv/pyenv)
-   [neovim](https://github.com/neovim/neovim)
-   `python3.+`
-   `nodejs` and `npm`
-   [luajit](https://luajit.org/luajit.html)
-   [gitui](https://github.com/extrawurst/gitui)
-   [stylua](https://github.com/JohnnyMorganz/StyLua)
-   [pmd](https://pmd.github.io/latest/)
-   [openjdk](https://www.freecodecamp.org/news/install-openjdk-free-java-multi-os-guide/)
-   [dotnet-sdk](https://learn.microsoft.com/en-us/dotnet/core/install/)

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

### 1. Install.

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

**The languages servers is automatically install later.**

**For debuggers install**

I use [vimspector](https://github.com/puremourning/vimspector) as a debugger adapter.

You can add more `gadgets` by adding in `lua/debugger/init.lua`. Then run `:VimspectorInstall` to install gadgets.

**You can config your settings in** `config/init.lua` **file.**

### 2. Some basic keys mapping of this configuration.

Because this configuration using `which-key.nvim`. So you can see all keymapping when you almostly type in normal mode and visual mode.

### 3. For debugging.

You need to add `.vimspector.json` to your local project to add debugging configurations first. The guide's [here](https://puremourning.github.io/vimspector/configuration.html).

This configuration of `Vimspector` uses `HUMAN` mode, so there are some key in debugging:

-   Toggle breakpoint using `F9`
-   Trigger debugging UI using `F3`
-   Toggle debugging UI using `F4`
-   Launch debugger using `F5`
-   Step into using `F11`
-   Step out using `F12`
-   Step over using `F10`

## Todo

Thanks to all authors of [these plugin](./lua/plugins.lua).

## LICENSE

[MIT](./LICENSE)
