local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer plugins is not found")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use({ "kyazdani42/nvim-tree.lua", branch = "master" })
  use "nvim-lualine/lualine.nvim"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  --[[ use "Pocco81/auto-save.nvim" ]]
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "jedrzejboczar/possession.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use 'kazhala/close-buffers.nvim'
  use "MattesGroeger/vim-bookmarks"
  use "ThePrimeagen/harpoon"
  use "Djancyp/cheat-sheet"
  use "kylechui/nvim-surround"
  use 'dstein64/nvim-scrollview'

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  -- Colorschemes
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"
  use 'olimorris/onedarkpro.nvim'
  use 'dracula/vim'
  use "lunarvim/Onedarker.nvim"
  use "bluz71/vim-nightfly-guicolors"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- Manage and install lsp servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  --[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer ]]
  -- LSP server configuration
  use "neovim/nvim-lspconfig" -- enable LSP
  use ({ "glepnir/lspsaga.nvim", branch= "main"  })
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "mfussenegger/nvim-dap"
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use 'theHamsta/nvim-dap-virtual-text'
  use "folke/trouble.nvim" -- A pretty diagnostics, references, telescope results, quickfix and location list
  use "ray-x/lsp_signature.nvim"
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Test
  use { "nvim-neotest/neotest", requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim" } }

  --  Rust
  use "simrat39/rust-tools.nvim"

  -- Golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommanded if need floating window support
  -- use 'leoluz/nvim-dap-go'


  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-treesitter/playground"
  use "simrat39/symbols-outline.nvim"

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    --[[ tag = 'release' -- To use the latest release ]]
  }
  use "f-person/git-blame.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
