return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp"
  },
  config = function()
    local auto_pairs = require("nvim-autopairs")
    auto_pairs.setup {
      check_ts = true, -- ts: TreeSitter
      ts_config = {
        lua = { "string", "source" },
        rust = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      -- :echo &ft
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = "<C-f>",
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        -- pattern = string.gsub([[ [%'%"%)%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        -- highlight = "PmenuSel",
        -- highlight_grey = "LineNr",
        highlight = 'Search',
        highlight_grey = 'Comment'
      },
    }

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  end
}
