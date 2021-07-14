-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/phuoc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\nÅ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15dimensions\1\0\1\vborder\vsingle\1\0\4\6x\3\1\6y\3\0\vheight\4\0ÄÄÄˇ\3\nwidth\4\0ÄÄÄˇ\3\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["bracey.vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/bracey.vim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-whichkey-setup.lua"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/nvim-whichkey-setup.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["python-snippets"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/python-snippets"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-easy-align"
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
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vscode-go"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vscode-go"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vscode-javascript"
  },
  ["vscode-python-snippet-pack"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vscode-python-snippet-pack"
  },
  ["vscode-rust"] = {
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/vscode-rust"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nù\2\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0005\3\3\0005\4\4\0=\4\5\0035\4\a\0005\5\6\0=\5\5\0045\5\b\0=\5\t\4=\4\n\3=\3\f\2B\0\2\1K\0\1\0\vwindow\1\0\0\fplugins\ttmux\1\0\1\fenabled\1\1\0\0\1\0\3\fshowcmd\1\nruler\1\fenabled\2\foptions\1\0\6\17cursorcolumn\1\tlist\1\15signcolumn\ano\15cursorline\2\19relativenumber\2\vnumber\2\1\0\3\vheight\3\1\nwidth\3x\rbackdrop\4ÊÃô≥\6ÊÃπˇ\3\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/phuoc/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\nÅ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15dimensions\1\0\1\vborder\vsingle\1\0\4\6x\3\1\6y\3\0\vheight\4\0ÄÄÄˇ\3\nwidth\4\0ÄÄÄˇ\3\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nù\2\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0005\3\3\0005\4\4\0=\4\5\0035\4\a\0005\5\6\0=\5\5\0045\5\b\0=\5\t\4=\4\n\3=\3\f\2B\0\2\1K\0\1\0\vwindow\1\0\0\fplugins\ttmux\1\0\1\fenabled\1\1\0\0\1\0\3\fshowcmd\1\nruler\1\fenabled\2\foptions\1\0\6\17cursorcolumn\1\tlist\1\15signcolumn\ano\15cursorline\2\19relativenumber\2\vnumber\2\1\0\3\vheight\3\1\nwidth\3x\rbackdrop\4ÊÃô≥\6ÊÃπˇ\3\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
