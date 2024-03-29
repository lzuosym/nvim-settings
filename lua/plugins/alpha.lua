return {
  "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local icons = require "icons"
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
      dashboard.button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
      -- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":Telescope sessions save_current=false <CR>"),
      dashboard.button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("u", icons.ui.CloudDownload .. " Update", ":PackerSync<CR>"),
      dashboard.button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
    }
    local function footer()
      -- NOTE: requires the fortune-mod package to work, or brew install furtunr in macos
      local handle = io.popen("fortune")
      local myFooter = "Footer"
      if handle then
        local fortune = handle:read("*a")
        if fortune then
          myFooter = fortune
        end
        handle:close()
      end
      return myFooter
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
    alpha.setup(dashboard.opts)
  end
}
