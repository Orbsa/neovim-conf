-- Telescope
local tbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tg', tbuiltin.live_grep, { desc = "Telescope Live Grep" })
vim.keymap.set('n', '<leader>tf', tbuiltin.fd, { desc = "Telescope Find Files" })
vim.keymap.set('n', '<leader>to', tbuiltin.oldfiles, { desc = "Telescope Old Files" })
vim.keymap.set('n', '<leader>tr', tbuiltin.lsp_references, { desc = "Telescope LSP References" })
vim.keymap.set('n', '<leader>tb', tbuiltin.buffers, { desc = "Telescope Buffers" })
vim.keymap.set('n', '<leader>ts', tbuiltin.lsp_document_symbols, { desc = "Telescope LSP Document Symbols" })
vim.keymap.set('n', '<leader>tw', tbuiltin.grep_string, { desc = "Telescope Grep String" })
local tactions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { '%__virtual.cs$' },
    mappings = {
      n = {  -- This doesn't seem to work :(
        ["C-s"] = tactions.cycle_history_next,
        ["C-w"] = tactions.cycle_history_prev,
      }
    }
  }
}
