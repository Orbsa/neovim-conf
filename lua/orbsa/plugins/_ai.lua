require'copilot'.setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right | horizontal | vertical
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
			-- accept = "<C-Y>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = true,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})

vim.keymap.set('i', '<C-Y>', 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false
})

-- opencode binds
vim.api.nvim_set_keymap('n', '<leader>ot', '<cmd>lua require("opencode").toggle()<CR>', { noremap = true, silent = true, desc = 'Toggle embedded opencode' })
vim.api.nvim_set_keymap('n', '<leader>oa', '<cmd>lua require("opencode").ask()<CR>', { noremap = true, silent = true, desc = 'Ask opencode' })
vim.api.nvim_set_keymap('v', '<leader>oa', '<cmd>lua require("opencode").ask("@selection: ")<CR>', { noremap = true, silent = true, desc = 'Ask opencode about selection' })
vim.api.nvim_set_keymap('n', '<leader>op', '<cmd>lua require("opencode").select_prompt()<CR>', { noremap = true, silent = true, desc = 'Select prompt' })
vim.api.nvim_set_keymap('n', '<leader>on', '<cmd>lua require("opencode").command("session_new")<CR>', { noremap = true, silent = true, desc = 'New session' })
vim.api.nvim_set_keymap('n', '<leader>oy', '<cmd>lua require("opencode").command("messages_copy")<CR>', { noremap = true, silent = true, desc = 'Copy last message' })
vim.api.nvim_set_keymap('n', '<S-C-u>', '<cmd>lua require("opencode").command("messages_half_page_up")<CR>', { noremap = true, silent = true, desc = 'Scroll messages up' })
vim.api.nvim_set_keymap('n', '<S-C-d>', '<cmd>lua require("opencode").command("messages_half_page_down")<CR>', { noremap = true, silent = true, desc = 'Scroll messages down' })

