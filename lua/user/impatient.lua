local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  vim.notify("plugin impatient not found")
  return
end

impatient.enable_profile()

