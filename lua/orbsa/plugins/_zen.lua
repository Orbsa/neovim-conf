require'zen-mode'.setup {
  on_open = function(win)
    vim.o.cmdheight = 0
    require'lualine'.hide()
    vim.cmd('GitBlameDisable')
  end,
  on_close = function()
    vim.o.cmdheight = 1
    require'lualine'.hide({unhide = true})
    vim.cmd('GitBlameEnable')
  end,
  plugins = {
    todo = { enabled = false },
    gitsigns = { enabled = true },
    tmux = { enabled = true },
  }
}
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<CR>", { noremap = true, silent = true, desc = "Toggle Zen Mode" })

