vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
-- auto save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format( { async = false })]]
