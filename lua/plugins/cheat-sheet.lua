return {
  "Djancyp/cheat-sheet",
  event = "InsertEnter",
  config = function()
    local cheet_sheet = require("cheat-sheet")
    cheet_sheet.setup({
      auto_fill = {
        filetype = true,
        current_word = true,
      },

      main_win = {
        style = "minimal",
        border = "double",
      },

      input_win = {
        style = "minimal",
        border = "double",
      },
    })
  end
}
