local status_ok, monokai = pcall(require, "monokai")

if not status_ok then
  vim.notify "plugin monokai.nvim is not found"
  return
end

local palette = monokai.ristretto
palette.diff_text= '#133337'

monokai.setup {
  palette = palette,
  custom_hlgroups = {
    TSInclude = {
      fg = palette.aqua,
    },
    GitSignsAdd = {
      fg = palette.green,
      bg = palette.base2
    },
    GitSignsDelete = {
      fg = palette.pink,
      bg = palette.base2
    },
    GitSignsChange = {
      fg = palette.orange,
      bg = palette.base2
    },
    Folded = {
      guibg = '#26292C', --palette.base2,
      fg = palette.orange,
      bg = palette.base2
    },
    FoldColumn = {
      fg = palette.orange,
      bg = palette.black,
    },
    CusorLine = {
      fg = palette.orange,
      bg = palette.base2
    }
  }
}

