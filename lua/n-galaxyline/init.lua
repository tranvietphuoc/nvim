local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'dbui', 'packer'}

local colors = {
  bg = '#292D36',
  yellow = '#DCDCAA',
  dark_yellow = '#D7BA7D',
  cyan = '#4EC9B0',
  green = '#618B4E',
  light_green = '#B5CEA8',
  string_orange = '#CE9178',
  orange = '#FF8800',
  purple = '#C585C0',
  magenta = '#D16D9E',
  grey = '#858585',
  blue = '#569CDA',
  vivid_blue = '#4FC1FF',
  light_blue = '#9CDCFE',
  red = '#eb3d3d',
  error_red = '#de5d5d',
  info_yellow = '#FFEE66',
}

----- left --------

gls.left[1] = {
  FirstElement = {
    provider = function () return "▊" end,
    highlight = {colors.bg, colors.bg}
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        no = 'OPERATOR-PENDING',
        i = 'INSERT',
        ic = 'INSERT-COMPLETION',
        c = 'COMMAND',
        cv = 'VIM-EX',
        ce = 'NORMAL-EX',
        V = 'VISUAL-LINE',
        [''] = 'VISUAL-BLOCK',
        v = 'VISUAL',
        r = 'HIT-ENTER',
        rm = '--MORE',
        ['!'] = 'SHELL',
        R = 'REPLACE',
        Rv = 'VIRTUAL-REPLACE',
        s = 'SELECT',
        S = 'SELECT-LINE',
        [''] = 'SELECT-BLOCK',
        t = 'TERMINAL',
        ['r?'] = ':CONFIRM',
      }
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.blue,
        no = colors.blue,
        i = colors.green,
        ic = colors.light_green,
        c = colors.string_orange,
        cv = colors.light_blue,
        ce = colors.light_blue,
        v = colors.purple,
        [''] = colors.purple,
        V = colors.purple,
        R = colors.dark_yellow,
        Rv = colors.dark_yellow,
        t = colors.magenta,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.grey,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
      }
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim_mode])
      return alias[vim_mode] .. ' '
    end,
    highlight = {colors.bg, colors.bg}
  }
}

gls.left[3] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = ' ',
    icon = '  ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.orange, colors.bg},
  }
}

gls.left[4] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = {colors.green, colors.bg},
  }
}

gls.left[5] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.blue, colors.bg},
  }
}

gls.left[6] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red, colors.bg},
  }
}

gls.left[7] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    icon = '  ',
    highlight = { colors.fg, colors.bg },
  }
}

------ right -------

gls.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.error_red, colors.bg},
  }
}
gls.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange, colors.bg},
  }
}

gls.right[3] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.vivid_blue, colors.bg},
  }
}

gls.right[4] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.info_yellow, colors.bg},
  }
}

gls.right[5] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = {['dashboard'] = true, [' '] = true}
      if tbl[vim.bo.filetype] then return false end
      return true
    end,
    icon = ' ',
    highlight = {colors.grey, colors.bg},
  }
}
gls.right[6] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg},
  }
}

gls.right[7] = {
  FileTypeName = {
    provider = 'FileTypeName',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg},
  }
}

gls.right[8] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg},
  }
}

gls.right[9] = {
  Tabstop = {
    provider = function()
      return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
    end,
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg},
  }
}

gls.right[10] = {
  LineInfo = {
    provider = function()
      return string.format("%3d:%2d", vim.fn.line('.'), vim.fn.col('.'))
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg},
  }
}

gls.right[11] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg},
  }
}

gls.right[12] = {
  LastElement = {
    provider = function () return "▊" end,
    highlight = {colors.bg, colors.bg},
  }
}

------ short line ------

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg},
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.grey, colors.bg},
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.grey, colors.bg},
  }
}
