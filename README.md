# My configurations for Neovim editor

Currently, I use `Neovim` on `Arch Linux`, so this guide will work well on `Arch Linux` only. I will update for another platforms in future.
This configuration supports (includes syntax highlighting and autocompletion) for these main languages:

- `Python`
- `Javascript`
- `Typescript`
- `Rust`
- `C`
- `C++`
- `Golang`
- `Html`
- `Css`
- `Lua`
- `Cmake`
- `Json`
- `Docker`
- `Yaml`
- `Java`
- `Scala`
- `C#`

## Prerequisites:

You need to install these tools first:

- [neovim](https://github.com/neovim/neovim)
- `python3.+`
- `nodejs` and `npm`
- `gcc`
- [luajit](https://luajit.org/luajit.html)
- [stylua](https://github.com/JohnnyMorganz/StyLua)
- [pmd](https://pmd.github.io/latest/)
- [java](https://wiki.archlinux.org/title/Java)
- [dotnet-sdk](https://wiki.archlinux.org/title/.NET)
- `aspnet-runtime`
- `dotnet-runtime`
- [golang](https://wiki.archlinux.org/title/Go)
- [rust](https://www.rust-lang.org/tools/install)
- [cppcheck](https://cppcheck.sourceforge.io/)

### Neovim

In order to have all the newest features, you should install the [Nightly version](https://github.com/neovim/neovim/wiki/Installing-Neovim).

And also need to install `luajit` by command: `sudo pacman -S luajit`

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

- [ ] Need to build a bash script to install it automatically
- Currently, you can only clone it into your `$HOME/.config` directory and fix it manually.

and then type to the terminal command:

```
nvim
```

to open the editor first, then run command:

```
:Lazy

```

then press: `I` or `S` or `U`

**The languages servers is automatically install later in `mason`**

**For debuggers install**

I use [dap](https://github.com/mfussenegger/nvim-dap) and [mason-dap](https://github.com/jay-babu/mason-nvim-dap.nvim) to install debuggers

**You can config your settings in** `config/init.lua` **file.**

### 2. Some basic keys mapping of this configuration.

Because this configuration using `which-key.nvim`. So you can see all keymapping when you almostly type in normal mode and visual mode.

### 3. For debugging.

- [ ] NotImplemented

### 4. Important note for `java`

To use `lombok` for your `java` project, you must put these line into your `pom.xml` file at `dependencies` tag if you're using `maven`:

```
<dependency>
	<groupId>org.projectlombok</groupId>
	<artifactId>lombok</artifactId>
	<version>1.18.28</version>
	<scope>provided</scope>
</dependency>
```

## Todo

- [ ] refactoring the whole files
- [ ] completely config nvim-dap

Thanks to all authors of [these plugin](./lua/plugins.lua).

## LICENSE

[MIT](./LICENSE)
