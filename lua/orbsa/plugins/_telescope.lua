-- Telescope
local tbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tg', tbuiltin.live_grep, { desc = "Telescope Live Grep" })
vim.keymap.set('n', '<leader>tf', tbuiltin.fd, { desc = "Telescope Find Files" })
vim.keymap.set('n', '<leader>to', tbuiltin.oldfiles, { desc = "Telescope Old Files" })
vim.keymap.set('n', '<leader>tr', tbuiltin.lsp_references, { desc = "Telescope LSP References" })
vim.keymap.set('n', '<leader>tb', tbuiltin.buffers, { desc = "Telescope Buffers" })
vim.keymap.set('n', '<leader>ts', tbuiltin.lsp_document_symbols, { desc = "Telescope LSP Document Symbols" })
vim.keymap.set('n', '<leader>tw', tbuiltin.grep_string, { desc = "Telescope Grep String" })


-- Function for live grep in a selected directory
local ts_select_dir_for_grep = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local fb = require("telescope").extensions.file_browser
  local live_grep = require("telescope.builtin").live_grep
  local current_line = action_state.get_current_line()

  fb.file_browser({
    files = false,
    depth = false,
    attach_mappings = function(prompt_bufnr)
      require("telescope.actions").select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        live_grep({
          results_title = relative .. "/",
          cwd = absolute,
          default_text = current_line,
        })
      end)

      return true
    end,
  })
end


local tactions = require('telescope.actions')
local gfh_actions = require("telescope").extensions.git_file_history.actions
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { '%__virtual.cs$' },
    mappings = {
      n = {  -- This doesn't seem to work :(
        ["C-s"] = tactions.cycle_history_next,
        ["C-w"] = tactions.cycle_history_prev,
        ['<c-d>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
      }
    }
  },
  pickers = {
    live_grep = {
      mappings = {
        i = {
          ["<C-f>"] = ts_select_dir_for_grep,
        },
        n = {
          ["<C-f>"] = ts_select_dir_for_grep,
        },
      },
    },
  },
  extensions = {
      git_file_history = {
          -- Keymaps inside the picker
          mappings = {
              i = {
                  ["<C-g>"] = gfh_actions.open_in_browser,
              },
              n = {
                  ["<C-g>"] = gfh_actions.open_in_browser,
              },
          },

          -- The command to use for opening the browser (nil or string)
          -- If nil, it will check if xdg-open, open, start, wslview are available, in that order.
          browser_command = nil,
      },
  },
}
require('telescope').load_extension('conflicts')
require('telescope').load_extension('git_file_history')
