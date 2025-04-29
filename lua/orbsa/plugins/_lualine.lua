local function window()
  return vim.api.nvim_win_get_number(0)
end

-- LUA LINES, https://github.com/nvim-lualine/lualine.nvim#default-configuration
local winbar = {
	{
    '%m',
		show_modified_status = true,
		symbols = {
			modified = '[+]',      -- Text to show when the file is modified.
			readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
			unnamed = '[No Name]', -- Text to show for unnamed buffers.
			newfile = '[New]',     -- Text to show for newly created file before first write
		}
	}
}

require'lualine'.setup {
	sections = {
		lualine_a = {
			{ window },
			{ 'mode', upper = true }
		},
    lualine_c = {
      --  'filename',
      'lsp_progress'
    }
	},
  tabline = {
    lualine_a = {{
        'buffers',
        -- show_filename_only = false,
        mode = 4,
        max_length = vim.o.columns,
        filetype_names = {
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha',
          fugitive = 'Fugitive',
          ['harpoon-menu'] = 'Harpoon',
        },
    }},
  },
	inactive_sections = {
		lualine_a = {
			{ window }
		}
	},
	options = {
    component_separators = { left = '⧹', right = '⧸'},
    section_separators = { left = '', right = ''},
    -- theme =  'horizon',
    theme = 'seoul256',
		globalstatus = true,
    extensions = {
      'oil',
      'man',
      'fzf',
   },
	}
}
