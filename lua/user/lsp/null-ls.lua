local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("null-ls plugin not found")
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- local completion = null_ls.builtins.completion

null_ls.setup({
  debug = false,
  sources = {
    -- formatting
    formatting.eslint_d,
    formatting.buf,
    formatting.clang_format,
    --[[ formatting.rustfmt, ]]
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- formatting.black.with({ extra_args = { "--fast" } }), -- if you don't need sanity check
    formatting.black,
    -- formatting.stylua,

    -- diagnostics
    diagnostics.flake8,
    diagnostics.eslint,
    diagnostics.write_good,

    -- completion
    -- completion.spell, -- break gq{normal} ??????
  },
})
