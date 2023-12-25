local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not found")
  return
end

-- Disable yamlls, https://github.com/redhat-developer/yaml-language-server/issues/912
-- LSP_SERVERS = { "jsonls", "sumneko_lua", "pyright", "yamlls", "bashls", "clangd", "tsserver", "gopls", "cmake", "html", "bufls",
LSP_SERVERS = { "jsonls", "lua_ls", "pyright", "bashls", "tsserver", "gopls", "cmake", "html", "bufls","clangd", "dockerls"}
   -- "dockerls", "rust_analyzer", "yamlls"}

require "lsp.lspsaga"
require "lsp.mason"
require "lsp.configs"
require("lsp.handlers").setup()
require 'lsp.textobjects'
-- require "lsp.null-ls"
-- require 'lsp.lsp_lines'


