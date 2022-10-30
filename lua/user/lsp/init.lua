local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not found")
  return
end

require "user.lsp.rust-tools"
require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.dap-virtual-text"
require 'user.lsp.textobjects'
