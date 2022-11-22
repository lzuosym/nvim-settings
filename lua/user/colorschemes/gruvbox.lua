local status_ok, gruvbox = pcall(require, "gruvbox")

if not status_ok then
  vim.notify("plugin ellisonleao/gruvbox.nvim not found")
  return
end

gruvbox.setup({
  undercurl = false,
  underline = false,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
  palette_overrides = {},
})
