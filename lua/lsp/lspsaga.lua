-- https://github.com/glepnir/lspsaga.nvim
local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  vim.notify("plugin lspsaga is not found")
  return
end

-- saga.init_lsp_saga({
saga.setup({
  request_timeout = 2000,
  preview = {
    lines_above = 0,
    lines_below = 40,
  },
  scroll_preview = {
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  finder = {
    edit = { 'o', '<CR>' },
    vsplit = 's',
    split = 'i',
    tabe = 't',
    quit = { 'q', '<ESC>' },
  },
  definition = {
    edit = { 'o', '<CR>' },
    -- edit = '<CR>',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
    close = '<Esc>',
  },

  code_action = {
    num_shortcut = true,
    keys = {
      jump_key = 'o',
      quit = 'q',
      exec = '<CR>',
    },
  },

  move_in_saga = { prev = "C-k", next = "<C-j>" },
  finder_action_keys = {
    open = "<CR>",
  },
  definition_action_keys = {
    edit = { 'o', '<CR>' },
    -- edit = "<CR>",
  },

  lightbulb = {
    enable = false,
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
    win_width = 50,
    auto_enter = true,
    auto_preview = false,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  diagnostic = {
    twice_into = false,
    show_code_action = true,
    show_source = true,
    keys = {
      exec_action = 'o',
      quit = 'q',
      go_action = 'g'
    },
  },
  symbol_in_winbar = {
    enable = false,
    separator = ' ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
  },
  ui = {
    -- currently only round theme
    theme = 'round',
    -- border type can be single,double,rounded,solid,shadow.
    border = 'rounded',
    title = true,
    winblend = 0,
    expand = '',
    collapse = '',
    code_action = '💡',
    diagnostic = '🐞',
    incoming = ' ',
    outgoing = ' ',
    hover = ' ',
    kind = {},
  }
  -- ui = {
  --   -- currently only round theme
  --   theme = 'round',
  --   -- border type can be single,double,rounded,solid,shadow.
  --   border = 'solid',
  --   winblend = 0,
  --   expand = '',
  --   collapse = '',
  --   preview = ' ',
  --   code_action = '💡',
  --   diagnostic = '🐞',
  --   incoming = ' ',
  --   outgoing = ' ',
  --   colors = {
  --     --float window normal bakcground color
  --     normal_bg = '#1d1536',
  --     --title background color
  --     title_bg = '#afd700',
  --     red = '#e95678',
  --     magenta = '#b33076',
  --     orange = '#FF8700',
  --     yellow = '#f7bb3b',
  --     green = '#afd700',
  --     cyan = '#36d0e0',
  --     blue = '#61afef',
  --     purple = '#CBA6F7',
  --     white = '#d1d4cf',
  --     black = '#1c1c19',
  --     -- black = '#8cfc59', -- my
  --   },
  --   kind = {},
  -- },
})
