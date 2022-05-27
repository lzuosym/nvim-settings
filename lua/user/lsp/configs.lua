local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("nvim-lsp-installer not found")
  return
end

local lspconfig = require("lspconfig")

-- local servers = { "jsonls", "sumneko_lua", "pyright", "rust_analyzer", "yamlls", "bashls" }
local servers = { "jsonls", "sumneko_lua", "pyright", "yamlls", "bashls" }

lsp_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  else
    vim.notify("user.lsp.settings." .. server .. " not found")
  end
  if server == "rust_analyzer" then
    -- require("user.lsp.rust-tools")
    -- require("rust-tools").setup({opts})
    lspconfig[server].setup(opts)
  else
    lspconfig[server].setup(opts)
  end
end
