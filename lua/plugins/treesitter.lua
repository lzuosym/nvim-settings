return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    -- vim.opt.foldmethod = "expr" -- to favor ufo.lua
    -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- https://github.com/tree-sitter/tree-sitter-typescript
    -- local ts = require('tree-sitter-typescript').typescript
    -- local tsx = require('tree-sitter-typescript').tsx
    treesitter.setup {
      --  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = { "bash", "c", "cpp", "make", "markdown", "markdown_inline",
        "cmake", "ninja", "lua", "rust", "toml", "go", "gomod",
        "proto", "query",
        "python", "regex", "yaml", "vim", "vimdoc", "graphql", "gitignore",
        "fish", "html", "json", "javascript", "typescript", "tsx", "scss",
        "css", "dockerfile", "latex" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      sync_install = false,             -- install languages synchronously (only applied to `ensure_installed`)
      ignore_install = { "" },          -- List of parsers to ignore installing
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true,    -- false will disable the whole extension
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

      playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },

      -- https://github.com/p00f/nvim-ts-rainbow
      rainbow = {
        enable = false,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        colors = {
          -- "#68a0b0",
          -- "#946EaD",
          -- "#c7aA6D",
          "Cornsilk",
          "Gold",
          "Orchid",
          "DodgerBlue",
          "Salmon",
          "LawnGreen",
        },
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        -- termcolors = {} -- table of colour name strings
      }
    }
  end
}
