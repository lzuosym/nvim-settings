vim.opt_local.list = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = false

vim.cmd([[au TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif]])
