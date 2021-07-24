require'lspconfig'.tailwindcss.setup{
  cmd = {"node", DATA .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extensions/dist/server/tailwindServer.js", "--stdio"},
  filetypes = {
    "css",
    "scss",
    "less",
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
    "postcss",
    "django-html"
  },
  root_dir = require("lspconfig/util").root_pattern("tailwind.config.js", "postcss.config.ts", ".postcssrc"),
  on_attach = require'lsp'.common_on_attach,
}
