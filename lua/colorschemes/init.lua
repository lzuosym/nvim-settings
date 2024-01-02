require 'colorschemes.onedarkpro'
require 'colorschemes.gruvbox'

-- local colorscheme = "darkplus"
local colorscheme = "onedark"
-- local colorscheme = "sonokai"
-- local colorscheme = "monokai"

-- vim.g.tokyonight_style = "night"
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- if colorscheme == 'monokai' then
--   require 'colorschemes.monokai'
-- end

-- vim.cmd [[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]
