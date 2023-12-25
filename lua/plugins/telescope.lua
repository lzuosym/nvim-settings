return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "jedrzejboczar/possession.nvim",
    "folke/trouble.nvim",
  },
  config = function()
    local telescope = require("telescope")
    -- Telescope keymappings
    local keymap = vim.keymap.set

    --Add leader shortcuts
    keymap('n', '<leader>sf', require('telescope.builtin').find_files)
    keymap('n', '<leader>sp', require('telescope.builtin').grep_string)
    keymap('n', '<leader>sg', require('telescope.builtin').live_grep)

    keymap('n', '<leader><space>', require('telescope.builtin').buffers)
    -- keymap('n', '<leader>sf', function() require('telescope.builtin').find_files { previewer = false } end)
    keymap('n', '<leader>so', require('telescope.builtin').oldfiles)
    keymap('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
    keymap('n', '<leader>sh', require('telescope.builtin').help_tags)
    keymap('n', '<leader>st', require('telescope.builtin').tags)
    -- keymap('n', '<leader>so', function() require('telescope.builtin').tags { only_current_buffer = true } end)
    keymap('n', '<leader>sdl', require('telescope.builtin').diagnostics)

    -- file_browser
    keymap("n", "<space>fb", ":Telescope file_browser<cr>", { noremap = true })

    -- telescope-ui-select.nvim extension
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
    telescope.load_extension('possession')
    telescope.load_extension('fzf')

    local actions = require "telescope.actions"

    local trouble = require "trouble.providers.telescope"

    telescope.setup {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        --[[ path_display = { "smart" }, ]]

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<M-t>"] = trouble.open_with_trouble, -- trouble shortcuts ?? not working??
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<M-t>"] = trouble.open_with_trouble, -- trouble shortcuts ?? not working??

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        },
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
        }
        -- file_browser = {
        --   theme = "ivy",
        --   -- disables netrw and use telescope-file-browser in its place
        --   hijack_netrw = true,
        --   mappings = {
        --     ["i"] = {
        --       -- your custom insert mode mappings
        --     },
        --     ["n"] = {
        --       -- your custom normal mode mappings
        --     },
        --   },
        -- }
        -- pseudo code / specification for writing custom displays, like the one
        -- for "codeactions"
        -- specific_opts = {
        --   [kind] = {
        --     make_indexed = function(items) -> indexed_items, width,
        --     make_displayer = function(widths) -> displayer
        --     make_display = function(displayer) -> function(e)
        --     make_ordinal = function(e) -> string
        --   },
        --   -- for example to disable the custom builtin "codeactions" display
        --      do the following
        --   codeactions = false,
        -- }
      },
    }
  end
}
