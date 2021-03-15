# My configurations for Neovim editor

Currently, I use `Neovim` on `macOS`, so this guide will work well on `macOS` only. I'll update for another platforms later...
This configuration supports (includes syntax hightlighting and autocompletion) for these languages:
* `Python`
* `Javascript`
* `Rust`
* `C`
* `C++`
* `Go`
* `Html`
* `Css`

## Prequisition:
* `neovim`
* `python3.+`
* `nodejs` and `npm`

### Neovim
In order to have all the newest features, you should install [the latest release (>=0.5.0)](https://github.com/neovim/neovim/releases/tag/nightly) but __not a highly recommended__.

### Python providers
I've used `python3` as a default version on my mac. If you use another versions of `Python`.
Please edit the `g:python3_host_prog` variable to probably path to your `Python`.
If your machine doesn't have any versions of `Python`, you could install [follow this](https://www.python.org/).
After install `Python`, you must to install `pynvim`
```
pip3 install pynvim
```

### Nodejs and npm
There're a lot of plugins that use external packages (like language server protocol,...). And we need to install [Nodejs and npm via download](https://nodejs.org/en/download/)
[or via package manager](https://nodejs.org/en/download/package-manager/).

Nvim Nodejs client is also needed:
```
npm install -g neovim
```

## How to use it?
Run this command:
```
curl -sSL https://github.com/tranvietphuoc/nvim/master/install.sh | sh
```
Then run:
```
nvim
```
to install plugins.
