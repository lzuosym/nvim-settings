return {
  "kazhala/close-buffers.nvim",
  dependencies = {
    "akinsho/bufferline.nvim"
  },
  config = function()
    local close_buffers = require("close_buffers")
    close_buffers.setup({
      preserve_window_layout = { 'this' },
      next_buffer_cmd = function(windows)
--      close_buffers.cycle(1)
        require('bufferline').cycle(1)
        local bufnr = vim.api.nvim_get_current_buf()

        for _, window in ipairs(windows) do
          vim.api.nvim_win_set_buf(window, bufnr)
        end
      end,
    })

    -- https://github.com/kazhala/close-buffers.nvim
    vim.api.nvim_set_keymap('n', '<leader>bh', "<cmd>lua require('close_buffers').delete({type = 'hidden'})<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bu', "<cmd>lua require('close_buffers').delete({type = 'nameless'})<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bc', "<cmd>lua require('close_buffers').delete({type = 'this'})<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<M-o>', "<cmd>lua require('close_buffers').wipe({type = 'other'})<CR><C-h><C-l>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', '<leader>bo', "<cmd>lua require('close_buffers').wipe({type = 'other'})<CR>", { noremap = true, silent = true })

  end
}
