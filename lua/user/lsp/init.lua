local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not found")
  return
end

-- LSP_SERVERS = { "jsonls", "sumneko_lua", "pyright", "yamlls", "bashls", "clangd", "tsserver", "gopls", "cmake", "html", "bufls",
LSP_SERVERS = { "jsonls", "sumneko_lua", "pyright", "yamlls", "bashls", "tsserver", "gopls", "cmake", "html", "bufls","clangd",
  "dockerls"}
  --[[ "dockerls", "rust_analyzer"} ]]

require "user.lsp.lspsaga"
require "user.lsp.mason"
require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.dap-virtual-text"
require 'user.lsp.textobjects'
-- require 'user.lsp.lsp_lines'
require 'user.lsp.signature'
require 'user.lsp.lspkind'
require "user.lsp.rust-tools"
require "user.lsp.fidget"
