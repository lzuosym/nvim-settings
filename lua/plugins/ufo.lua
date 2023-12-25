return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async'
  },
  config = function()
    -- ufo = require("ufo")
--
--    local ftMap = {
--      vim = 'indent',
--      python = { 'indent' },
--      git = '',
--      yaml = 'indent',
--      -- rust = 'indent',
--    }
--
--    local opt = {
--      open_fold_hl_timeout = 150,
--      -- close_fold_kinds = { 'imports', 'comment', 'region' },
--      close_fold_kinds = { 'imports', 'comment', 'use' },
--      -- close_fold_kinds = { 'imports', 'comment', 'use', 'import' },
--      preview = {
--        win_config = {
--          border = { '', '─', '', '', '', '─', '', '' },
--          winhighlight = 'Normal:Folded',
--          winblend = 0
--        },
--        mappings = {
--          scrollU = '<C-u>',
--          scrollD = '<C-d>'
--        },
--      },
--      provider_selector = function(bufnr, filetype, buftype)
--        -- return a string type use internal providers
--        -- return a string in a table like a string type
--        -- return empty string '' will disable any providers
--        -- return `nil` will use default value {'lsp', 'indent'}
--
--        -- if you prefer treesitter provider rather than lsp,
--        -- return ftMap[filetype] or {'treesitter', 'indent'}
--        -- return {'treesitter', 'indent'}
--        -- return ftMap[filetype]
--        return nil
--      end
--    }
--    ufo.setup(opt)
  end
}
