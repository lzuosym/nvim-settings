-- https://github.com/glepnir/lspsaga.nvim
local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  vim.notify("plugin lspsaga is not found")
  return
end

saga.init_lsp_saga({
  move_in_saga = { prev = "C-k", next = "<C-j>"},
  finder_action_keys = {
    open = "<CR>"
  },
  definition_action_keys =  {
    edit = "<CR>"
  },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 20,

})
