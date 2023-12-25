local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  vim.notify("mason plugin not found")
  return
end

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
  vim.notify("mason-lspconfig plugin not found")
  return
end

mason.setup()

mason_lspconfig.setup({ ensure_installed = LSP_SERVERS })
