-- Enable line numbers
vim.opt.number = true
vim.wo.relativenumber = true

-- vim.opt.fillchars = { vert = '|' }
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
vim.cmd("colorscheme miasma")
-- Remove background
-- vim.cmd([[
--   highlight TelescopeBorder guibg=NONE ctermbg=NONE
--   highlight TelescopePromptBorder guibg=NONE ctermbg=NONE
--   highlight TelescopeResultsBorder guibg=NONE ctermbg=NONE
--   highlight TelescopePreviewBorder guibg=NONE ctermbg=NONE
--   highlight Normal ctermbg=NONE guibg=NONE
--   highlight NormalFloat ctermbg=NONE guibg=NONE
--   highlight SignColumn ctermbg=NONE guibg=NONE
--   highlight WinBar ctermbg=NONE guibg=NONE
--   highlight WinBarNC ctermbg=NONE guibg=NONE
--   highlight PlenaryWindow ctermbg=NONE guibg=NONE
--   highlight CursorLine ctermbg=NONE guibg=NONE
--   highlight CursorColumn ctermbg=NONE guibg=NONE
--   highlight ColorLine ctermbg=NONE guibg=NONE
--   highlight ColorColumn ctermbg=NONE guibg=NONE
--   highlight ZenBg ctermbg=NONE guibg=NONE
-- ]])

-- Box Drawings 
vim.diagnostic.config({
  float = {
    border = "rounded",
  },
})
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'rounded'
  },
  vim.lsp.handlers.signature_help, {
    border = 'single'
  }
)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = { priority = 11 },
    underline = true,
    virtual_text = true,
    update_in_insert = false,
  }
)
