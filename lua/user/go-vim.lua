require('go').setup({
  tag_transform = 'camelcase',
  lsp_cfg = true,
  lsp_on_attach = require("user.lsp.handlers").on_attach,
})

-- vim.cmd [[autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()]]
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
