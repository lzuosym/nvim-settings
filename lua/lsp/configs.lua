local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

for _, server in pairs(LSP_SERVERS) do
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    if server == "gopls" then
      lspconfig[server].setup({
        cmd = { "gopls", "serve" },
        filetypes = { "go", "gomod" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        opts
      })
    else
      lspconfig[server].setup(opts)
    end
  else
    vim.notify("lsp.settings." .. server .. " not found")
  end
end
