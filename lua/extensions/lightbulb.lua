require'nvim-lightbulb'.update_lightbulb {
  sign = {
    enabled = true,
    -- Priority of the gutter sign
    priority = 10,
  },
  float = {
    enabled = false,
    -- Text to show in the popup float
    text = "💡",
		win_opts = {},
  },
	virtual_text = {
    enabled = false,
    -- Text to show at virtual text
    text = "💡",
  }
}


