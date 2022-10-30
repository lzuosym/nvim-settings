local status_ok, cmp = pcall(require, "nvim-cmp")
if not status_ok then
  return
end
cmp.setup {
  window = {
    documentation = cmp.config.window.bordered(),
  },
}
