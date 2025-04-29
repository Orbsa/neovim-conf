vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)
-- comments
-- In normal mode, execute "gcc" (comment the current line)
vim.keymap.set("n", "<C-_>", "<cmd>norm gcc<CR>", { noremap = true, silent = true })

-- In insert mode, leave insert mode, then execute "gcc"
vim.keymap.set("i", "<C-_>", "<Esc><cmd>norm gcc<CR>", { noremap = true, silent = true })

-- In visual and operator-pending modes, use "gc" for commenting the selection
vim.keymap.set({ "v", "o" }, "<C-_>", "<cmd>norm gc<CR>", { noremap = true, silent = true })

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.api.nvim_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true, desc = "LSP Rename" })
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true, desc = "Show Code Actions"})
vim.api.nvim_set_keymap('n', '<leader>ch', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>', { noremap = true, silent = true,  desc = "Toggle Inlay Hints"})
vim.api.nvim_set_keymap('n', '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true, desc = "Show Line Error" })
vim.api.nvim_set_keymap('n', '<leader>cE', '<cmd>lua vim.diagnostic.setqflist()<CR>', { noremap = true, silent = true, desc = "Show Error List"})

