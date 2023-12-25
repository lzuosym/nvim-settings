return {
  "dstein64/nvim-scrollview",
  config = function()
    local scrollview = require("scrollview")

    local opt = {
      excluded_filetypes = {'nerdtree'},
      current_only = true,
      winblend = 75,
      base = 'right',
      --[[ column = 180 ]]
    }
    scrollview.setup(opt)
  end
}
