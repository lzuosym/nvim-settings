local options = {
  -- line number
  number = true, -- set numbered lines
  relativenumber = false, -- set relative numbered lines

  -- tabs & indentation
  autoindent = true,
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab

  -- line wrapping
  wrap = false, -- display lines as one long line

  -- search settings
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case

  -- appearance
  cursorline = false, -- highlight the current line
  guifont = 'monospace:h17', -- the font used in graphical neovim applications
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  termguicolors = true, -- set term gui colors (most terminals support this)
  --[[ background = "dark", ]]

  -- backspace
  backspace = 'indent,eol,start',

  -- clipboard
  clipboard = 'unnamedplus', -- allows neovim to access the system clipboard

  -- split windows
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window


  backup = false, -- creates a backup file
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  fileencoding = "utf-8", -- the encoding written to a file
  mouse = "a", -- allow the mouse to be used in neovim
  showmode = true, -- we don't need to see things like -- INSERT -- anymore
  smartindent = true, -- make indenting smarter again
  swapfile = false, -- creates a swapfile
  timeoutlen = 560, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  numberwidth = 4, -- set number column width to 2 {default 4}
  scrolloff = 3, -- is one of my fav
  sidescrolloff = 8,
  list = true,

 --[[ Set completeopt to have a better completion experience, :help completeopt ]]
 --[[ menuone: popup even when there's only one match ]]
 --[[ noinsert: Do not insert text until a selection is made ]]
 --[[ noselect: Do not select, force user to select one from the menu ]]
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  pumheight = 10, -- pop up menu height
  showtabline = 2, -- always show tabs

  -- for ufo folding
  -- foldcolumn = '1',
  foldlevel = 99,
  -- foldlevel = 0,
  foldlevelstart = 99,
  foldenable = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Save last cursor position whenfile reopen
vim.cmd([[
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]])

-- Highlight on yank
vim.cmd [[autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]
