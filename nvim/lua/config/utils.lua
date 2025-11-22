local M = {}

-- Helper function to open Diffview from Telescope picker
function M.telescope_to_diffview(picker_fn, suffix, opts)
	return function()
		local picker_opts = opts or {}
		picker_opts.attach_mappings = function(_, map)
			local function open_diffview(prompt_bufnr)
				local selection = require('telescope.actions.state').get_selected_entry()
				require('telescope.actions').close(prompt_bufnr)
				vim.cmd('DiffviewOpen ' .. selection.value .. (suffix or ''))
			end
			map('i', '<CR>', open_diffview)
			map('n', '<CR>', open_diffview)
			return true
		end
		picker_fn(picker_opts)
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

-- Helper function to open DiffviewFileHistory from file picker
function M.file_picker_to_diffview_history(picker_fn, opts)
	return function()
		local picker_opts = opts or {}
		picker_opts.attach_mappings = function(_, map)
			local function open_file_history(prompt_bufnr)
				local selection = require('telescope.actions.state').get_selected_entry()
				require('telescope.actions').close(prompt_bufnr)
				-- For file pickers, use the path field or value
				local file_path = selection.path or selection.value or selection[1]
				vim.cmd('DiffviewFileHistory ' .. file_path)
			end
			map('i', '<CR>', open_file_history)
			map('n', '<CR>', open_file_history)
			return true
		end
		picker_fn(picker_opts)
	end
end

-- Helper function to open DiffviewFileHistory from telescope file browser
function M.file_browser_to_diffview_history(opts)
	return function()
		local picker_opts = opts or {}
		picker_opts.attach_mappings = function(_, map)
			local actions = require('telescope.actions')
			
			local function open_file_history(prompt_bufnr)
				local selection = require('telescope.actions.state').get_selected_entry()
				
				-- For file browser, need to convert Path object to string
				local file_path
				if selection.Path then
					-- Path is a plenary Path object, convert to string
					file_path = tostring(selection.Path)
				elseif selection.path then
					file_path = selection.path
				elseif selection.value then
					file_path = selection.value
				end
				
				-- Check if it's a directory
				if file_path then
					local stat = vim.loop.fs_stat(file_path)
					if stat and stat.type == 'directory' then
						-- If it's a directory, use default action (navigate into folder)
						actions.select_default(prompt_bufnr)
					else
						-- If it's a file, open DiffviewFileHistory
						actions.close(prompt_bufnr)
						vim.cmd('DiffviewFileHistory ' .. vim.fn.fnameescape(file_path))
					end
				end
			end
			map('i', '<CR>', open_file_history)
			map('n', '<CR>', open_file_history)
			return true
		end
		require('telescope').extensions.file_browser.file_browser(picker_opts)
	end
end

return M
