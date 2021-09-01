require('lint').linters_by_ft = {
  python = {'flake8', 'mypy'},
  c = {'clangtidy'},
  javascript = {'eslint'},
  lua = {'luacheck'},
  typescript = {'eslint'},
}
