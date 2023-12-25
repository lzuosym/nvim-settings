return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  config = function()
    local autotag = require('nvim-ts-autotag')
    autotag.setup({
      filetypes = {
        'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx', 'jsx',
        'xml',
        'markdown',
      },
      skip_tags = {
        'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
        'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr', 'menuitem'
      }
    })
  end
}

