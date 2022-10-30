local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  vim.notify("plugin nvim-surround not found")
end

surround.setup({})
