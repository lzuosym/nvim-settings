local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("nvim-treesitter.configs not found")
  return
end

-- https://github.com/tree-sitter/tree-sitter-typescript
-- local ts = require('tree-sitter-typescript').typescript
-- local tsx = require('tree-sitter-typescript').tsx

configs.setup {
  --  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "bash", "c", "cpp", "make", "markdown", "cmake", "ninja", "lua", "rust", "toml", "go", "gomod", "proto",
    "python", "regex", "yaml", "vim", "graphql", "gitignore",
    "fish", "html", "json", "javascript", "typescript", "tsx", "scss",
    "css", "dockerfile", "latex" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  --  indent = { enable = true, disable = { "yaml" } },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false, -- ????
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
