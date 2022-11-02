local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason plugin not found")
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig plugin not found")
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = { "jsonls", "sumneko_lua", "pyright", "yamlls", "bashls", "clangd", "tsserver", "gopls", "cmake", "html" }
})
