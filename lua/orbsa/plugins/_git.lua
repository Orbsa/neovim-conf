require('neogit').setup{}

require'gitsigns'.setup{
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		-- Navigation
		vim.keymap.set('n', ']h', function()
			if vim.wo.diff then return ']h' end
			vim.schedule(function() gs.next_hunk() end)
			return '<Ignore>'
		end, {expr=true})

		vim.keymap.set('n', '[h', function()
			if vim.wo.diff then return '[h' end
			vim.schedule(function() gs.prev_hunk() end)
			return '<Ignore>'
		end, {expr=true})

		-- Actions
		vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { desc = "Stage Hunk" })
		vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { desc = "Reset Hunk" })
		vim.keymap.set('v', '<leader>ds', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage Selection" })
		vim.keymap.set('v', '<leader>dr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset Selection" })

		vim.keymap.set('n', '<leader>dS', gs.stage_buffer, {  desc = "Stage Buffer" })
		vim.keymap.set('n', '<leader>du', gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
		vim.keymap.set('n', '<leader>dR', gs.reset_buffer, { desc = "Reset Buffer" })
		vim.keymap.set('n', '<leader>dp', gs.preview_hunk, { desc = "Preview Hunk" })
		vim.keymap.set('n', '<leader>dB', function() gs.blame_line{full=true} end, { desc = "Blame Line" })
		vim.keymap.set("n", "<leader>db", gs.toggle_current_line_blame, { desc = "Toggle Blame Line" })
		vim.keymap.set('n', '<leader>dd', gs.diffthis, { desc = "Diff This" })
		vim.keymap.set('n', '<leader>dD', function() gs.diffthis('~') end, { desc = "Diff This (cached)" })
		-- vim.keymap.set('n', '<leader>td', gs.toggle_deleted)

		-- Text object
		vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}
