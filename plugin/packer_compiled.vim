" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["LanguageClient-neovim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/LanguageClient-neovim"
  },
  ale = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/csv.vim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  indentLine = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lightline-bufferline"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/lightline-bufferline"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin"
  },
  ["nvim-lua-guide"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-lua-guide"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/papercolor-theme"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["python-mode"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/python-mode"
  },
  ["python-syntax"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/python-syntax"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/typescript-vim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-jsx"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-jsx"
  },
  ["vim-jsx-typescript"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-jsx-typescript"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-nerdtree-tabs"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-nerdtree-tabs"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-racer"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-racer"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
