-- npm install -g vscode-html-languageserver-bin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  -- cmd = {"node", DATA .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio"},
  cmd = {"vscode-html-language-server", "--stdio"},
  filetypes = {"html", "htmldjango"},
  on_attach = require'lsp'.common_on_attach,
  capabilities = capabilities,
  init_options = {
    configurationSection = { "html"},
    embeddedLanguages = {
      css = true,
      javascript = true,
    }
  }
}