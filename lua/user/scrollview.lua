local status_ok, scrollview = pcall(require, 'scrollview')
if not status_ok then
  vim.notify("scrollview plugin not found")
  return
end

local opt = {
  excluded_filetypes = {'nerdtree'},
  current_only = true,
  winblend = 75,
  base = 'right',
  --[[ column = 180 ]]
}

scrollview.setup(opt)
