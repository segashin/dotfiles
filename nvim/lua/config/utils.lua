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

-- Telescope picker for plugin commands (Gitsigns, Neotree, etc.)
function M.plugin_commands_picker()
	local pickers = require('telescope.pickers')
	local finders = require('telescope.finders')
	local conf = require('telescope.config').values
	local actions = require('telescope.actions')
	local action_state = require('telescope.actions.state')

	-- Curated list of plugin commands with descriptions
	local plugin_commands = {
		-- Gitsigns commands
		{ plugin = "gitsigns", name = "toggle_signs",              desc = "[Git] Toggle git signs in gutter" },
		{ plugin = "gitsigns", name = "toggle_numhl",              desc = "[Git] Toggle line number highlighting" },
		{ plugin = "gitsigns", name = "toggle_linehl",             desc = "[Git] Toggle line highlighting" },
		{ plugin = "gitsigns", name = "toggle_word_diff",          desc = "[Git] Toggle word diff highlighting" },
		{ plugin = "gitsigns", name = "toggle_current_line_blame", desc = "[Git] Toggle blame for current line" },
		{ plugin = "gitsigns", name = "toggle_deleted",            desc = "[Git] Toggle showing deleted lines" },
		{ plugin = "gitsigns", name = "stage_hunk",                desc = "[Git] Stage current hunk" },
		{ plugin = "gitsigns", name = "reset_hunk",                desc = "[Git] Reset/unstage current hunk" },
		{ plugin = "gitsigns", name = "stage_buffer",              desc = "[Git] Stage entire buffer" },
		{ plugin = "gitsigns", name = "undo_stage_hunk",           desc = "[Git] Undo last stage" },
		{ plugin = "gitsigns", name = "reset_buffer",              desc = "[Git] Reset entire buffer" },
		{ plugin = "gitsigns", name = "preview_hunk",              desc = "[Git] Preview hunk in floating window" },
		{ plugin = "gitsigns", name = "blame_line",                desc = "[Git] Show blame for current line" },
		{ plugin = "gitsigns", name = "diffthis",                  desc = "[Git] Open diff for current file" },
		{ plugin = "gitsigns", name = "next_hunk",                 desc = "[Git] Jump to next hunk" },
		{ plugin = "gitsigns", name = "prev_hunk",                 desc = "[Git] Jump to previous hunk" },
		{ plugin = "gitsigns", name = "setqflist",                 desc = "[Git] Send all hunks to quickfix list" },
		{ plugin = "gitsigns", name = "setloclist",                desc = "[Git] Send all hunks to location list" },
		
		-- Neotree commands
		{ plugin = "neotree", name = "filesystem toggle",          desc = "[Tree] Toggle file tree" },
		{ plugin = "neotree", name = "filesystem show",            desc = "[Tree] Show file tree" },
		{ plugin = "neotree", name = "filesystem close",           desc = "[Tree] Close file tree" },
		{ plugin = "neotree", name = "filesystem reveal",          desc = "[Tree] Reveal current file in tree" },
		{ plugin = "neotree", name = "buffers toggle",             desc = "[Tree] Toggle buffer list" },
		{ plugin = "neotree", name = "buffers show",               desc = "[Tree] Show buffer list" },
		{ plugin = "neotree", name = "git_status toggle",          desc = "[Tree] Toggle git status view" },
		{ plugin = "neotree", name = "git_status show",            desc = "[Tree] Show git status" },
		{ plugin = "neotree", name = "close",                      desc = "[Tree] Close all neotree windows" },
		{ plugin = "neotree", name = "focus",                      desc = "[Tree] Focus neotree window" },
		
		-- Diffview commands
		{ plugin = "cmd", name = "DiffviewOpen",                   desc = "[Diff] Open diff view" },
		{ plugin = "cmd", name = "DiffviewOpen HEAD",              desc = "[Diff] Open diff view (all changes)" },
		{ plugin = "cmd", name = "DiffviewClose",                  desc = "[Diff] Close diff view" },
		{ plugin = "cmd", name = "DiffviewToggle",                 desc = "[Diff] Toggle diff view" },
		{ plugin = "cmd", name = "DiffviewFileHistory",            desc = "[Diff] File history (current file)" },
		{ plugin = "cmd", name = "DiffviewFileHistory %",          desc = "[Diff] File history (current file)" },
		{ plugin = "cmd", name = "DiffviewRefresh",                desc = "[Diff] Refresh diff view" },
		
		-- Telescope commands
		{ plugin = "telescope", name = "find_files",               desc = "[Find] Find files" },
		{ plugin = "telescope", name = "live_grep",                desc = "[Find] Live grep" },
		{ plugin = "telescope", name = "buffers",                  desc = "[Find] List buffers" },
		{ plugin = "telescope", name = "oldfiles",                 desc = "[Find] Recent files" },
		{ plugin = "telescope", name = "command_history",          desc = "[Find] Command history" },
		{ plugin = "telescope", name = "search_history",           desc = "[Find] Search history" },
		{ plugin = "telescope", name = "help_tags",                desc = "[Find] Help tags" },
		{ plugin = "telescope", name = "keymaps",                  desc = "[Find] Keymaps" },
		{ plugin = "telescope", name = "commands",                 desc = "[Find] Commands" },
		{ plugin = "telescope", name = "git_commits",              desc = "[Find] Git commits" },
		{ plugin = "telescope", name = "git_branches",             desc = "[Find] Git branches" },
		{ plugin = "telescope", name = "git_status",               desc = "[Find] Git status" },
		{ plugin = "telescope", name = "treesitter",               desc = "[Find] Treesitter symbols" },
		{ plugin = "telescope", name = "resume",                   desc = "[Find] Resume last picker" },
		{ plugin = "telescope", name = "pickers",                  desc = "[Find] Previous pickers" },
		{ plugin = "cmd", name = "Telescope file_browser",         desc = "[Find] File browser" },
		
		-- LazyGit commands
		{ plugin = "cmd", name = "LazyGit",                        desc = "[Git] Open LazyGit" },
		{ plugin = "cmd", name = "LazyGitCurrentFile",             desc = "[Git] LazyGit (current file)" },
		{ plugin = "cmd", name = "LazyGitFilter",                  desc = "[Git] LazyGit filter" },
		
		-- Neogit commands
		{ plugin = "cmd", name = "Neogit",                         desc = "[Git] Open Neogit" },
		{ plugin = "cmd", name = "Neogit commit",                  desc = "[Git] Neogit commit" },
		
		-- No-Neck-Pain commands
		{ plugin = "cmd", name = "NoNeckPain",                     desc = "[UI] Toggle centered layout" },
		{ plugin = "cmd", name = "NoNeckPainResize 80",            desc = "[UI] Resize to 80 columns" },
		{ plugin = "cmd", name = "NoNeckPainResize 120",           desc = "[UI] Resize to 120 columns" },
		{ plugin = "cmd", name = "NoNeckPainResize 150",           desc = "[UI] Resize to 150 columns" },
		
		-- Barbar commands
		{ plugin = "cmd", name = "BufferNext",                     desc = "[Buffer] Next buffer" },
		{ plugin = "cmd", name = "BufferPrevious",                 desc = "[Buffer] Previous buffer" },
		{ plugin = "cmd", name = "BufferClose",                    desc = "[Buffer] Close buffer" },
		{ plugin = "cmd", name = "BufferCloseAllButCurrent",       desc = "[Buffer] Close all but current" },
		{ plugin = "cmd", name = "BufferPick",                     desc = "[Buffer] Pick buffer" },
		{ plugin = "cmd", name = "BufferOrderByDirectory",         desc = "[Buffer] Order by directory" },
		{ plugin = "cmd", name = "BufferOrderByLanguage",          desc = "[Buffer] Order by language" },
		
		-- Colorizer commands
		{ plugin = "cmd", name = "ColorizerToggle",                desc = "[UI] Toggle color highlighting" },
		{ plugin = "cmd", name = "ColorizerAttachToBuffer",        desc = "[UI] Attach colorizer to buffer" },
		{ plugin = "cmd", name = "ColorizerDetachFromBuffer",      desc = "[UI] Detach colorizer from buffer" },
		
		-- Markview commands
		{ plugin = "cmd", name = "Markview splitToggle",           desc = "[MD] Toggle markdown preview" },
		{ plugin = "cmd", name = "Markview splitEnable",           desc = "[MD] Enable markdown preview" },
		{ plugin = "cmd", name = "Markview splitDisable",          desc = "[MD] Disable markdown preview" },
		
		-- LSP commands
		{ plugin = "lsp", name = "hover",                          desc = "[LSP] Show hover documentation" },
		{ plugin = "lsp", name = "code_action",                    desc = "[LSP] Code actions" },
		{ plugin = "lsp", name = "format",                         desc = "[LSP] Format buffer" },
		{ plugin = "lsp", name = "rename",                         desc = "[LSP] Rename symbol" },
		{ plugin = "lsp", name = "definition",                     desc = "[LSP] Go to definition" },
		{ plugin = "lsp", name = "declaration",                    desc = "[LSP] Go to declaration" },
		{ plugin = "lsp", name = "implementation",                 desc = "[LSP] Go to implementation" },
		{ plugin = "lsp", name = "references",                     desc = "[LSP] Find references" },
		{ plugin = "lsp", name = "type_definition",                desc = "[LSP] Go to type definition" },
		{ plugin = "lsp", name = "signature_help",                 desc = "[LSP] Signature help" },
		
		-- Diagnostic commands
		{ plugin = "diagnostic", name = "open_float",              desc = "[Diag] Show diagnostics" },
		{ plugin = "diagnostic", name = "goto_next",               desc = "[Diag] Next diagnostic" },
		{ plugin = "diagnostic", name = "goto_prev",               desc = "[Diag] Previous diagnostic" },
		{ plugin = "diagnostic", name = "setloclist",              desc = "[Diag] Diagnostics to loclist" },
		{ plugin = "diagnostic", name = "setqflist",               desc = "[Diag] Diagnostics to quickfix" },

		-- Lazy.nvim commands
		{ plugin = "cmd", name = "Lazy",                           desc = "[Plugin] Open Lazy plugin manager" },
		{ plugin = "cmd", name = "Lazy sync",                      desc = "[Plugin] Sync plugins (install + update + clean)" },
		{ plugin = "cmd", name = "Lazy update",                    desc = "[Plugin] Update plugins" },
		{ plugin = "cmd", name = "Lazy clean",                     desc = "[Plugin] Remove unused plugins" },
		{ plugin = "cmd", name = "Lazy profile",                   desc = "[Plugin] Show plugin load times" },

		-- Mason commands
		{ plugin = "cmd", name = "Mason",                          desc = "[LSP] Open Mason package manager" },
		{ plugin = "cmd", name = "MasonUpdate",                    desc = "[LSP] Update Mason registries" },
		{ plugin = "cmd", name = "MasonLog",                       desc = "[LSP] Show Mason log" },

		-- Treesitter commands
		{ plugin = "cmd", name = "TSUpdate",                       desc = "[TS] Update treesitter parsers" },
		{ plugin = "cmd", name = "TSInstallInfo",                  desc = "[TS] Show installed parsers" },
	}

	-- Build a set of plugin command names for deduplication
	local plugin_cmd_names = {}
	for _, cmd in ipairs(plugin_commands) do
		if cmd.plugin == "cmd" then
			-- Extract just the command name (first word) for matching
			plugin_cmd_names[cmd.name:match("^(%S+)")] = true
		end
	end

	-- Fetch all Vim commands and add them
	local all_commands = {}

	-- Add plugin commands first (they have better descriptions)
	for _, cmd in ipairs(plugin_commands) do
		table.insert(all_commands, cmd)
	end

	-- Add user-defined commands from nvim_get_commands
	local user_cmds = vim.api.nvim_get_commands({})
	for name, def in pairs(user_cmds) do
		-- Skip if already in our curated list
		if not plugin_cmd_names[name] then
			table.insert(all_commands, {
				plugin = "cmd",
				name = name,
				desc = def.definition and def.definition ~= "" and def.definition or "[Cmd] " .. name,
			})
		end
	end

	-- Add buffer-local commands
	local buf_cmds = vim.api.nvim_buf_get_commands(0, {})
	for name, def in pairs(buf_cmds) do
		if not plugin_cmd_names[name] then
			table.insert(all_commands, {
				plugin = "cmd",
				name = name,
				desc = def.definition and def.definition ~= "" and def.definition or "[Buf] " .. name,
			})
		end
	end

	pickers.new({}, {
		prompt_title = 'Commands',
		finder = finders.new_table {
			results = all_commands,
			entry_maker = function(entry)
				return {
					value = entry,
					display = string.format("%-40s %s", entry.name, entry.desc),
					ordinal = entry.name .. " " .. entry.desc,
				}
			end
		},
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				local entry = selection.value
				
				if entry.plugin == "gitsigns" then
					-- Execute gitsigns command
					local ok, gitsigns = pcall(require, 'gitsigns')
					if ok and gitsigns[entry.name] then
						gitsigns[entry.name]()
					else
						vim.notify("Gitsigns command not found: " .. entry.name, vim.log.levels.ERROR)
					end
					
				elseif entry.plugin == "neotree" then
					-- Execute neotree command
					vim.cmd("Neotree " .. entry.name)
					
				elseif entry.plugin == "telescope" then
					-- Execute telescope builtin command
					local ok, builtin = pcall(require, 'telescope.builtin')
					if ok and builtin[entry.name] then
						builtin[entry.name]()
					else
						vim.notify("Telescope command not found: " .. entry.name, vim.log.levels.ERROR)
					end
					
				elseif entry.plugin == "lsp" then
					-- Execute LSP command
					if vim.lsp.buf[entry.name] then
						vim.lsp.buf[entry.name]()
					else
						vim.notify("LSP command not found: " .. entry.name, vim.log.levels.ERROR)
					end
					
				elseif entry.plugin == "diagnostic" then
					-- Execute diagnostic command
					if vim.diagnostic[entry.name] then
						vim.diagnostic[entry.name]()
					else
						vim.notify("Diagnostic command not found: " .. entry.name, vim.log.levels.ERROR)
					end
					
				elseif entry.plugin == "cmd" then
					-- Execute vim command
					vim.cmd(entry.name)
				end
			end)
			return true
		end,
	}):find()
end
return M
