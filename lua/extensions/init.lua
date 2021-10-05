local M = {}

function M.setup()
  require('extensions.autopairs')
  require('extensions.barbar')
  require('extensions.colorizer')
  require('extensions.dash')
  require('extensions.db-completion')
  require('extensions.devicon')
  require('extensions.doge')
  require('extensions.easy-align')
  require('extensions.emmet')
  
  require('extensions.fugitive')
  require('extensions.galaxy-line')
  require('extensions.git-blame')
  require('extensions.git-ui').setup()
  require('extensions.indent')
  require('extensions.markdown')
  require('extensions.signify')
  require('extensions.tagbar')
  require('extensions.telescope').setup()
  require('extensions.tree').setup()
  require('extensions.ts-rainbow').setup()
  require('extensions.whichkey').setup()
  require('extensions.terminal').setup()
  require('extensions.lightbulb').setup()
end

return M
