-- Enable line numbers
vim.opt.number = true
vim.wo.relativenumber = true

-- Set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.smarttab = true
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true
vim.opt.filetype = "auto"
vim.opt.smartcase = true

-- Text Rendering
vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 5

-- autoupdate when unchanged
vim.opt.autoread = true

-- theme
vim.cmd("colorscheme zephyr")
-- Remove background
vim.cmd([[
  highlight TelescopeBorder guibg=NONE ctermbg=NONE
  highlight TelescopePromptBorder guibg=NONE ctermbg=NONE
  highlight TelescopeResultsBorder guibg=NONE ctermbg=NONE
  highlight TelescopePreviewBorder guibg=NONE ctermbg=NONE
  highlight Normal ctermbg=none guibg=none
  highlight SignColumn ctermbg=none guibg=none
  highlight WinBar ctermbg=none guibg=none
  highlight WinBarNC ctermbg=none guibg=none
  highlight PlenaryWindow ctermbg=none guibg=none
  highlight CursorLine ctermbg=none guibg=none
  highlight CursorColumn ctermbg=none guibg=none
  highlight ColorLine ctermbg=none guibg=none
  highlight ColorColumn ctermbg=none guibg=none
]])
