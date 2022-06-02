local theme = "user.lualine.evil_lualine"
local status_ok, _ = pcall(require, theme)
if not status_ok then
  vim.notify("lualine theme: " .. theme .. " not found")
  require("user.lualine.lualine-default")
end



