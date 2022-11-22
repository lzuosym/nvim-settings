-- https://github.com/glepnir/lspsaga.nvim
local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  vim.notify("plugin lspsaga is not found")
  return
end

saga.init_lsp_saga({
  move_in_saga = { prev = "C-k", next = "<C-j>" },
  finder_action_keys = {
    open = "<CR>",
  },
  definition_action_keys = {
    edit = "<CR>",
  },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 30,
  finder_request_timeout = 1000,

  code_action_lightbulb = {
    enable = true,
    enable_in_insert = true,
    cache_code_action = true,
    sign = true,
    update_time = 850,
    sign_priority = 20,
    virtual_text = true,
  },
  -- show outline
  show_outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 40,
    auto_enter = true,
    auto_preview = false,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
})
