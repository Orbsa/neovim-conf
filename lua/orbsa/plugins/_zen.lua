require'zen-mode'.setup {
  on_open = function()
    require'lualine'.hide()
  end,
  on_close = function()
    require'lualine'.hide({unhide = true})
  end,
  plugins = {
    gitsigns = { enabled = true },
    tmux = { enabled = true },
  }
}
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<CR>", { noremap = true, silent = true, desc = "Toggle Zen Mode" })

