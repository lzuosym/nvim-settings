require 'user.colorschemes.onedarkpro'
require 'user.colorschemes.gruvbox'

-- local colorscheme = "darkplus"
-- local colorscheme = "onedarkpro"
-- local colorscheme = "sonokai"
local colorscheme = "monokai"

-- vim.g.tokyonight_style = "night"
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

if colorscheme == 'monokai' then
  require 'user.colorschemes.monokai'
end

-- vim.cmd [[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]
