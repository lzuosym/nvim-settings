return {
  "glepnir/lspsaga.nvim",
  branch = "main",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("lspsaga").setup({})
  end
}
