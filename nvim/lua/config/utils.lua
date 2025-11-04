local M = {}

-- Helper function to open Diffview from Telescope picker
function M.telescope_to_diffview(picker_fn, suffix)
	return function()
		picker_fn({
			attach_mappings = function(_, map)
				local function open_diffview(prompt_bufnr)
					local selection = require('telescope.actions.state').get_selected_entry()
					require('telescope.actions').close(prompt_bufnr)
					vim.cmd('DiffviewOpen ' .. selection.value .. (suffix or ''))
				end
				map('i', '<CR>', open_diffview)
				map('n', '<CR>', open_diffview)
				return true
			end
		})
	end
end

-- Helper function to open DiffviewFileHistory from Telescope picker
function M.telescope_to_diffview_file_history(picker_fn, suffix)
	return function()
		picker_fn({
			attach_mappings = function(_, map)
				local function open_file_history(prompt_bufnr)
					local selection = require('telescope.actions.state').get_selected_entry()
					require('telescope.actions').close(prompt_bufnr)
					vim.cmd('DiffviewFileHistory ' .. selection.value .. (suffix or ''))
				end
				map('i', '<CR>', open_file_history)
				map('n', '<CR>', open_file_history)
				return true
			end
		})
	end
end

return M
