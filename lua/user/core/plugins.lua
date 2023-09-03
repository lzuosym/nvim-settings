local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer plugins is not found")
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  max_jobs = 60, -- https://github.com/wbthomason/packer.nvim/issues/746
  ensure_dependencies   = true, -- Should packer install plugin dependencies?
  log = { level = 'info' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
  profile = {
    enable = true,
    threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("windwp/nvim-ts-autotag")
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("kyazdani42/nvim-web-devicons")
  use({ "kyazdani42/nvim-tree.lua", branch = "master" })
  use("nvim-lualine/lualine.nvim")
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use "Pocco81/auto-save.nvim"
  use("akinsho/toggleterm.nvim")
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("jedrzejboczar/possession.nvim")
  use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
  use("folke/which-key.nvim")
  use("kazhala/close-buffers.nvim")
  -- use("MattesGroeger/vim-bookmarks")
  use("ThePrimeagen/harpoon")
  use("Djancyp/cheat-sheet")
  use("kylechui/nvim-surround")
  use("dstein64/nvim-scrollview")
  use("nvim-pack/nvim-spectre")
  use({ "mg979/vim-visual-multi", branch = "master" })
  use { 'michaelb/sniprun', run = 'sh ./install.sh'}

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  use("kevinhwang91/promise-async")
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

  -- Colorschemes
  -- use("lunarvim/darkplus.nvim")
  use 'folke/tokyonight.nvim'
  use("olimorris/onedarkpro.nvim")
  -- use('Mofiqul/dracula.nvim')
  use('dracula/vim')
  use("sainnhe/sonokai")
  use("sainnhe/everforest")
  use("sainnhe/gruvbox-material")
  use("ellisonleao/gruvbox.nvim")
  use("tanvirtin/monokai.nvim")
  use("lunarvim/Onedarker.nvim")
  use("bluz71/vim-nightfly-guicolors")
  -- use 'navarasu/onedark.nvim'

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("hrsh7th/cmp-nvim-lsp") -- cmp lsp completion
  use("hrsh7th/cmp-vsnip") -- cmp Snippet completion
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
  use("saadparwaiz1/cmp_luasnip") -- snippet completions

  -- Manage and install lsp servers, linters and formatters
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- LSP server configuration
  use("neovim/nvim-lspconfig") -- enable LSP
  use({ "glepnir/lspsaga.nvim", branch = "main", requires = { {"nvim-tree/nvim-web-devicons"} } })
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  use("mfussenegger/nvim-dap")
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use("theHamsta/nvim-dap-virtual-text")
  use("folke/trouble.nvim") -- A pretty diagnostics, references, telescope results, quickfix and location list
  use("Maan2003/lsp_lines.nvim") -- https://github.com/Maan2003/lsp_lines.nvim/
  use("ray-x/lsp_signature.nvim")
  -- https://github.com/simrat39/symbols-outline.nvim/issues/176
  -- use({ "simrat39/symbols-outline.nvim", branch = "master" })
  -- breaks rust ????
  use('nvim-treesitter/nvim-treesitter-textobjects')
  use("onsails/lspkind.nvim")
  use("j-hui/fidget.nvim")

  -- formatting and linting
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  -- use 'sbdchd/neoformat'

  -- Test
  -- use({ "nvim-neotest/neotest", requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim" }, })

  --  Rust
  use("simrat39/rust-tools.nvim")

  -- Golang
  use("ray-x/go.nvim")
  use("ray-x/guihua.lua") -- recommanded if need floating window support
  -- use 'leoluz/nvim-dap-go'

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope-ui-select.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("nvim-treesitter/playground")
  use("nvim-treesitter/nvim-treesitter-context")
  use("p00f/nvim-ts-rainbow")

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    -- tag = 'release' -- To use the latest release
  })
  use("f-person/git-blame.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
